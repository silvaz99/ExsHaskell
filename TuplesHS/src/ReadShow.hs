module Arith4 where

-- read :: Read a => String a -> a
-- show :: Show a => a -> String a

roundTrip :: (Show a, Read b) => a -> b
roundTrip a = (read . show) a

main = do
    print (roundTrip 4 :: Int)
    print (roundTrip 3.5 :: Float)
    print (roundTrip "Ezeks" :: String)
    print (roundTrip (2, 4) :: (Int, Float))
    -- print (id 4)
