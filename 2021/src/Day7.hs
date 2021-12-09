module Main where

split :: Eq a => a -> [a] -> [[a]]
split _ [] = []
split needle haystack = part : split needle remain
  where
    (part, rest) = break (== needle) haystack
    (_, remain) = span (== needle) rest

main :: IO ()
main = do
  input <- readFile "Day7Input.txt"
  let crabs = map read $ split ',' input
  print $ minimalCrabFuel id crabs
  print $ minimalCrabFuel sumArithmeticSeries crabs

sumArithmeticSeries :: Int -> Int
sumArithmeticSeries d = round $ d' * (d' + 1) / 2
  where
    d' = toRational d

minimalCrabFuel :: (Int -> Int) -> [Int] -> Int
minimalCrabFuel calc crabPositions = minimum [totalCrabFuel position | position <- [minCrab .. maxCrab]]
  where
    maxCrab = maximum crabPositions
    minCrab = minimum crabPositions
    totalCrabFuel currentPosition = sum [calc $ abs (crab - currentPosition) | crab <- crabPositions]
