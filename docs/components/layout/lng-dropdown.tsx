"use client";
import React, { useState } from "react";
import { usePathname } from "next/navigation";
import Link from "next/link";
import { RiTranslate } from "react-icons/ri";
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
import { useTranslation } from "@/i18n/client";
import { languages } from "@/i18n/settings";
import type { LngProps } from "@/types/i18next-lng";

export default function LngDropdown(props: LngProps) {
  const { t } = useTranslation(props.lng, "header");
  const pathName = usePathname();
  const [openPopover, setOpenPopover] = useState(false);
  const [openDrawer, setOpenDrawer] = useState(false);

  const redirectedPathName = (locale: string) => {
    if (!pathName) return "/";
    const segments = pathName.split("/");
    segments[1] = locale;
    return segments.join("/");
  };

  return (
    <div className="relative inline-block text-left">
      <DropdownMenu open={openPopover} onOpenChange={setOpenPopover}>
        <DropdownMenuTrigger asChild>
          <Button
            variant="link"
            className="hidden h-8 w-8 items-center justify-center overflow-hidden rounded-full p-0 transition-all duration-75 focus:outline-none focus-visible:ring-0 focus-visible:ring-offset-0 active:scale-95 sm:h-9 sm:w-9 md:flex"
          >
            <RiTranslate className="h-5 w-5" />
          </Button>
        </DropdownMenuTrigger>
        <DropdownMenuContent>
          <div className="w-full min-w-[14rem] rounded-md bg-white p-2 dark:bg-black">
            {languages.map((locale) => {
              return (
                <DropdownMenuItem
                  key={locale}
                  disabled={locale === props.lng}
                  className="hover:bg-accent hover:text-accent-foreground focus-visible:ring-0 focus-visible:ring-offset-0"
                >
                  <Link
                    key={locale}
                    href={redirectedPathName(locale)}
                    className="relative flex w-full items-center justify-start space-x-2 rounded-md py-2 text-left text-sm font-medium transition-all duration-75"
                  >
                    <p className="text-sm">{t(`languages.${locale}`)}</p>
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
            className="h-8 w-8 items-center justify-center overflow-hidden rounded-full p-0 transition-all duration-75 focus:outline-none focus-visible:ring-0 focus-visible:ring-offset-0 active:scale-95 sm:h-9 sm:w-9 md:hidden"
          >
            <RiTranslate className="h-5 w-5" />
          </Button>
        </DrawerTrigger>
        <DrawerContent>
          <div className="min-w-sm mx-auto w-full rounded-md p-2">
            {languages.map((locale) => {
              return (
                <Link
                  key={locale}
                  href={redirectedPathName(locale)}
                  className={`relative flex w-full items-center justify-start space-x-2 rounded-md px-2 py-3 text-left text-sm font-medium transition-all duration-75 ${locale === props.lng ? "pointer-events-none opacity-50" : "hover:bg-accent hover:text-accent-foreground"}`}
                >
                  <p className="text-sm">{t(`languages.${locale}`)}</p>
                </Link>
              );
            })}
          </div>
        </DrawerContent>
      </Drawer>
    </div>
  );
}
