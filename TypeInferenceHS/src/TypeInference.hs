-- TypeInference.hs

module TypeInference where

f :: Num a => a -> a -> a
f x y = x + y + 3

-- (++) :: [a] -> [a] -> [a]

myConcat x = x ++ "yo"
