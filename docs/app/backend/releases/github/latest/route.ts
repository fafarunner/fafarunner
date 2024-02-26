import httpStatus from "http-status";
import github from "@/lib/github";

// https://nextjs.org/docs/app/api-reference/file-conventions/route-segment-config
export const dynamic = "force-dynamic";
// export const fetchCache = "force-no-store";

export async function GET() {
  try {
    const latestRelease = await github.repos.getLatestRelease({
      owner: process.env.NEXT_PUBLIC_GH_REPO_OWNER,
      repo: process.env.NEXT_PUBLIC_GH_REPO,
    });

    return Response.json(
      { code: 0, data: latestRelease.data, timestamp: Date.now() },
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
