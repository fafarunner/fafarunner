import Link from "next/link";

export default function NotFound() {
  return (
    <div className="w-full max-w-6xl px-4 sm:px-6">
      {/*<img*/}
      {/*    src="https://images.unsplash.com/photo-1545972154-9bb223aac798?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3050&q=80&exp=8&con=-15&sat=-75"*/}
      {/*    alt=""*/}
      {/*    className="absolute inset-0 -z-10 h-full w-full object-cover object-top"*/}
      {/*/>*/}
      <div className="mx-auto max-w-7xl px-6 py-32 text-center sm:py-40 lg:px-8">
        <p className="text-base font-semibold leading-8 dark:text-gray-300">
          404
        </p>
        <h1 className="mt-4 text-3xl font-bold tracking-tight dark:text-gray-300 sm:text-5xl">
          Page not found
        </h1>
        <p className="mt-4 text-base dark:text-gray-300  sm:mt-6">
          Sorry, we couldn’t find the page you’re looking for.
        </p>
        <div className="mt-10 flex justify-center dark:text-gray-300">
          <Link href="/" className="text-sm font-semibold leading-7 ">
            <span aria-hidden="true">&larr;</span> Back to home
          </Link>
        </div>
      </div>
    </div>
  );
}
