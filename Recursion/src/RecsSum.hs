recsum :: (Eq a, Num a) => a -> a
recsum n
    | n == 1    = 1
    | otherwise = n + recsum (n - 1)

multrec :: (Integral a) => a -> a -> a
multrec a b
    | b == 0 || a == 0   = 0
    | b == 1    = a
    | otherwise = a + multrec a (b - 1)

mc91 :: (Num a, Ord a) => a -> a
mc91 a
    | a > 100 = a - 10
    | otherwise = mc91 (mc91 (a + 11))
