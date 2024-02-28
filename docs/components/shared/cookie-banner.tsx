"use client";
import Script from "next/script";
import { LngProps } from "@/types/i18next-lng";

const CookieBanner = (props: LngProps) => {
  const NEXT_PUBLIC_COOKIE_BANNER_ID = process.env.NEXT_PUBLIC_COOKIE_BANNER_ID;

  if (!NEXT_PUBLIC_COOKIE_BANNER_ID) return null;

  return (
    <>
      <Script
        id="Cookiebot"
        src="https://consent.cookiebot.com/uc.js"
        data-culture={props.lng.toUpperCase()}
        data-cbid={NEXT_PUBLIC_COOKIE_BANNER_ID}
        data-blockingmode="auto"
        strategy="afterInteractive"
      />
      {/*<Script*/}
      {/*  id="CookieDeclaration"*/}
      {/*  src={`https://consent.cookiebot.com/${NEXT_PUBLIC_COOKIE_BANNER_ID}/cd.js`}*/}
      {/*  data-culture={props.lng.toUpperCase()}*/}
      {/*  strategy="afterInteractive"*/}
      {/*  async*/}
      {/*/>*/}
    </>
  );
};

export default CookieBanner;
