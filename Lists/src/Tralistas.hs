import Symetry

myFilter :: [Char] -> [String]
myFilter a = removeItem "a" (removeItem "the" (myWords a))

mySpace :: [String] -> [String]
mySpace a = map (filter (\x -> (elem x "") == False)) a

myThe :: [String] -> [String]
myThe a = map (filter (\x -> (elem x "the") == False)) a

myA :: [String] -> [String]
myA a = map (filter (\x -> (elem x "a") == False)) a

myAn :: [String] -> [String]
myAn a = map (filter (\x -> (elem x "an") == False)) a

removeItem :: String -> [[Char]] -> [[Char]]
removeItem _ []                 = []
removeItem x (y:ys) | x == y    = removeItem x ys
                    | otherwise = y : removeItem x ys
-- myFilter "the brown dog was goof"
-- [x | x <- ["the", "brown", "dog", "was", "goof"], map (filter ((elem x "the") == False)) x]
-- [x | x <- "the brown dog was goof", (elem x "the") == False, (elem x "an") == False, (elem x "a") == False]
