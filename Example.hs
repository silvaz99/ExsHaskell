cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y
-- tralla

flippy = flip cattyConny

appedCatty = cattyConny "woops"
frappe = flippy "haha"
