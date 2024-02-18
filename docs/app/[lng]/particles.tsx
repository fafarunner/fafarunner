"use client";
import { useCallback, useEffect, useState } from "react";
import dynamic from "next/dynamic";
import { loadFull } from "tsparticles";
import type { Engine, Container, ISourceOptions } from "tsparticles-engine";
import { useAppTheme } from "@/lib/hooks";

const Particles = dynamic(() => import("react-particles"), {
  ssr: false,
});

const config: ISourceOptions = {
  autoplay: true,
  fullScreen: {
    enable: true,
    zIndex: -1,
  },
  background: {
    color: {
      value: "transparent",
    },
  },
  fpsLimit: 60,
  interactivity: {
    events: {
      onClick: {
        enable: true,
        mode: "push",
      },
      onHover: {
        enable: true,
        mode: "repulse",
      },
      resize: true,
    },
    modes: {
      bubble: {
        distance: 400,
        duration: 2,
        opacity: 0.8,
        size: 40,
      },
      push: {
        quantity: 1,
      },
      repulse: {
        distance: 200,
        duration: 0.4,
      },
    },
  },
  particles: {
    color: {
      value: "#ff8906",
    },
    links: {
      color: "#777777",
      distance: 150,
      enable: true,
      opacity: 0.5,
      width: 1,
    },
    collisions: {
      enable: true,
    },
    move: {
      direction: "none",
      enable: true,
      outMode: "bounce",
      random: false,
      speed: 1,
      straight: false,
    },
    number: {
      density: {
        enable: true,
        area: 800,
      },
      value: 90,
    },
    opacity: {
      value: 0.5,
    },
    shape: {
      type: "circle",
    },
    size: {
      random: true,
      value: 5,
    },
  },
  themes: [
    {
      name: "light",
      default: {
        value: true,
        mode: "light",
      },
      options: {
        background: {
          color: "transparent",
        },
      },
    },
    {
      name: "dark",
      default: {
        value: true,
        mode: "dark",
      },
      options: {
        background: {
          color: "#000000",
        },
      },
    },
  ],
  detectRetina: true,
};

export default function Particle() {
  const { resolvedTheme: theme } = useAppTheme();

  const particlesInit = useCallback(async (engine: Engine) => {
    await loadFull(engine);
  }, []);
  const [particlesContainer, setParticlesContainer] = useState<
    Container | undefined
  >();

  const particlesLoaded = useCallback(async (container?: Container) => {
    setParticlesContainer(container);
  }, []);

  useEffect(() => {
    const loadTheme = async () => {
      if (particlesContainer) {
        await particlesContainer.loadTheme(theme);
      }
    };

    loadTheme();
  }, [theme, particlesContainer]);

  return (
    <Particles options={config} init={particlesInit} loaded={particlesLoaded} />
  );
}
