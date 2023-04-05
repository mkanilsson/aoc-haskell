module Days.Day1 where

import Data.Char (isSpace)
import Data.List
import Data.List.Split
import Utils

groupSum :: [Char] -> Int
groupSum group = sum $ map strToInt $ splitOn "\n" $ trim group

part1 :: [Char] -> IO ()
part1 contents = do
  print "Day 1 - Part 1"
  let groups = splitOn "\n\n" contents
  let (first : _) = reverse $ sort $ map groupSum groups
  print first

part2 :: [Char] -> IO ()
part2 contents = do
  print "Day 1 - Part 2"
  let groups = splitOn "\n\n" contents
  let (first : second : third : xs) = reverse $ sort $ map groupSum groups
  print $ sum [first, second, third]
