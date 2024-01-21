use shogi_img::{image, pos2img, shogi_core};
use shogi_usi_parser::FromUsi;
use std::io::Cursor;
use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub fn sfen2png(sfen: &str) -> Vec<u8> {
    let pos = shogi_core::PartialPosition::from_usi(sfen).unwrap_or_default();
    let mut cursor = Cursor::new(Vec::new());
    pos2img(&pos)
        .write_to(&mut cursor, image::ImageFormat::Png)
        .ok();
    cursor.into_inner()
}
