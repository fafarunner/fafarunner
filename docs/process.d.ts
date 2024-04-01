declare namespace NodeJS {
  export interface ProcessEnv {
    VERCEL_GIT_COMMIT_SHA: string;
    NEXT_PUBLIC_VERCEL_ENV: string;
    NEXT_PUBLIC_GOOGLE_ID: string;
    NEXT_PUBLIC_SHOW_PARTICLES: string;
    NEXT_PUBLIC_WEBSITE_GLOBAL_GRAY: string;
    GH_TOKEN: string;
    GH_REPO_OWNER: string;
    GH_REPO: string;
  }
}
