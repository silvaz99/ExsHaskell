safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x : _) = Just x

enumFromTop :: (Ord a, Enum a) => a -> a -> [a]
enumFromTop n m
    | n < m = (:) n (enumFromTop (succ n) m)
    | otherwise = (:[]) n
