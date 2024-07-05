export { config };

import type { Config } from "vike/types";
import vikeReact from "vike-react/config";

const config = {
  ssr: true,
  stream: true,
  extends: vikeReact,
  reactStrictMode: false,
} satisfies Config;
