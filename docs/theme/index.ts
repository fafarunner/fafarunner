import { IconType } from "react-icons";
import { MdOutlineDesktopMac, MdDarkMode, MdLightMode } from "react-icons/md";

export const defaultTheme = "system";

export type ThemeMode = "system" | "dark" | "light";

export interface Theme {
  mode: ThemeMode;
  name: string;
  icon: IconType;
}

export const themes: Theme[] = [
  {
    mode: "system",
    name: "Auto",
    icon: MdOutlineDesktopMac,
  },
  {
    mode: "dark",
    name: "Dark",
    icon: MdDarkMode,
  },
  {
    mode: "light",
    name: "Light",
    icon: MdLightMode,
  },
];

export const icons: Record<ThemeMode, IconType> = themes.reduce<
  Record<ThemeMode, IconType>
>(
  (previousValue: Record<ThemeMode, IconType>, currentValue: Theme) => ({
    ...previousValue,
    [currentValue.mode]: currentValue.icon,
  }),
  {} as Record<ThemeMode, IconType>,
);
