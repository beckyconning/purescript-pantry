module Data.Char (toCharCode, fromCharCode, toString) where
import Data.Char ()
import Prelude ()
import Prim ()
import Prelude ()
--  | Characters fall within the Unicode range.
--  | Returns the string of length `1` containing only the given character.
--  | Returns the numeric Unicode value of the character.
--  | Constructs a character from the given Unicode numeric value.
--  | Characters fall within the Unicode range.
foreign import toCharCode :: Prim.Char -> Prim.Int
foreign import fromCharCode :: Prim.Int -> Prim.Char
foreign import toString :: Prim.Char -> Prim.String
foreign import instance boundedChar :: Prelude.Bounded Prim.Char