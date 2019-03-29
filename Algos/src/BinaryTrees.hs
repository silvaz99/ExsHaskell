data BinaryTree a =
    Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Show, Ord)

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) =
    Node (mapTree f left) (f a) (mapTree f right)

-- func :: (a -> b) -> BinaryTree a -> BinaryTree b
-- func a = undefined

testTree' :: BinaryTree Integer
testTree' =
    Node (Node Leaf 3 Leaf)
        1
        (Node Leaf 4 Leaf)

mapExpected =
    Node (Node Leaf 4 Leaf)
    2
    (Node Leaf 5 Leaf)
----------

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left a right) = [a] ++ preorder left ++ preorder right

inorder :: BinaryTree a -> [a]
inorder (Node left a right) = preorder left ++ [a] ++ preorder right
-- inorder :: BinaryTree a -> [a]
-- inorder (Node left a right) = inorder (a (inorder left) : []) right

postorder :: BinaryTree a -> [a]
postorder = undefined

testTree :: BinaryTree Integer
testTree =
    Node (Node Leaf 1 Leaf)
        2
        (Node Leaf 3 Leaf)

testPreorder :: IO()
testPreorder =
    if preorder testTree == [2,1,3]
    then putStrLn "Preorder Fine!"
    else putStrLn "Bas news bears"

testInorder :: IO()
testInorder =
    if inorder testTree == [1,2,3]
    then putStrLn "Inorder Fine!"
    else putStrLn "Bas news bears"

foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree _ b Leaf = b
foldTree f b (Node left a right) =  foldTree f (f a (foldTree f b left)) right

mapOkay =
    if mapTree (+1) testTree' == mapExpected
        then print "yup okay!"
        else error "test failed!"
