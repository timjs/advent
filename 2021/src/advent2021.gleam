import gleam/io
import gleam/int
import gleam/erlang
import day7.{run}

pub fn main() {
  try input = erlang.get_line("")
  run(input)
  |> io.debug()
  Ok(Nil)
}
