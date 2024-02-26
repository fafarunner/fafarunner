export default function Microsoft({ className }: { className?: string }) {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 48 48"
      width="48"
      height="48"
      className={className}
      fill="currentColor"
    >
      <rect
        x="6"
        y="6"
        transform="matrix(-1 -4.502011e-11 4.502011e-11 -1 28 28)"
        fill="#FF5722"
        width="16"
        height="16"
      />
      <rect
        x="26"
        y="6"
        transform="matrix(-1 -4.502011e-11 4.502011e-11 -1 68 28)"
        fill="#4CAF50"
        width="16"
        height="16"
      />
      <rect
        x="26"
        y="26"
        transform="matrix(-1 -4.502011e-11 4.502011e-11 -1 68 68)"
        fill="#FFC107"
        width="16"
        height="16"
      />
      <rect
        x="6"
        y="26"
        transform="matrix(-1 -4.502011e-11 4.502011e-11 -1 28 68)"
        fill="#03A9F4"
        width="16"
        height="16"
      />
    </svg>
  );
}
