module LibEqually where

data TisAnInteger =
    TisAn Int

instance Eq TisAnInteger where
    (==) (TisAn intA) (TisAn intB) =
            intA == intB

data Pair a =
    Pair a a

instance Eq x => Eq (Pair x) where
    (==) (Pair a b) (Pair a' b') =
        a == a' && b == b'

data DayOfWeek =
    Mon | Tue | Weds | Thu | Fri | Sat | Sun
    deriving (Show, Ord)

data Date =
    Date DayOfWeek Int

instance Eq DayOfWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Weds Weds = True
    (==) Thu Thu = True
    (==) Fri Fri = True
    (==) Sat Sat = True
    (==) Sun Sun = True
    (==) _ _ = False

instance Eq Date where
    (==) (Date weekday dayOfMonth)
         (Date weekday' dayOfMonth') =
         weekday == weekday' && dayOfMonth == dayOfMonth'
