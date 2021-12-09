import gleam/list
import gleam/int
import gleam/order.{Gt, Lt, Order}

pub fn maximum(items: List(a), by compare: fn(a, a) -> Order) -> Result(a, Nil) {
  items
  |> list.reduce(fn(acc, x) {
    case compare(acc, x) {
      Lt -> x
      _ -> acc
    }
  })
}

pub fn minimum(items: List(a), by compare: fn(a, a) -> Order) -> Result(a, Nil) {
  items
  |> list.reduce(fn(acc, x) {
    case compare(acc, x) {
      Gt -> x
      _ -> acc
    }
  })
}
