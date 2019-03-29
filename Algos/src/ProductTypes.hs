
data Person = Person { name :: String, age :: Int} deriving (Eq, Show)

jm = Person "julie" 19
ca = Person "chris" 21

namae :: Person -> String
namae (Person s _) = s


-- Gardener:[String] * (Gardenia + Daisy + Rose + Lilac)

type Farmhouse = Product NumPigs NumCows
