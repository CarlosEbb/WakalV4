import { defineConfig } from 'astro/config';
import tailwind from "@astrojs/tailwind";
import icon from "astro-icon";

import node from "@astrojs/node";

// https://astro.build/config
export default defineConfig({
  output: 'server',
  server: {
    port: 8002, // Cambia esto al puerto que prefieras
    host: '172.16.10.26'
  },
  integrations: [tailwind(), icon()],
  adapter: node({
    mode: "standalone"
  })
});