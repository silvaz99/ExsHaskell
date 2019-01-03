{-  Exploring Languages with Interpreters and Functional Programming
    Chapters 4, 8, 9, and 12: Factorial Functions
    Copyright (C) 2018, H. Conrad Cunningham

1234567890123456789012345678901234567890123456789012345678901234567890

2016-07-27: Module based on previous work
2017-02-03: Added fact6/factInter
2017-08-25: Added fact4', fact4'', fact7..fact11
2018-07-11: Revised for 2018 textbook Chapters 4, 8, 9, 12;
            Exchanged names/positions for fact7 and fact8;
            Improved comments

This module's functions fact1, fact2, fact3, fact4, fact4', and fact5
are from Chapter 4. Function fact6 is from Chapter 9. The other
functions are not discussed explicitly in the textbook.

Chapter 10 discusses the accompanying test script TestFactorial.hs. An
older "smoke test" script is FactTest.hs.

-}

module Factorial
    ( fact1, fact2, fact3, fact4, fact4', fact5,   -- Ch. 4
      fact6,                                       -- Ch. 9
      fact4'', fact7, fact8, fact9, fact10, fact11 -- extra
    )
where

-- Using an if-then-else expression
-- Infinite recursion on negative argument
fact1 :: Int -> Int
fact1 n = if n == 0 then
              1
          else
              n * fact1 (n-1)

-- Using guards (evaluate top to bottom until success)
-- Infinite recursion on negative argument
fact2 :: Int -> Int
fact2 n
  | n == 0    = 1
  | otherwise = n * fact2 (n-1)

-- Using pattern matching (evaluate top to bottom until success)
-- infinite recursion on negative argument
fact3 :: Int -> Int
fact3 0 = 1
fact3 n = n * fact3 (n-1)

-- Using partial function (undefined for negative n)
-- Explicitly undefined for negative argument
fact4 :: Integer -> Integer
fact4 n
  | n == 0 =  1
  | n >= 1 =  n * fact4 (n-1)

-- fact4 with explicit error
-- Explicit error call for negative argument
fact4' :: Int -> Int
fact4' n
  | n == 0 =  1
  | n >= 1 =  n * fact4' (n-1)
  | otherwise = error "fact4' called with negative argument"

-- fact4 with mix of patterns and guards, explicit error
-- explicit error call for negative argument
fact4'' :: Int -> Int
fact4'' 0          = 1
fact4'' n | n >= 1 = n * fact4'' (n-1)
fact4'' n          = error "fact4'' called with negative argument"

-- Was valid for older Haskell standard, but not for Haskell
-- 2010.  (n+k) patterns were removed from the language.
-- fact5x :: Int -> Int
-- fact5x 0     = 1
-- fact5x (n+1) = (n+1) * fact5x n

-- Using library functions
-- Returns 1 for negative argument
fact5 :: Integer -> Integer
fact5 n = product [1..n]

-- Using tail recursive auxiliary function factIter with extra arg
-- explicitly undefined for negative argument
fact6 :: Int -> Int
fact6 n = factIter n 1

-- not exported
factIter :: Int -> Int -> Int
factIter 0 r         = r
factIter n r | n > 0 = factIter (n-1) (n*r)

{-
    Experimenting with more advanced functions
-}

-- Using Maybe (as an instance of Functor type class)
-- Java 8+ Optional is similar to Haskell's Maybe
-- Java 8+ map functions on Streams are similar to fmap
fact7 :: Int -> Maybe Int
fact7 n | n == 0    = Just 1
fact7 n | n > 0     = fmap (*n) (fact7 (n-1))
fact7 n | otherwise = Nothing

-- Like fact4 but using unbounded Integer input and output
-- Infinite recursion for negative argument
fact8 :: Integer -> Integer
fact8 n
  | n == 0 =  1
  | n >= 1 =  n * fact8 (n-1)

-- Like fact5 except Integer input, Double output
-- [1..n] is a list of Integer, product [1..n] is an Integer
-- fromInteger converts to Double
fact9 :: Integer -> Double
fact9 n = fromInteger (product [1..n])

-- Using foldl -- essentially same as fact5 except unbounded
-- Java 8+ reduce operations on Streams are similar to foldl/foldr
fact10 :: Integer -> Integer
fact10 n = foldl (*) 1 [1..n]

-- Using foldr
-- Java 8+ reduce operations on Streams are similar to foldl/foldr
fact11 :: Integer -> Integer
fact11 n = foldr (*) 1 [1..n]
