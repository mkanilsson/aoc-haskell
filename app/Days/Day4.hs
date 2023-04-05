module Days.Day4 where

import Data.Char (digitToInt)
import Data.List.Split
import Utils

sectors :: [Char] -> ((Int, Int), (Int, Int))
sectors line = ((strToInt elf1Start, strToInt elf1End), (strToInt elf2Start, strToInt elf2End))
  where
    (elf1Sectors : elf2Sectors : _) = splitOn "," line
    (elf1Start : elf1End : _) = splitOn "-" elf1Sectors
    (elf2Start : elf2End : _) = splitOn "-" elf2Sectors

totalOverlaps :: ((Int, Int), (Int, Int)) -> Bool
totalOverlaps ((elf1Start, elf1End), (elf2Start, elf2End)) = (elf1Start <= elf2Start && elf1End >= elf2End) || (elf2Start <= elf1Start && elf2End >= elf1End)

overlaps :: ((Int, Int), (Int, Int)) -> Bool
overlaps ((elf1Start, elf1End), (elf2Start, elf2End)) =  elf1LowerInElf2Range || elf1UpperInElf2Range || elf2LowerInElf1Range || elf2UpperInElf1Range
    where
        elf1LowerInElf2Range = elf1Start >= elf2Start && elf1Start <= elf2End
        elf1UpperInElf2Range = elf1End >= elf2Start && elf1End <= elf2End

        elf2LowerInElf1Range = elf2Start >= elf1Start && elf2Start <= elf1End
        elf2UpperInElf1Range = elf2End >= elf1Start && elf2End <= elf1End



boolToInt :: Bool -> Int
boolToInt False = 0
boolToInt True = 1

part1 :: [[Char]] -> IO ()
part1 lines =
  do
    print "Day 4 - Part 1"
    print $ sum $ map (boolToInt . totalOverlaps . sectors) lines

part2 :: [[Char]] -> IO ()
part2 lines =
  do
    print "Day 4 - Part 2"
    print $ sum $ map (boolToInt . overlaps . sectors) lines
