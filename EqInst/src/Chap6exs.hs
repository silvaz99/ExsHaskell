module Chap6ex4 where

type Verb = String
type Object = String
type Subject = String

data Sentence =
    Sentence Subject Verb Object deriving (Eq, Show)

s1 = Sentence "Julia" "loves" "dogs"
s2 = Sentence "dogs" "drool"

data Rocks =
    Rocks String deriving (Eq, Show)

data Yeah =
    Yeah Bool deriving (Eq, Show)

data Papu =
    Papu Rocks Yeah deriving (Eq, Show)

-- phew = Papu "Choker" True
truth = Papu (Rocks "Choks") (Yeah False)
equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p'
