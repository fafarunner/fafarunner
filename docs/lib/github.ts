import { Octokit } from "@octokit/rest";

declare global {
  var octokit: Octokit | undefined;
}

const octokit =
  global.octokit ||
  new Octokit({
    auth: process.env.NEXT_PUBLIC_GH_TOKEN,
  });

if (process.env.NODE_ENV === "development") global.octokit = octokit;

export default octokit;
