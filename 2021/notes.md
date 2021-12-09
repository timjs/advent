# Notes

## Issues

* Inconsistency in labels:
  `string.split(s, on: delim) <> list.split(l, at: delim)`

## Additions

* Add one of:
  * `int.maximum(items)` and `int.minimum(items)`?
    (because `sum` and `product` are also in `int`)
  * `list.maximum(items, by)` and `list.minimum(items, by)`?
    (because both are parametrised over an ordering)
* Some way to read all of a file/stdin into a buffer:
  * `fs.read_all`, `fs.read_text`, `fs.read_string`, ... for `String`
  * `fs.read` for `Data`/`Bits`/`Bytes`/`BitString`
