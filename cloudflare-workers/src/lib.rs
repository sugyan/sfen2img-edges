use sfen2png_wasm::sfen2png;
use urlencoding::decode;
use worker::*;

#[event(fetch)]
async fn main(req: Request, _env: Env, _ctx: Context) -> Result<Response> {
    let decoded = decode(&req.path())
        .map(String::from)
        .expect("decode failed");
    let sfen = format!("sfen {}", decoded.strip_prefix('/').expect("invalid path"));
    Ok(Response::from_bytes(sfen2png(&sfen))?
        .with_headers(Headers::from_iter([("content-type", "image/png")])))
}
