import Data.Time
-- import Data.Data

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = [DbDate (UTCTime (fromGregorian 1911 5 1)
                        (secondsToDiffTime 34123))
                , DbNumber 9001
                , DbString "Hello, World!"
                , DbDate (UTCTime
                    (fromGregorian 1921 5 1)
                    (secondsToDiffTime 34123))
                , DbNumber 3101
                ]

filterDbDateX :: [DatabaseItem] -> [UTCTime]
filterDbDateX a = foldr getTimes [] a

getTimes :: DatabaseItem -> [UTCTime] -> [UTCTime]
getTimes (DbDate time) dates = time : dates
getTimes _ dates = dates

-- foldr :: (a -> b -> b) -> b -> [a] -> b
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber a = foldr getNumbers [] a

getNumbers :: DatabaseItem -> [Integer] -> [Integer]
getNumbers (DbNumber number) anything = number : anything
getNumbers _ anything = anything

mostRecent :: [DatabaseItem] -> Maybe UTCTime
mostRecent a = (newFunc . filterDbDateX) $ a

newFunc :: [UTCTime] -> Maybe UTCTime
newFunc [] = Nothing
newFunc a = Just (foldr1 min a)

sumDb :: [DatabaseItem] -> Integer
sumDb a = (sumNum . filterDbNumber) $ a

sumNum :: [Integer] -> Integer
sumNum a = foldr (+) 0 a

typeOf :: DatabaseItem -> Bool
typeOf a =
    case a of
        DbDate a -> True
        _ -> False

-- getData :: DatabaseItem -> UTCTime
-- getData a =
--     case a of
--         DbDate a -> UTCTime a
--         _ ->
