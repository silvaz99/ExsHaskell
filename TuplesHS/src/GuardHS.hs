
avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
    | y >= 0.9 = 'A'
    | y >= 0.8 = 'B'
    | y >= 0.7 = 'C'
    | y >= 0.59 = 'D'
    | otherwise = 'F'
    where y = x / 100

pal xs
    | xs == reverse xs = True
    | otherwise = False


tensDigit :: Integral a => a -> (a, a)
tensDigit x = divMod x 10

foldBool :: a -> a -> Bool -> a
foldBool x y z = if z == False then y else x

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y z
    | z == False = y
    | otherwise = x

addOneT :: (Num a) => (a, b) -> (a, b)
addOneT (x, y) = (x + 1, y)

fillFunc :: (Num a, Num b) => (a -> b) -> (a, c) -> (b, c)
fillFunc f (x, y) = f (x, y)
