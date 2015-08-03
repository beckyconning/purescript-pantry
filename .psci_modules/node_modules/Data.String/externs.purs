module Data.String (joinWith, trim, toUpper, toLower, toCharArray, split, stripSuffix, stripPrefix, dropWhile, drop, takeWhile, take, count, replace, localeCompare, singleton, length, uncons, null, lastIndexOf', lastIndexOf, indexOf', indexOf, contains, toChar, fromChar, fromCharArray, charCodeAt, charAt) where
import Data.String ()
import Data.Char ()
import Prelude ()
import Data.String.Unsafe ()
import Data.Maybe ()
import Prim ()
import Prelude ()
import Data.Char ()
import Data.Maybe ()
import Data.Monoid ()
import Data.String.Unsafe ()
--  | Converts an array of characters into a string.
--  | Returns the number of characters the string is composed of.
--  | Replaces the first occurence of the first argument with the second argument.
--  | Returns the first `n` characters of the string.
--  | Returns the string without the first `n` characters.
--  | Returns the number of contiguous characters at the beginning
--  | of the string for which the predicate holds.
--  | Returns the substrings of the second string separated along occurences
--  | of the first string.
--  | * `split " " "hello world" == ["hello", "world"]`
--  | Converts the string into an array of characters.
--  | Returns the argument converted to lowercase.
--  | Returns the argument converted to uppercase.
--  | Removes whitespace from the beginning and end of a string, including
--  | [whitespace characters](http://www.ecma-international.org/ecma-262/5.1/#sec-7.2)
--  | and [line terminators](http://www.ecma-international.org/ecma-262/5.1/#sec-7.3).
--  | Joins the strings in the array together, inserting the first argument
--  | as separator between them.
--  | Returns the first character and the rest of the string,
--  | if the string is not empty.
--  | Returns the longest prefix (possibly empty) of characters that satisfy
--  | the predicate:
--  | Returns `true` if the given string is empty.
--  | Locale-aware sort order comparison.
--  | Returns the index of the last occurrence of the first string in the
--  | second string, starting at the given index. Returns `Nothing` if there is
--  | no match.
--  | Returns the index of the last occurrence of the first string in the
--  | second string. Returns `Nothing` if there is no match.
--  | If the string ends with the given suffix, return the portion of the
--  | string left after removing it, as a Just value. Otherwise, return Nothing.
--  | * `stripSuffix ".exe" "psc.exe" == Just "psc"`
--  | * `stripSuffix ".exe" "psc" == Nothing`
--  | Returns the index of the first occurrence of the first string in the
--  | second string, starting at the given index. Returns `Nothing` if there is
--  | no match.
--  | Returns the index of the first occurrence of the first string in the
--  | second string. Returns `Nothing` if there is no match.
--  | If the string starts with the given prefix, return the portion of the
--  | string left after removing it, as a Just value. Otherwise, return Nothing.
--  | * `stripPrefix "http:" "http://purescript.org" == Just "//purescript.org"`
--  | * `stripPrefix "http:" "https://purescript.org" == Nothing`
--  | Returns a string of length `1` containing the given character.
--  | Returns a string of length `1` containing the given character.
--  | Same as `fromChar`.
--  | Returns the suffix remaining after `takeWhile`.
--  | Checks whether the first string exists in the second string.
--  | Returns the numeric Unicode value of the character at the given index,
--  | if the index is within bounds.
--  | Returns the character at the given index, if the index is within bounds.
foreign import joinWith :: Prim.String -> Prim.Array Prim.String -> Prim.String
foreign import trim :: Prim.String -> Prim.String
foreign import toUpper :: Prim.String -> Prim.String
foreign import toLower :: Prim.String -> Prim.String
foreign import toCharArray :: Prim.String -> Prim.Array Prim.Char
foreign import split :: Prim.String -> Prim.String -> Prim.Array Prim.String
foreign import stripSuffix :: Prim.String -> Prim.String -> Data.Maybe.Maybe Prim.String
foreign import stripPrefix :: Prim.String -> Prim.String -> Data.Maybe.Maybe Prim.String
foreign import dropWhile :: (Prim.Char -> Prim.Boolean) -> Prim.String -> Prim.String
foreign import drop :: Prim.Int -> Prim.String -> Prim.String
foreign import takeWhile :: (Prim.Char -> Prim.Boolean) -> Prim.String -> Prim.String
foreign import take :: Prim.Int -> Prim.String -> Prim.String
foreign import count :: (Prim.Char -> Prim.Boolean) -> Prim.String -> Prim.Int
foreign import replace :: Prim.String -> Prim.String -> Prim.String -> Prim.String
foreign import localeCompare :: Prim.String -> Prim.String -> Prelude.Ordering
foreign import singleton :: Prim.Char -> Prim.String
foreign import length :: Prim.String -> Prim.Int
foreign import uncons :: Prim.String -> Data.Maybe.Maybe { tail :: Prim.String, head :: Prim.Char }
foreign import null :: Prim.String -> Prim.Boolean
foreign import lastIndexOf' :: Prim.String -> Prim.Int -> Prim.String -> Data.Maybe.Maybe Prim.Int
foreign import lastIndexOf :: Prim.String -> Prim.String -> Data.Maybe.Maybe Prim.Int
foreign import indexOf' :: Prim.String -> Prim.Int -> Prim.String -> Data.Maybe.Maybe Prim.Int
foreign import indexOf :: Prim.String -> Prim.String -> Data.Maybe.Maybe Prim.Int
foreign import contains :: Prim.String -> Prim.String -> Prim.Boolean
foreign import toChar :: Prim.String -> Data.Maybe.Maybe Prim.Char
foreign import fromChar :: Prim.Char -> Prim.String
foreign import fromCharArray :: Prim.Array Prim.Char -> Prim.String
foreign import charCodeAt :: Prim.Int -> Prim.String -> Data.Maybe.Maybe Prim.Int
foreign import charAt :: Prim.Int -> Prim.String -> Data.Maybe.Maybe Prim.Char