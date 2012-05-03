module HMenu.Select (
  select
) where

import Data.List (sort)

select :: (String -> String -> Integer) -> String -> [String] -> [String]
select metric input xs = map snd $ sort scoreAndElem
  where d = metric input
        scores = map d xs
        scoreAndElem = zip scores xs
