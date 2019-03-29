zippy :: [a] -> [b] -> [(a, b)]
zippy [] _ = []
zippy _ [] = []
zippy (a:as) (b:bs) = (a, b) : zippy as bs



-- myHead :: [t] -> Maybe t
-- myHead [] = Nothing
-- myHead (x : _) = Just x

myHead :: [t] -> t
myHead (x : _) = x
