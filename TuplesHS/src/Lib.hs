-- module Lib
--     ( someFunc
--     ) where


f :: (a, b, c) -> (d, e , f) -> ((a, d), (c, f))
f (x, y, z) (x2, y2, z2) = ((x, x2), (z, z2))

funcZ x =
    case x + 1 == 1 of
        True -> "AWESOME"
        False -> "wut"

functionC x y =
    case x > y of
        True -> x
        False -> y

ifEvenAdd2 x =
    case even x of
        True -> x + 2
        False -> x

nums x =
    case compare x 0 of
        GT -> 1
        LT -> -1
        EQ -> 0
