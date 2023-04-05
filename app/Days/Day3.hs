module Days.Day3 where

import Data.Char (chr, ord)
import Data.List (intersect, sort)
import Data.List.Extra (nubOrd)

unique :: Ord a => [a] -> [a]
unique = sort . nubOrd

priorityValue :: Char -> Int
priorityValue 'a' = 1
priorityValue 'A' = 27
priorityValue letter = priorityValue (chr $ (ord $ letter) - 1) + 1

priority :: [Char] -> Int
priority items = sum $ map priorityValue items

part1 :: [[Char]] -> IO ()
part1 lines =
  do
    print "Day 3 - Part 1"
    print $ sum $ map (priority . bothCompartments . compartments) lines

compartments :: [Char] -> ([Char], [Char])
compartments rucksack = (first, last)
  where
    perCompartment = length rucksack `div` 2
    first = take perCompartment rucksack
    last = reverse $ take perCompartment $ reverse rucksack

bothCompartments :: ([Char], [Char]) -> [Char]
bothCompartments (first, second) = unique $ first `intersect` second

part2 :: [[Char]] -> IO ()
part2 lines =
  do
    print "Day 3 - Part 2"
    print $ sum $ map (priority . allCompartments) $ grabThree lines

grabThree :: [[Char]] -> [([Char], [Char], [Char])]
grabThree items = grabThree' items []

grabThree' :: [[Char]] -> [([Char], [Char], [Char])] -> [([Char], [Char], [Char])]
grabThree' [] current = current
grabThree' items current = grabThree' sx $ [(first, second, third)] ++ current
  where
    (first : second : third : sx) = items

allCompartments :: ([Char], [Char], [Char]) -> [Char]
allCompartments (first, second, third) = unique $ first `intersect` second `intersect` third
