module Main where

import Data.List.Split
import Days.Day1 as Day1
import Days.Day2 as Day2
import Days.Day3 as Day3
import Days.Day4 as Day4

day1 :: IO ()
day1 = do
  contents <- readFile "days/01/input.txt"
  Day1.part1 contents
  Day1.part2 contents

day2 :: IO ()
day2 = do
  contents <- readFile "days/02/input.txt"
  let (_ : revLines) = reverse $ splitOn "\n" contents -- Remove empty string
  let lines = reverse revLines

  Day2.part1 lines
  Day2.part2 lines

day3 :: IO ()
day3 = do
  contents <- readFile "days/03/input.txt"
  let (_ : revLines) = reverse $ splitOn "\n" contents -- Remove empty string
  let lines = reverse revLines

  Day3.part1 lines
  Day3.part2 lines

day4 :: IO ()
day4 = do
  contents <- readFile "days/04/input.txt"
  let (_ : revLines) = reverse $ splitOn "\n" contents -- Remove empty string
  let lines = reverse revLines

  Day4.part1 lines
  Day4.part2 lines

main :: IO ()
main = do
  day1
  day2
  day3
  day4
