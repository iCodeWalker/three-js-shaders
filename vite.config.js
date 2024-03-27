import glsl from "vite-plugin-glsl";

export default {
  root: "src/",
  publicDir: "../static/",
  base: "./",
  server: {
    host: true,
  },
  build: {
    outDir: "../dist",
    emptyOutDir: true,
    sourcemap: true,
  },
  plugins: [glsl()],
  // javascript project gives error on using .glsl file as our project loads .glsl file as
  // a javascript file, so to load glsl file as a string we need a plugin. so it can handle glsl file also.
};
