"use client";
import React from "react";
import Link from "next/link";
import Balancer from "react-wrap-balancer";
import { RoughNotation } from "react-rough-notation";
import { FiMail } from "react-icons/fi";
import { IoGameControllerOutline } from "react-icons/io5";
import {
  SiTaobao,
  SiSpotify,
  SiSinaweibo,
  SiInstagram,
  SiYoutube,
  SiTwitch,
  SiTwitter,
  SiTelegram,
} from "react-icons/si";
import { BiTestTube } from "react-icons/bi";
import { FaBlog } from "react-icons/fa";
import Image from "next/image";
// import dynamic from "next/dynamic";
import Release from "@/components/home/github-release";
import { useTranslation } from "@/i18n/client";
import { basePath } from "@/constants";
import { allPosts } from "contentlayer/generated";

// const DynamicCard = dynamic(() => import("@/components/home/card"), {
//   ssr: false,
// });

export default function Home({
  params,
}: {
  params: {
    lng: string;
  };
}) {
  const { t } = useTranslation(params.lng, "header");
  const { t: tc } = useTranslation(params.lng, "common");

  const post = allPosts
    .filter((post) => post.slug.startsWith(`${params.lng}/blog`))
    .sort((a, b) => {
      return new Date(a.publishedAt) > new Date(b.publishedAt) ? -1 : 1;
    })
    .at(0);

  return (
    <>
      <div className="w-full max-w-xl px-5 xl:px-0">
        {post && (
          <Link
            href={`/${post.slug}`}
            rel="noreferrer"
            className="mx-auto mb-12 flex max-w-fit animate-fade-up items-center justify-center space-x-2 overflow-hidden rounded-full bg-blue-100 px-7 py-2 transition-colors hover:bg-blue-200"
          >
            <FaBlog className="h-5 w-5 text-[#1d9bf0]" />
            <p className="text-sm font-semibold text-[#1d9bf0]">{post.title}</p>
          </Link>
        )}
        <div className="mb-8 flex items-center justify-center space-x-20">
          <Image
            className="rounded-full"
            alt="logo"
            src={`${basePath}/logo.jpg`}
            width={160}
            height={160}
          />
        </div>
        <h1
          className="animate-fade-up bg-clip-text text-center font-display text-4xl font-bold tracking-[-0.02em] text-black/80 opacity-0 drop-shadow-sm dark:text-white/80 md:text-7xl md:leading-[5rem]"
          style={{ animationDelay: "0.15s", animationFillMode: "forwards" }}
        >
          <Balancer>{t("title")}</Balancer>
        </h1>
        <p
          className="mt-6 animate-fade-up text-center text-red-400 opacity-0 md:text-xl"
          style={{ animationDelay: "0.25s", animationFillMode: "forwards" }}
        >
          <Balancer>
            <RoughNotation
              animate
              type="highlight"
              show={true}
              color="rgb(36, 54, 110)"
              animationDelay={1000}
              animationDuration={2500}
            >
              一个休闲小游戏
            </RoughNotation>
            .
          </Balancer>
        </p>
      </div>
      <Release lng={params.lng} />
      {/*<div className="mt-10 grid w-full max-w-screen-xl animate-fade-up xl:px-0">*/}
      {/*  <div className="flex items-center justify-center">*/}
      {/*    <div className="grid w-full grid-cols-1 gap-5 md:max-w-3xl md:grid-cols-2">*/}
      {/*      <Link*/}
      {/*        href="https://www.chenyifaer.com/join"*/}
      {/*        target="_blank"*/}
      {/*        className="flex items-center justify-center space-x-2 rounded-full border border-gray-300 bg-white px-5 py-2 text-sm text-gray-600 shadow-md transition-colors hover:border-gray-800 hover:enabled:border-gray-800 disabled:cursor-not-allowed dark:bg-black dark:text-white/80 max-md:mx-10"*/}
      {/*        rel="noopener noreferrer"*/}
      {/*      >*/}
      {/*        <BiTestTube className="h-7 w-7" />*/}
      {/*        <p>*/}
      {/*          <span className="sm:inline-block">{tc("join")}</span>*/}
      {/*        </p>*/}
      {/*      </Link>*/}
      {/*      <Link*/}
      {/*        href="https://www.chenyifaer.com/fafa-runner/play"*/}
      {/*        target="_blank"*/}
      {/*        className="flex items-center justify-center space-x-2 rounded-full border border-gray-300 bg-white px-5 py-2 text-sm text-gray-600 shadow-md transition-colors hover:border-gray-800 hover:enabled:border-gray-800 disabled:cursor-not-allowed dark:bg-black dark:text-white/80 max-md:mx-10"*/}
      {/*        rel="noopener noreferrer"*/}
      {/*      >*/}
      {/*        <IoGameControllerOutline className="h-7 w-7" />*/}
      {/*        <p>*/}
      {/*          <span className="sm:inline-block">{tc("play")}</span>*/}
      {/*        </p>*/}
      {/*      </Link>*/}
      {/*    </div>*/}
      {/*  </div>*/}
      {/*</div>*/}
      {/*<div className="my-10 grid w-full max-w-screen-xl animate-fade-up grid-cols-1 gap-5 px-5 sm:grid-cols-2 lg:grid-cols-3 xl:px-0">*/}
      {/*  {features.map(({ title, description, demo, url }) => (*/}
      {/*    <DynamicCard*/}
      {/*      key={title}*/}
      {/*      title={title}*/}
      {/*      description={description}*/}
      {/*      demo={demo}*/}
      {/*      url={url}*/}
      {/*    />*/}
      {/*  ))}*/}
      {/*</div>*/}
    </>
  );
}

const features = [
  {
    title: "Taobao",
    description:
      "Pre-built beautiful, a11y-first components, powered by [Tailwind CSS](https://tailwindcss.com/), [Radix UI](https://www.radix-ui.com/), and [Framer Motion](https://framer.com/motion)",
    demo: (
      <SiTaobao className="h-24 w-24 text-gray-600 transition-all dark:text-white/80" />
    ),
    url: "https://chenyifaer.taobao.com",
  },
  {
    title: "Instagram",
    description:
      "Built on [Next.js](https://nextjs.org/) primitives like `@next/font` and `next/image` for stellar performance.",
    demo: (
      <SiInstagram className="h-24 w-24 text-gray-600 transition-all dark:text-white/80" />
    ),
    url: "https://instagram.com/yifaer_chen",
  },
  {
    title: "YouTube",
    description:
      "Jumpstart your next project by deploying Precedent to [Vercel](https://vercel.com/) in one click.",
    demo: (
      <SiYoutube className="h-24 w-24 text-gray-600 transition-all dark:text-white/80" />
    ),
    url: "https://www.youtube.com/@chenyifaer",
  },
  {
    title: "Twitch",
    description:
      "Jumpstart your next project by deploying Precedent to [Vercel](https://vercel.com/) in one click.",
    demo: (
      <SiTwitch className="h-24 w-24 text-gray-600 transition-all dark:text-white/80" />
    ),
    url: "https://www.twitch.tv/thebs_chen",
  },
  {
    title: "Spotify",
    description:
      "Jumpstart your next project by deploying Precedent to [Vercel](https://vercel.com/) in one click.",
    demo: (
      <SiSpotify className="h-24 w-24 text-gray-600 transition-all dark:text-white/80" />
    ),
    url: "https://open.spotify.com/artist/10xtjTRMlKZ7aFx6VBQlSj",
  },
  {
    title: "Weibo",
    description:
      "Jumpstart your next project by deploying Precedent to [Vercel](https://vercel.com/) in one click.",
    demo: (
      <SiSinaweibo className="h-24 w-24 text-gray-600 transition-all dark:text-white/80" />
    ),
    url: "https://weibo.com/u/7357828611",
  },
  {
    title: "Twitter",
    description:
      "Jumpstart your next project by deploying Precedent to [Vercel](https://vercel.com/) in one click.",
    demo: (
      <SiTwitter className="h-24 w-24 text-gray-600 transition-all dark:text-white/80" />
    ),
    url: "https://twitter.com/yifaer_chen",
  },
  {
    title: "Telegram",
    description:
      "Jumpstart your next project by deploying Precedent to [Vercel](https://vercel.com/) in one click.",
    demo: (
      <SiTelegram className="h-24 w-24 text-gray-600 transition-all dark:text-white/80" />
    ),
    url: "https://t.me/FaFa67373",
  },
  {
    title: "Email",
    description:
      "Precedent comes with authentication and database via [Auth.js](https://authjs.dev/) + [Prisma](https://prisma.io/)",
    demo: (
      <FiMail className="h-24 w-24 text-gray-600 transition-all dark:text-white/80" />
    ),
    url: "mailto:chenyifaer777@gmail.com",
  },
  {
    title: "FaFa Runner",
    description:
      "Precedent offers a collection of hooks, utilities, and `@vercel/og`",
    demo: (
      <IoGameControllerOutline className="h-24 w-24 text-gray-600 transition-all dark:text-white/80" />
    ),
    url: "https://chenyifaer.com/fafa-runner",
  },
  {
    title: "CYF Insider",
    description:
      "Precedent offers a collection of hooks, utilities, and `@vercel/og`",
    demo: (
      <BiTestTube className="h-24 w-24 text-gray-600 transition-all dark:text-white/80" />
    ),
    url: "https://chenyifaer.com/join",
  },
];
