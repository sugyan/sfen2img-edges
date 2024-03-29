use fastly::http::header;
use fastly::{Error, Request, Response};
use sfen2png_wasm::sfen2png;
use urlencoding::decode;

#[fastly::main]
fn main(req: Request) -> Result<Response, Error> {
    let decoded = decode(req.get_path())?;
    let sfen = format!("sfen {}", decoded.strip_prefix('/').expect("invalid path"));
    Ok(Response::from_body(sfen2png(&sfen)).with_header(header::CONTENT_TYPE, "image/png"))
}
