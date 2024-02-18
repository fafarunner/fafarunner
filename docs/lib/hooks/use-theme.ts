import { useMemo } from "react";
import { useTheme } from "next-themes";
import { defaultTheme } from "@/theme";

export interface UseAppThemeProps {
  /** Update the theme */
  setTheme: (theme: string) => void;

  /** Active theme name */
  theme: string;

  resolvedTheme: string;
}

export default function useAppTheme(): UseAppThemeProps {
  const { theme, systemTheme, setTheme } = useTheme();
  const currentTheme = useMemo(
    () => (theme === "system" ? systemTheme : theme) || defaultTheme,
    [theme, systemTheme],
  );

  return {
    theme: theme || defaultTheme,
    resolvedTheme: currentTheme,
    setTheme,
  };
}
