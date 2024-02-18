import Link from "next/link";
import { Post } from "contentlayer/generated";

export default function LatestPosts({ posts }: { posts: Post[] }) {
  return (
    <div className="mb-8">
      <h4 className="mb-4 text-lg font-bold leading-snug tracking-tight">
        Latest Posts
      </h4>
      <ul className="-my-2">
        {posts.map((post, index) => (
          <li
            className={`flex py-2 ${
              index + 1 !== posts.length
                ? "border-b border-gray-200 dark:border-gray-600"
                : ""
            }`}
            key={post.slug}
          >
            <svg
              className="mr-3 mt-1 h-4 w-4 shrink-0 fill-current text-gray-400"
              viewBox="0 0 16 16"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path d="M15.686 5.695L10.291.3c-.4-.4-.999-.4-1.399 0s-.4.999 0 1.399l.6.599-6.794 3.697-1-1c-.4-.399-.999-.399-1.398 0-.4.4-.4 1 0 1.4l1.498 1.498 2.398 2.398L.6 13.988 2 15.387l3.696-3.697 3.997 3.996c.5.5 1.199.2 1.398 0 .4-.4.4-.999 0-1.398l-.999-1 3.697-6.694.6.6c.599.6 1.199.2 1.398 0 .3-.4.3-1.1-.1-1.499zM8.493 11.79L4.196 7.494l6.695-3.697 1.298 1.299-3.696 6.694z" />
            </svg>
            <article>
              <h3 className="mb-1 font-medium">
                <Link href={`/${post.slug}`} className="hover:underline">
                  {post.title}
                </Link>
              </h3>
              <div className="text-sm text-gray-800 dark:text-gray-500">
                <span className="text-gray-600 dark:text-gray-300">By </span>
                <a
                  className="font-medium hover:underline"
                  href="https://www.kjxbyz.com"
                >
                  {post.author}
                </a>
              </div>
            </article>
          </li>
        ))}
      </ul>
    </div>
  );
}
