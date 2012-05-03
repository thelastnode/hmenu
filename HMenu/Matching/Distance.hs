module Distance (
  editDistance
) where

editDistance :: String -> String -> Integer
editDistance a "" = fromIntegral $ length a
editDistance "" a = fromIntegral $ length a
editDistance a@(x:xs) b@(y:ys) | x == y    = editDistance xs ys
                               | otherwise = minimum [ 1 + (editDistance xs b)
                                                     , 1 + (editDistance a ys)
                                                     , 1 + (editDistance xs ys)
                                                     ]