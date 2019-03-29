{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances  #-}

data Exemple = MakeExemple Int deriving Show

newtype Goats = Goats Int deriving (Show, Eq, TooMany)

newtype Wrapper = Wrapper String deriving (Show, Eq)

instance TooMany Int where
    tooMany n = n > 42
    sumMany = undefined

instance TooMany (Int, Wrapper) where
    tooMany (a, Wrapper b) = (&&) (a > 42) (b == "salala")
    sumMany = undefined

instance TooMany (Int, Int) where
    sumMany (a, b) = (+) a b
    tooMany = undefined

class TooMany a where
    tooMany :: a -> Bool
    sumMany :: a -> Int

-- instance TooMany Bool where
--     tooMany n = n == True
--
-- instance TooMany Goats where
--     tooMany (Goats n) = n < 42
