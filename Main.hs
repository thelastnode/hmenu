module Main (
  main
) where

import System.Environment (getArgs)

import HMenu.Matching.Distance (editDistance)
import HMenu.Select (select)

main :: IO ()
main = do
  list <- getContents
  args <- getArgs
  let input = args !! 0
  let xs = lines list
  putStrLn $ show $ select editDistance input xs
