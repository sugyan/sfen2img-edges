// @ts-ignore
import wasm from "@/pkg/sfen2png_bg.wasm?module";
import init, { sfen2png } from "@/pkg/sfen2png.js";

export const runtime = "edge";
export const dynamic = "force-dynamic";

export async function GET(request: Request) {
  await init(wasm);
  const sfen = `sfen ${decodeURI(new URL(request.url).pathname).slice(1)}`;
  return new Response(sfen2png(sfen), {
    headers: {
      "content-type": "image/png",
    },
  });
}
