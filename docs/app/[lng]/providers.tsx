"use client";

import { ThemeProvider } from "next-themes";
import { cacheThemeKey } from "@/constants";
import { defaultTheme } from "@/theme";

export function Providers({ children }: { children: React.ReactNode }) {
  return (
    <ThemeProvider
      defaultTheme={defaultTheme}
      storageKey={cacheThemeKey}
      attribute="class"
    >
      {children}
    </ThemeProvider>
  );
}
