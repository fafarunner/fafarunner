"use client";
import Script from "next/script";

const GoogleAnalytics = () => {
  const GA_TRACKING_ID = "G-5QJ7ZBRBBM";

  return (
    <>
      <Script
        strategy="afterInteractive"
        src={`https://www.googletagmanager.com/gtag/js?id=${GA_TRACKING_ID}`}
      />
      <Script
        id="gtag-init"
        strategy="afterInteractive"
        dangerouslySetInnerHTML={{
          __html: `
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              gtag('js', new Date());
              gtag('config', '${GA_TRACKING_ID}');
            `,
        }}
      />
    </>
  );
};

export default GoogleAnalytics;
