module Data.String.Regex (RegexFlags(), Regex(), noFlags, split, search, replace', replace, match, test, parseFlags, renderFlags, flags, source, regex) where
import Data.String.Regex ()
import Prelude ()
import Data.String ()
import Prim ()
import Prelude ()
import Data.Maybe ()
import Data.String ()
--  | Wraps Javascript `RegExp` objects.
--  | Flags that control matching.
--  | Returns the pattern string used to construct the given `Regex`.
--  | Returns the `RegexFlags` used to construct the given `Regex`.
--  | Returns `true` if the `Regex` matches the string.
--  | Replaces occurences of the `Regex` with the first string. The replacement
--  | string can include special replacement patterns escaped with `"$"`.
--  | See [reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace).
--  | Transforms occurences of the `Regex` using a function of the matched
--  | substring and a list of submatch strings.
--  | See the [reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace#Specifying_a_function_as_a_parameter).
--  | Returns the index of the first match of the `Regex` in the string, or
--  | `-1` if there is no match.
--  | Split the string into an array of substrings along occurences of the `Regex`.
--  | Returns the string representation of the given `RegexFlags`.
--  | Constructs a `Regex` from a pattern string and flags.
--  | Parses the string representation of `RegexFlags`.
--  | All flags set to false.
--  | Matches the string against the `Regex` and returns an array of matches
--  | if there were any. Each match has type `Maybe String`, where `Nothing`
--  | represents an unmatched optional capturing group.
--  | See [reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match).
type RegexFlags = { unicode :: Prim.Boolean, sticky :: Prim.Boolean, multiline :: Prim.Boolean, ignoreCase :: Prim.Boolean, global :: Prim.Boolean }
foreign import data Regex :: *
foreign import noFlags :: Data.String.Regex.RegexFlags
foreign import split :: Data.String.Regex.Regex -> Prim.String -> Prim.Array Prim.String
foreign import search :: Data.String.Regex.Regex -> Prim.String -> Prim.Int
foreign import replace' :: Data.String.Regex.Regex -> (Prim.String -> Prim.Array Prim.String -> Prim.String) -> Prim.String -> Prim.String
foreign import replace :: Data.String.Regex.Regex -> Prim.String -> Prim.String -> Prim.String
foreign import match :: Data.String.Regex.Regex -> Prim.String -> Data.Maybe.Maybe (Prim.Array (Data.Maybe.Maybe Prim.String))
foreign import test :: Data.String.Regex.Regex -> Prim.String -> Prim.Boolean
foreign import parseFlags :: Prim.String -> Data.String.Regex.RegexFlags
foreign import renderFlags :: Data.String.Regex.RegexFlags -> Prim.String
foreign import flags :: Data.String.Regex.Regex -> Data.String.Regex.RegexFlags
foreign import source :: Data.String.Regex.Regex -> Prim.String
foreign import regex :: Prim.String -> Data.String.Regex.RegexFlags -> Data.String.Regex.Regex
foreign import instance showRegex :: Prelude.Show Data.String.Regex.Regex