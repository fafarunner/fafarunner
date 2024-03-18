"use client";

import Image from "next/image";
import Link from "next/link";
import { FaRegPlayCircle } from "react-icons/fa";
import useScroll from "@/lib/hooks/use-scroll";
import LngDropdown from "./lng-dropdown";
import ThemeDropdown from "./theme-dropdown";
import { useTranslation } from "@/i18n/client";
import { basePath } from "@/constants";
// import { Github } from "@/components/shared/icons";
import { LngProps } from "@/types/i18next-lng";

export default function Header(props: LngProps) {
  const { t } = useTranslation(props.lng, "header");
  const scrolled = useScroll(50);

  // toggle menu
  const toggleMenu = () => {
    const $navbar = document.querySelector("#navbar-language");
    $navbar?.classList.toggle("hidden");
  };

  return (
    <div
      className={`fixed top-0 w-full ${
        scrolled
          ? "border-b border-gray-200 bg-white/50 backdrop-blur-xl dark:border-gray-800 dark:bg-gray-900"
          : "bg-white/0 dark:bg-black/0"
      } z-30 transition-all`}
    >
      <div className="mx-5 flex h-16 max-w-screen-xl items-center justify-between xl:mx-auto">
        <Link
          href={`/${props.lng}`}
          className="flex items-center font-display text-2xl"
        >
          <Image
            src={`${basePath}/logo.jpg`}
            alt="logo"
            width="30"
            height="30"
            className="mr-2 rounded-sm"
          ></Image>
          <p>{t("title")}</p>
        </Link>
        <div
          className="w-18 hidden items-center justify-between max-md:absolute max-md:right-5 max-md:top-16 max-md:bg-white max-md:dark:bg-gray-900 md:order-1 md:flex md:w-auto"
          id="navbar-language"
        >
          <ul className="flex flex-col items-center rounded-lg border border-gray-100 p-4 font-medium dark:border-gray-700 max-md:space-y-3 md:mt-0 md:flex-row md:space-x-3 md:border-0 md:p-0">
            {/*<li className="h-8 w-8 sm:h-9 sm:w-9">*/}
            {/*  <div className="relative inline-block text-left">*/}
            {/*    <Link*/}
            {/*      target="_blank"*/}
            {/*      rel="noopener noreferrer"*/}
            {/*      href="https://github.com/fafarunner/fafa-runner"*/}
            {/*      className="flex h-8 w-8 items-center justify-center overflow-hidden rounded-full transition-all duration-75 focus:outline-none active:scale-95 sm:h-9 sm:w-9"*/}
            {/*    >*/}
            {/*      <Github className="h-5 w-5" />*/}
            {/*    </Link>*/}
            {/*  </div>*/}
            {/*</li>*/}
            <li className="h-8 w-8 sm:h-9 sm:w-9">
              <div className="relative inline-block text-left">
                <Link
                  href="https://chenyifaer.com/fafa-runner/play/"
                  target="_blank"
                  className="flex h-8 w-8 items-center justify-center overflow-hidden rounded-full transition-all duration-75 focus:outline-none active:scale-95 sm:h-9 sm:w-9"
                >
                  <FaRegPlayCircle className="h-5 w-5" />
                </Link>
              </div>
            </li>
            <li className="h-8 w-8 sm:h-9 sm:w-9">
              <LngDropdown lng={props.lng} />
            </li>
            <li className="h-8 w-8 sm:h-9 sm:w-9">
              <ThemeDropdown lng={props.lng} />
            </li>
          </ul>
        </div>
        <button
          onClick={toggleMenu}
          className="inline-flex h-10 w-10 items-center justify-center rounded-lg p-2 text-sm hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:hover:bg-gray-700 dark:focus:ring-gray-600 md:hidden"
          aria-controls="navbar-language"
          aria-expanded="false"
        >
          <span className="sr-only">Open menu</span>
          <svg
            className="h-5 w-5"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 17 14"
          >
            <path
              stroke="currentColor"
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth="2"
              d="M1 1h15M1 7h15M1 13h15"
            />
          </svg>
        </button>
      </div>
    </div>
  );
}
