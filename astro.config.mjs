import { defineConfig } from 'astro/config';
import tailwind from "@astrojs/tailwind";
import icon from "astro-icon";

import node from "@astrojs/node";

// https://astro.build/config
export default defineConfig({
  output: 'server',
  server: {
    port: 4321, // Cambia esto al puerto que prefieras
  },
  integrations: [tailwind(), icon()],
  adapter: node({
    mode: "standalone"
  })
});