module Utils where

import Data.Char (isSpace)
import Data.List

trim = dropWhileEnd isSpace . dropWhile isSpace

strToInt :: [Char] -> Int
strToInt a = read (trim a) :: Int
