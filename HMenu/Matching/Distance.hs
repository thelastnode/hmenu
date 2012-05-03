module HMenu.Matching.Distance (
  editDistance,
  subseqDistance,
) where

editDistance :: String -> String -> Integer
editDistance a "" = fromIntegral $ length a
editDistance "" a = fromIntegral $ length a
editDistance a@(x:xs) b@(y:ys) | x == y    = editDistance xs ys
                               | otherwise = 1 + minimum [ editDistance xs b
                                                         , editDistance a ys
                                                         ]
lcs :: String -> String -> Integer
lcs _ "" = 0
lcs "" _ = 0
lcs a@(x:xs) b@(y:ys) | x == y    = 1 + lcs xs ys
                      | otherwise = maximum [ lcs a ys
                                            , lcs xs b
                                            ]

subseqDistance :: String -> String -> Integer
subseqDistance a b = smaller * (smaller - lcs a b) + bigger - smaller
  where x = (fromIntegral $ length a)
        y = (fromIntegral $ length b)
        smaller = min x y
        bigger = max x y
