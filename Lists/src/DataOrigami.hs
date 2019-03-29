
stops = "pbtdkg"
vowels = "aeiou"

func :: String -> [[Char]]
func a = map (:[]) a

bigMap :: String -> String -> [([Char], [Char], [Char])]
bigMap a b = groupFunc (func a) (func b)

groupFunc :: [[Char]] -> [[Char]] -> [([Char], [Char], [Char])]
groupFunc a [] = []
groupFunc (a:as) (b:bs) = (a,b,a) : groupFunc (a:as) bs
