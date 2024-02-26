import { MetadataRoute } from "next";
import { allPosts } from "contentlayer/generated";
import { domain } from "@/constants";

export default function sitemap(): MetadataRoute.Sitemap {
  const sitemaps = allPosts
    .sort((a, b) => {
      return new Date(a.publishedAt) > new Date(b.publishedAt) ? -1 : 1;
    })
    .map((post) => ({
      url: `${domain}/${post.slug}`,
      lastModified: new Date(),
      changeFrequency: "weekly",
      priority: 1,
    }));

  return sitemaps as MetadataRoute.Sitemap;
}
