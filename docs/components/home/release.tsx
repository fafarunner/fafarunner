"use client";
import { useCallback } from "react";
import Image from "next/image";
import { FaDownload } from "react-icons/fa6";
import GithubPkg from "@/components/home/github-pkg";
import type { Release } from "@/types/github";
import type { LngProps } from "@/types/i18next-lng";

export default function Release({
  release,
  first,
  lng,
}: { release: Release; first: boolean } & LngProps) {
  const Badge = useCallback(() => {
    if (!release.prerelease && !release.draft && first) {
      return (
        <span className="h-[22px] max-w-[91px] rounded-[2rem] border-[1px] border-[#3fb950] px-[10px] text-[0.75rem] leading-[20px] text-[#3fb950] dark:border-[#3fb950] dark:text-[#3fb950]">
          Latest
        </span>
      );
    }
    if (release.prerelease && !release.draft) {
      return (
        <span className="h-[22px] max-w-[91px] rounded-[2rem] border-[1px] border-[#9a6700] px-[10px] text-[0.75rem] leading-[20px] text-[#9a6700] dark:border-[#d29922] dark:text-[#d29922]">
          Pre-release
        </span>
      );
    }
    if (!release.prerelease && release.draft) {
      return (
        <span className="h-[22px] max-w-[91px] rounded-[2rem] bg-gray-500 px-[10px] text-[0.75rem] leading-[22px] text-white">
          Draft
        </span>
      );
    }
    return null;
  }, [release]);

  return (
    <li
      key={release.id}
      className="flex flex-wrap items-center justify-between gap-x-6 gap-y-4 py-5 sm:flex-nowrap"
    >
      <div>
        <div className="flex items-center gap-2 pb-2 text-2xl font-semibold leading-6 text-gray-900 dark:text-gray-100">
          <a
            href={release.html_url}
            className="hover:underline max-md:max-w-[calc(100%-91px-0.5rem)]"
          >
            {release.tag_name || (release.draft ? "Draft" : "")}
          </a>
          <Badge />
        </div>
        <div className="mt-1 flex items-center gap-x-2 text-sm leading-5 text-gray-500 dark:text-gray-400">
          <p>
            <a href={release.author?.html_url} className="hover:underline">
              {release.author?.login}
            </a>
          </p>
          <svg viewBox="0 0 2 2" className="h-0.5 w-0.5 fill-current">
            <circle cx={1} cy={1} r={1} />
          </svg>
          <p>
            <time dateTime={release.created_at}>{release.created_at}</time>
          </p>
        </div>
      </div>
      <dl className="flex w-full flex-none justify-between gap-x-8 sm:w-auto">
        <div className="flex -space-x-0.5">
          <dt className="sr-only">Commenters</dt>
          <dd key={release.author?.id}>
            <Image
              className="h-6 w-6 rounded-full bg-gray-50 ring-2 ring-white"
              width={40}
              height={40}
              src={release.author?.avatar_url || ""}
              alt={release.author?.login || ""}
            />
          </dd>
        </div>
        <GithubPkg
          assets={release?.assets || []}
          lng={lng}
          disabled={false}
          wrapped={false}
        >
          <div className="flex cursor-pointer gap-x-2.5 text-gray-500 hover:text-green-400 dark:text-gray-400 dark:hover:text-green-300">
            <dt>
              <span className="sr-only">Total assets</span>
              <FaDownload className="h-5 w-5" aria-hidden="true" />
            </dt>
            <dd className="text-sm leading-6">{release?.assets?.length}</dd>
          </div>
        </GithubPkg>
      </dl>
    </li>
  );
}
