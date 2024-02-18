"use client";
// import type { Metadata } from "next";
import { allPosts } from "contentlayer/generated";
import { notFound } from "next/navigation";
import Image from "next/image";
import Link from "next/link";
// import dynamic from "next/dynamic";
import PostDate from "@/components/post/post-date";
import { Mdx } from "@/components/mdx/mdx";
import PostNav from "@/components/post/post-nav";

// const DiscussionEmbed = dynamic(
//     () => import('disqus-react').then((mod) => mod.DiscussionEmbed),
//     { ssr: false }
// )

// export async function generateStaticParams() {
//   return allPosts.map((post) => ({
//     slug: post.slug,
//   }));
// }

// export async function generateMetadata({
//   params,
// }: {
//   params: { slug: string; type: string; lng: string };
// }): Promise<Metadata | undefined> {
//   const post = allPosts.find(
//     (post) => post.slug === `${params.lng}/${params.type}/${params.slug}`,
//   );
//
//   if (!post) return;
//
//   const { title, summary: description } = post;
//
//   return {
//     title,
//     description,
//   };
// }

export default function Legal({
  params,
}: {
  params: { slug: string; type: string; lng: string };
}) {
  const slug = `${params.lng}/${params.type}/${params.slug}`;
  const post = allPosts.find((post) => post.slug === slug);

  if (!post) notFound();

  return (
    <div className="w-full max-w-6xl px-4 sm:px-6">
      <div className="pb-12 md:pb-20">
        <article>
          {/* Article header */}
          <header className="mx-auto mb-20 max-w-3xl">
            {/* Title */}
            <h1 className="h1 mb-4 text-center">{post.title}</h1>
          </header>

          {/* Article content */}
          <div className="lg:flex lg:justify-between">
            {/* Sidebar */}
            <PostNav />

            {/* Main content */}
            <div className="flex-1">
              {/* Article meta */}
              <div className="mb-6 flex items-center">
                {post.authorImg && (
                  <div className="mr-3 flex shrink-0">
                    <a
                      className="relative"
                      href="https://www.kjxbyz.com/"
                      target="_blank"
                    >
                      <span
                        className="absolute inset-0 -m-px"
                        aria-hidden="true"
                      >
                        <span className="absolute inset-0 -m-px rounded-full bg-white"></span>
                      </span>
                      <Image
                        className="relative rounded-full"
                        src={post.authorImg}
                        width={32}
                        height={32}
                        alt={post.author}
                      />
                    </a>
                  </div>
                )}
                <div>
                  <span className="text-gray-600 dark:text-gray-300">By </span>
                  <a
                    className="font-medium hover:underline dark:text-gray-300"
                    href="https://www.kjxbyz.com/"
                    target="_blank"
                  >
                    {post.author}
                  </a>
                  <span className="text-gray-600 dark:text-gray-300">
                    {" "}
                    · <PostDate dateString={post.publishedAt} />
                  </span>
                </div>
              </div>
              <hr className="mb-6 h-px w-full border-0 bg-gray-200 pt-px dark:bg-gray-600" />

              {/* Article body */}
              <div>
                <Mdx code={post.body.code} />
              </div>

              {params.type === "blog" && (
                <div className="text-lg text-gray-600">
                  <hr className="mt-8 h-px w-full border-0 bg-gray-200 pt-px dark:bg-gray-600" />
                  {/*<div className="mt-8 dark:text-gray-300">*/}
                  {/*  Interested in more tips like this? Check out{" "}*/}
                  {/*  <a*/}
                  {/*    className="text-gray-900 underline dark:text-gray-300"*/}
                  {/*    href="#0"*/}
                  {/*  >*/}
                  {/*    Introducing the Testing Field Guide*/}
                  {/*  </a>*/}
                  {/*  .*/}
                  {/*</div>*/}
                  <div className="mt-6">
                    <Link
                      href={`/${params.lng}/${params.type}`}
                      className="inline-flex items-center text-base font-medium text-blue-600 hover:underline"
                    >
                      <svg
                        className="mr-2 h-3 w-3 shrink-0 fill-current text-blue-400"
                        viewBox="0 0 12 12"
                        xmlns="http://www.w3.org/2000/svg"
                      >
                        <path d="M.293 5.282L5 .5l1.414 1.436-3 3.048H12v2.032H3.414l3 3.048L5 11.5.293 6.718a1.027 1.027 0 010-1.436z" />
                      </svg>
                      <span>Back to the blog</span>
                    </Link>
                  </div>
                </div>
              )}
            </div>
          </div>

          {/* Article footer */}
        </article>
      </div>
    </div>
  );
}
