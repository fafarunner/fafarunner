import { basePath, pageSize } from "@/constants";
import { Release } from "@/types/github";
const headers = { "Content-Type": "application/json" };

export async function getLatestRelease() {
  const resp = await fetch(`${basePath}/backend/releases/github/latest/`, {
    method: "GET",
    headers,
    // https://nextjs.org/docs/app/building-your-application/caching
    cache: "no-store",
  });

  if (!resp.ok) {
    throw new Error("Failed to fetch data");
  }
  return await resp.json();
}

export async function getReleases(
  page: number,
  page_size: number = pageSize,
): Promise<{
  code: number;
  data?: Release[];
  msg?: string;
  timestamp: number;
} | null> {
  const resp = await fetch(
    `${basePath}/backend/releases/github/list/?page=${page}&page_size=${page_size}`,
    {
      method: "GET",
      headers,
      // https://nextjs.org/docs/app/building-your-application/caching
      cache: "no-store",
    },
  );

  if (!resp.ok) {
    throw new Error("Failed to fetch data");
  }
  return await resp.json();
}
