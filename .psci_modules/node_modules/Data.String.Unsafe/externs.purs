module Data.String.Unsafe (charCodeAt, charAt, char) where
import Prim ()
import Data.Char ()
--  | Returns the numeric Unicode value of the character at the given index.
--  |
--  | **Unsafe:** throws runtime exception if the index is out of bounds.
--  | Returns the character at the given index.
--  |
--  | **Unsafe:** throws runtime exception if the index is out of bounds.
--  | Converts a string of length `1` to a character.
--  |
--  | **Unsafe:** throws runtime exception if length is not `1`.
foreign import charCodeAt :: Prim.Int -> Prim.String -> Prim.Int
foreign import charAt :: Prim.Int -> Prim.String -> Prim.Char
foreign import char :: Prim.String -> Prim.Char