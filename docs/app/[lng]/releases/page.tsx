"use client";
import React, { useState, useEffect, useCallback } from "react";
import ReleaseComp from "@/components/home/release";
import { Loading } from "@/components/shared/icons";
import { useTranslation } from "@/i18n/client";
import { pageSize } from "@/constants";
import { getReleases } from "@/request";
import type { Release } from "@/types/github";

export default function Releases({
  params,
}: {
  params: {
    lng: string;
  };
}) {
  const { t } = useTranslation(params.lng, "common");

  const [loading, setLoading] = useState<boolean>(true);
  const [releases, setReleases] = useState<Release[]>([]);
  const [page, setPage] = useState<number>(1);
  const [error, setError] = useState<boolean>(false);

  const fetchData = async (page: number) => {
    try {
      setLoading(true);
      const res = await getReleases(page);
      setLoading(false);
      if (res?.code === 0) {
        setReleases(releases.concat(res?.data || []));
        return;
      }
      setError(true);
      console.error(res?.msg);
    } catch (error) {
      setLoading(false);
      setError(true);
      console.error(error);
    }
  };

  useEffect(() => {
    fetchData(page);
    /* eslint-disable-next-line react-hooks/exhaustive-deps */
  }, [page]);

  const ShowContent = useCallback(
    ({
      isShow,
      children,
    }: {
      isShow: boolean;
      children: React.ReactElement;
    }) => (isShow ? children : null),
    [],
  );

  return (
    <>
      <div className="flex min-h-[calc(100vh-8rem)] w-full max-w-screen-xl flex-1 flex-col px-5 xl:px-0">
        <div className="mb-4 text-3xl text-black dark:text-white">Release</div>
        <ShowContent isShow={releases.length === 0 && loading}>
          <div className="mx-0 my-auto text-center">
            <div role="status">
              <Loading className="inline h-8 w-8 animate-spin fill-blue-600 text-gray-200 dark:text-gray-600" />
              <span className="sr-only">Loading...</span>
            </div>
          </div>
        </ShowContent>
        <ShowContent isShow={releases.length === 0 && !loading}>
          <div className="mx-0 my-auto text-center">
            <span className="text-2xl text-gray-600 dark:text-gray-100">
              No Data
            </span>
          </div>
        </ShowContent>
        <ShowContent isShow={releases.length >= 0}>
          <ul
            role="list"
            className="w-full divide-y divide-gray-300 dark:divide-gray-500"
          >
            {releases.map((release: Release, index: number) => (
              <ReleaseComp
                key={release.id}
                lng={params.lng}
                release={release}
                first={index === 0}
              />
            ))}
          </ul>
        </ShowContent>
        <ShowContent isShow={!(releases.length < page * pageSize)}>
          <button
            onClick={() => setPage(page + 1)}
            className="mx-auto flex items-center justify-center space-x-2 rounded-full border border-gray-300 bg-white px-5 py-2 text-sm text-gray-600 shadow-md transition-colors hover:enabled:border-gray-800 disabled:cursor-not-allowed dark:bg-black dark:text-white/80 max-md:mx-10"
            disabled={loading}
            rel="noopener noreferrer"
          >
            {t("load-more")}
          </button>
        </ShowContent>
      </div>
    </>
  );
}
