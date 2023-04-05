module Days.Day2 where

import Control.Arrow (Arrow (second))
import Data.Char (isSpace)
import Data.List
import Data.List.Split
import GHC.Base (error)

data Outcome = Win | Draw | Lose deriving (Show)

outcomeFromChar :: Char -> Outcome
outcomeFromChar char = case char of
  'X' -> Lose
  'Y' -> Draw
  'Z' -> Win
  _ -> error $ "illegal char '" ++ [char] ++ "'"

data Selection = Rock | Paper | Sissor deriving (Show)

selectionFromChar :: Char -> Selection
selectionFromChar char = case char of
  'A' -> Rock
  'X' -> Rock
  'B' -> Paper
  'Y' -> Paper
  'C' -> Sissor
  'Z' -> Sissor
  _ -> error $ "illegal char '" ++ [char] ++ "'"

valueFromSelection :: Selection -> Int
valueFromSelection selection = case selection of
  Rock -> 1
  Paper -> 2
  Sissor -> 3

selection :: [Char] -> (Selection, Selection)
selection line = (selectionFromChar first, selectionFromChar second)
  where
    (first : _ : second : _) = line

evaluateRound :: (Selection, Selection) -> Int
evaluateRound (Rock, Rock) = valueFromSelection Rock + 3
evaluateRound (Paper, Paper) = valueFromSelection Paper + 3
evaluateRound (Sissor, Sissor) = valueFromSelection Sissor + 3
evaluateRound (Rock, Paper) = valueFromSelection Paper + 6
evaluateRound (Paper, Sissor) = valueFromSelection Sissor + 6
evaluateRound (Sissor, Rock) = valueFromSelection Rock + 6
evaluateRound (Sissor, Paper) = valueFromSelection Paper + 0
evaluateRound (Rock, Sissor) = valueFromSelection Sissor + 0
evaluateRound (Paper, Rock) = valueFromSelection Rock + 0

part1 :: [[Char]] -> IO ()
part1 lines =
  do
    print "Day 2 - Part 1"
    let rounds = map selection lines
    let points = map evaluateRound rounds
    let score = sum points

    -- print rounds
    -- print points
    -- print score

    print $ sum $ map (evaluateRound . selection) lines

selectionOutcome :: [Char] -> (Selection, Outcome)
selectionOutcome line = (selectionFromChar first, outcomeFromChar second)
  where
    (first : _ : second : _) = line

predictSelection :: (Selection, Outcome) -> Selection
predictSelection (selection, Draw) = selection
predictSelection (Rock, Win) = Paper
predictSelection (Sissor, Win) = Rock
predictSelection (Paper, Win) = Sissor
predictSelection (Rock, Lose) = Sissor
predictSelection (Sissor, Lose) = Paper
predictSelection (Paper, Lose) = Rock

part2 :: [[Char]] -> IO ()
part2 lines = do
  print "Day 2 - Part 2"
  let rounds = map ((\(s, o) -> (s, predictSelection (s, o))) . selectionOutcome) lines
  print $ sum $ map evaluateRound rounds
