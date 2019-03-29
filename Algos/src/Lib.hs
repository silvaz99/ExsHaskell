
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) =
    if x == False
    then False
    else myAnd xs

example = [True, False, True]

myFunc :: [Bool] -> Bool
myFunc z = foldr (&&) True z

myOr :: [Bool] -> Bool
myOr z = foldr (||) False z

myAny :: (a -> Bool) -> [a] -> Bool
myAny f z = foldr ((||) . f) False z

funX :: (Num a, Eq a) => a -> Bool
funX a = if a == 10
        then True
        else False

myElem :: Eq a => a -> [a] -> Bool
myElem a b = foldr ((||) . ((==) $ a)) False b

myReverse :: [a] -> [a]
myReverse a = foldl (flip (:)) [] a
