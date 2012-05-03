module HMenu.Matching.Distance (
  editDistance
) where

editDistance :: String -> String -> Integer
editDistance a "" = fromIntegral $ length a
editDistance "" a = fromIntegral $ length a
editDistance a@(x:xs) b@(y:ys) | x == y    = editDistance xs ys
                               | otherwise = 1 + minimum [ (editDistance xs b)
                                                         , (editDistance a ys)
                                                         ]
