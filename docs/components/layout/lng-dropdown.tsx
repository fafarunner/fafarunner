"use client";

import { useState } from "react";
import { RiTranslate } from "react-icons/ri";
import Popover from "@/components/shared/popover";
import { usePathname } from "next/navigation";
import Link from "next/link";
import { useTranslation } from "@/i18n/client";
import { languages } from "@/i18n/settings";
import { LngProps } from "@/i18next-lng";

export default function LngDropdown(props: LngProps) {
  const { t } = useTranslation(props.lng, "header");
  const pathName = usePathname();
  const [openPopover, setOpenPopover] = useState(false);

  const redirectedPathName = (locale: string) => {
    if (!pathName) return "/";
    const segments = pathName.split("/");
    segments[1] = locale;
    return segments.join("/");
  };

  return (
    <div className="relative inline-block text-left">
      <Popover
        content={
          <div className="w-full min-w-[14rem] rounded-md bg-white p-2 dark:bg-black">
            {languages.map((locale) => {
              return (
                <Link
                  key={locale}
                  href={redirectedPathName(locale)}
                  className={`relative flex w-full items-center justify-start space-x-2 rounded-md p-2 text-left text-sm transition-all duration-75 hover:bg-gray-100 dark:hover:bg-gray-700 ${
                    locale === props.lng
                      ? "cursor-not-allowed bg-gray-100 dark:bg-gray-700"
                      : ""
                  }`}
                >
                  <p className="text-sm">{t(`languages.${locale}`)}</p>
                </Link>
              );
            })}
          </div>
        }
        align="end"
        openPopover={openPopover}
        setOpenPopover={setOpenPopover}
      >
        <button
          onClick={() => setOpenPopover(!openPopover)}
          className="flex h-8 w-8 items-center justify-center overflow-hidden rounded-full transition-all duration-75 focus:outline-none active:scale-95 sm:h-9 sm:w-9"
        >
          <RiTranslate className="h-5 w-5" />
        </button>
      </Popover>
    </div>
  );
}
