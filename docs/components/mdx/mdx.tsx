import { useMDXComponent } from "next-contentlayer/hooks";
import PostLink from "./link";
import PostImage from "./image";
import PostBanner from "./banner";

const mdxComponents = {
  Link: PostLink,
  Image: PostImage,
  Banner: PostBanner,
};

interface MdxProps {
  code: string;
}

export function Mdx({ code }: MdxProps) {
  const Component = useMDXComponent(code);

  return (
    <article className="prose-a:text-gray-90 prose prose-lg max-w-none break-words text-lg text-gray-600 prose-headings:text-gray-900 prose-h2:scroll-mt-28 prose-p:leading-normal prose-a:font-normal hover:prose-a:underline prose-blockquote:border-none prose-blockquote:pl-0 prose-blockquote:font-medium prose-blockquote:italic prose-blockquote:text-gray-900 prose-strong:font-medium prose-strong:text-gray-900 dark:text-gray-300 dark:prose-headings:text-gray-100 dark:prose-a:text-gray-100 dark:prose-blockquote:text-gray-100 dark:prose-strong:text-gray-100">
      <Component components={{ ...mdxComponents }} />
    </article>
  );
}
