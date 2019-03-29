import Data.Char

newFunc :: String -> Maybe String
newFunc [] = Nothing
newFunc a = Just ((toUpper (a !! 0)) : drop 1 a)
