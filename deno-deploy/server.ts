import { sfen2png } from "./pkg/sfen2png.js";

Deno.serve((req: Request) => {
  const sfen = `sfen ${decodeURI(new URL(req.url).pathname).slice(1)}`;
  return new Response(sfen2png(sfen), {
    headers: {
      "content-type": "image/png",
    },
  });
});
