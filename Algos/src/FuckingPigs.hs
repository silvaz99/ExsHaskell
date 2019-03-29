
data Sum a b = First a | Second b deriving (Eq, Show)

data Product a b = Product a b deriving (Eq, Show)

type Name = String
type Age = Int
type LovesMud = Bool

type PoundOfWool = Int

data CowInfo = CowInfo Name Age
            deriving (Eq, Show)

data PigInfo =
    PigInfo Name Age LovesMud
    deriving (Eq, Show)

data SheepInfo =
    SheepInfo Name Age PoundOfWool
    deriving (Eq, Show)

data Animal =
    Cow CowInfo
    | Pig PigInfo
    | Sheep SheepInfo
    deriving (Eq, Show)

type Animal' =
    Sum CowInfo (Sum PigInfo SheepInfo)
