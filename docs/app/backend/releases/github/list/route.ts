import httpStatus from "http-status";
import { NextResponse } from "next/server";
import github from "@/lib/github";
import schema from "@/schema";

// https://nextjs.org/docs/app/api-reference/file-conventions/route-segment-config
export const dynamic = "force-dynamic";
// export const fetchCache = "force-no-store";

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  try {
    const {
      error,
      value: { page, page_size },
    } = schema.validate({
      page: searchParams.get("page") || 1,
      page_size: searchParams.get("page_size") || 5,
    });

    if (error) {
      return NextResponse.json(
        {
          code: httpStatus.BAD_REQUEST,
          msg: "Bad request",
          timestamp: Date.now(),
        },
        { status: httpStatus.BAD_REQUEST },
      );
    }

    const res = await github.repos.listReleases({
      owner: process.env.GH_REPO_OWNER,
      repo: process.env.GH_REPO,
      page,
      per_page: page_size,
    });

    return Response.json(
      {
        code: 0,
        data: res?.data || [],
        timestamp: Date.now(),
      },
      { status: httpStatus.OK },
    );
  } catch (error: any) {
    const code = error?.status || httpStatus.INTERNAL_SERVER_ERROR;
    return Response.json(
      {
        code,
        msg: error.message || error.toString(),
        timestamp: Date.now(),
      },
      { status: code },
    );
  }
}
