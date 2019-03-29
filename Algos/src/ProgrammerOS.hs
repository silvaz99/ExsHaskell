
data OperatingSystem =
    GnuPlusLinux
    | OpenBSDPlusNevermindJustBSDStill
    | Mac
    | Windows
    deriving (Eq, Show)

data ProgLang =
    Haskell
    | Agda
    | Idris
    | PureScript
    deriving (Eq, Show)

data Programmer =
    Programmer {os :: OperatingSystem
                , lang :: ProgLang}
                deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
    [ GnuPlusLinux
    , OpenBSDPlusNevermindJustBSDStill
    , Mac
    , Windows
    ]

allLanguages :: [ProgLang]
allLanguages =
    [ Haskell
    , Agda
    , Idris
    , PureScript
    ]

allProgrammers :: [Programmer]
allProgrammers = func allLanguages

addTog :: ProgLang -> [OperatingSystem] -> [Programmer]
addTog _ [] = []
addTog a (b:bs) = Programmer b a : addTog a bs

func :: [ProgLang] -> [Programmer]
func [] = []
func (a:as) = (++) (addTog a allOperatingSystems) (func as)

-- xxx :: 
--
-- funcX :: [OperatingSystem] -> OperatingSystem
-- funcX [] = []
-- funcX = (myHead . drop 1) $ allOperatingSystems
--
-- myHead :: [a] -> a
-- myHead [] = []
-- myHead (x : _) = x
