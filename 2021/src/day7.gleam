import gleam/list
import gleam/string
import gleam/int
import gleam/function.{compose, identity}
import helpers

pub fn run(input: String) -> Result(#(Int, Int), Nil) {
  try crabs =
    input
    |> string.split(on: ",")
    |> list.try_map(int.parse)
  try part_a = minimal_crab_fuel(identity, crabs)
  try part_b = minimal_crab_fuel(arith_series, crabs)
  Ok(#(part_a, part_b))
}

pub fn arith_series(n: Int) -> Int {
  n * { n + 1 } / 2
}

fn minimal_crab_fuel(cost: fn(Int) -> Int, crabs: List(Int)) -> Result(Int, Nil) {
  try min_crab = helpers.minimum(crabs, int.compare)
  try max_crab = helpers.maximum(crabs, int.compare)
  let total_crab_fuel = fn(current_position) {
    crabs
    |> list.map(fn(crab) { cost(int.absolute_value(crab - current_position)) })
    |> int.sum()
  }
  list.range(min_crab, max_crab)
  |> list.map(total_crab_fuel)
  |> helpers.minimum(int.compare)
}
