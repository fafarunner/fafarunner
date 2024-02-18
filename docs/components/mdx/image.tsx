import Image, { StaticImageData } from "next/image";

interface PostImageProps {
  alt: string;
  caption?: string;
  src: StaticImageData;
}

export default function PostImage({ alt, caption, ...props }: PostImageProps) {
  return (
    <figure>
      <Image className="w-full rounded" {...props} alt={alt} />
      {caption && (
        <figcaption className="mt-3 text-center text-sm text-gray-500">
          {caption}
        </figcaption>
      )}
    </figure>
  );
}
