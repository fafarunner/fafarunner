"use client";
import React, { useState } from "react";
import Link from "next/link";
import Popover from "@/components/shared/popover";
import { LngProps } from "@/types/i18next-lng";
import { Asset } from "@/types/github";

export default function GithubPkg(
  props: LngProps & {
    assets: Asset[];
    disabled: boolean;
    wrapped?: boolean;
    children: React.ReactNode;
  },
) {
  const { lng, assets, disabled, wrapped = true, children } = props;
  const [openPopover, setOpenPopover] = useState(false);

  return (
    <Popover
      content={
        <div className="w-full min-w-[14rem] overflow-scroll rounded-md bg-white p-2 dark:bg-black max-md:max-h-[50vh] md:max-h-[50vh]">
          {assets.map((asset) => {
            return (
              <Link
                key={asset.id}
                href={asset.browser_download_url || ""}
                className="relative flex w-full items-center justify-start space-x-2 rounded-md p-2 text-left text-sm transition-all duration-75 hover:bg-gray-100 dark:hover:bg-gray-700"
              >
                <p className="text-sm">{asset.name}</p>
              </Link>
            );
          })}
        </div>
      }
      align="end"
      openPopover={openPopover}
      setOpenPopover={setOpenPopover}
    >
      {!wrapped ? (
        <div onClick={() => setOpenPopover(!openPopover)}>{children}</div>
      ) : (
        <button
          onClick={() => setOpenPopover(!openPopover)}
          className="flex items-center justify-center space-x-2 rounded-full border border-gray-300 bg-white px-5 py-2 text-sm text-gray-600 shadow-md transition-colors hover:enabled:border-gray-800 disabled:cursor-not-allowed dark:bg-black dark:text-white/80 max-md:mx-0"
          disabled={disabled}
          rel="noopener noreferrer"
        >
          {children}
        </button>
      )}
    </Popover>
  );
}
