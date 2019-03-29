module Symetry where

myWords :: [Char] -> [[Char]]
myWords a
    | a /= [] = (:) (takeWhile (/= ' ') a) (myWords (dropWhile (== ' ') ((dropWhile (/= ' ') a))))
    | otherwise = init ((:[]) [])
