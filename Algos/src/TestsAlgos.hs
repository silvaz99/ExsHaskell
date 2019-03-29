data Weekday =
    Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
    deriving (Eq, Show)

f Friday = "Miller Time"

word = "meet at down"
varZip = zip (enumFromTo 0 25) (enumFromTo 'a' 'z')
crypt = "ally"

func :: [Char] -> [Char]
func x =  undefined

funcX :: [Char] -> [Char] -> [(Char, Char)]
funcX a b
    | (length a > length b) = (zip (fst (splitAt (length b) (concat (myLines a)))) b) : drop ((length b) a) b
    | otherwise = (zip (take (length b) (concat (myLines a))) b)

myLines :: String -> [String]
myLines s
    | s /= [] = (:) (takeWhile (/= ' ') s) (myLines ((dropWhile (== ' ')) (dropWhile (/= ' ') s)))
    | otherwise = init ((:[]) [])
