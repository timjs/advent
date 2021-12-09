import gleam/io
import gleam/erlang

pub fn main() {
  try in = erlang.get_line("")
  io.print(in)
  Ok(Nil)
}
