"use client";
import React, { useState } from "react";
import Link from "next/link";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
  Drawer,
  DrawerContent,
  DrawerTrigger,
  Button,
} from "muse-ui";
import type { LngProps } from "@/types/i18next-lng";
import type { Asset } from "@/types/github";

export default function GitHubPkg(
  props: LngProps & {
    assets: Asset[];
    disabled: boolean;
    wrapperClassName?: string;
    children: React.ReactNode;
  },
) {
  const { lng, assets, disabled, wrapperClassName, children } = props;
  const [openPopover, setOpenPopover] = useState(false);
  const [openDrawer, setOpenDrawer] = useState(false);

  return (
    <div className="relative inline-block text-left">
      <DropdownMenu open={openPopover} onOpenChange={setOpenPopover}>
        <DropdownMenuTrigger asChild>
          <Button
            variant="link"
            disabled={disabled}
            className={`hidden h-full w-full items-center justify-center space-x-2 overflow-hidden rounded-full px-5 py-2 transition-all duration-75 hover:no-underline focus:outline-none focus-visible:ring-0 focus-visible:ring-offset-0 active:scale-95 md:flex ${wrapperClassName}`}
          >
            {children}
          </Button>
        </DropdownMenuTrigger>
        <DropdownMenuContent>
          <div className="w-full min-w-[14rem] overflow-scroll rounded-md bg-white p-2 dark:bg-black max-md:max-h-[60vh] md:max-h-[60vh]">
            {assets.map((asset) => {
              return (
                <DropdownMenuItem
                  key={asset.id}
                  className="hover:bg-accent hover:text-accent-foreground focus-visible:ring-0 focus-visible:ring-offset-0"
                >
                  <Link
                    key={asset.id}
                    href={asset.browser_download_url || ""}
                    className="relative flex w-full items-center justify-start space-x-2 rounded-md py-2 text-left text-sm font-medium transition-all duration-75"
                  >
                    <p className="text-sm">{asset.name}</p>
                  </Link>
                </DropdownMenuItem>
              );
            })}
          </div>
        </DropdownMenuContent>
      </DropdownMenu>
      <Drawer open={openDrawer} onOpenChange={setOpenDrawer}>
        <DrawerTrigger asChild>
          <Button
            variant="link"
            disabled={disabled}
            className={`h-full w-full items-center justify-center space-x-2 overflow-hidden rounded-full px-5 py-2 transition-all duration-75 hover:no-underline focus:outline-none focus-visible:ring-0 focus-visible:ring-offset-0 active:scale-95 md:hidden ${wrapperClassName}`}
          >
            {children}
          </Button>
        </DrawerTrigger>
        <DrawerContent>
          <div className="min-w-sm mx-auto w-full overflow-scroll rounded-md p-2 max-md:max-h-[60vh] md:max-h-[60vh]">
            {assets.map((asset) => {
              return (
                <Link
                  key={asset.id}
                  href={asset.browser_download_url || ""}
                  className="relative flex w-full items-center justify-start space-x-2 rounded-md px-2 py-3 text-left text-sm font-medium transition-all duration-75 hover:bg-accent hover:text-accent-foreground"
                >
                  <p className="text-sm">{asset.name}</p>
                </Link>
              );
            })}
          </div>
        </DrawerContent>
      </Drawer>
    </div>
  );
}
