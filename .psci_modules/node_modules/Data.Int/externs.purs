module Data.Int (odd, even, fromString, toNumber, round, floor, ceil, fromNumber) where
import Data.Int ()
import Prelude ()
import Math ()
import Data.Maybe.Unsafe ()
import Data.Int.Bits ()
import Prim ()
import Prelude ()
import Data.Int.Bits ()
import Data.Maybe ()
import Data.Maybe.Unsafe ()
import Math ()
--  | Converts an `Int` value back into a `Number`. Any `Int` is a valid `Number`
--  | so there is no loss of precision with this function.
--  | The negation of `even`.
--  |
--  | ``` purescript
--  | odd 0 == false
--  | odd 1 == false
--  | ```
--  | Reads an `Int` from a `String` value. The number must parse as an integer
--  | and fall within the valid range of values for the `Int` type, otherwise
--  | `Nothing` is returned.
--  | Creates an `Int` from a `Number` value. The number must already be an
--  | integer and fall within the valid range of values for the `Int` type
--  | otherwise `Nothing` is returned.
--  | Convert an integral `Number` to an `Int`, by clamping to the `Int` range.
--  | This function will throw an error at runtime if the argument is
--  | non-integral.
--  | Convert a `Number` to an `Int`, by taking the nearest integer to the
--  | argument. Values outside the `Int` range are clamped.
--  | Convert a `Number` to an `Int`, by taking the closest integer equal to or
--  | less than the argument. Values outside the `Int` range are clamped.
--  | Returns whether an `Int` is an even number.
--  |
--  | ``` purescript
--  | even 0 == true
--  | even 1 == false
--  | ```
--  | Convert a `Number` to an `Int`, by taking the closest integer equal to or
--  | greater than the argument. Values outside the `Int` range are clamped.
foreign import odd :: Prim.Int -> Prim.Boolean
foreign import even :: Prim.Int -> Prim.Boolean
foreign import fromString :: Prim.String -> Data.Maybe.Maybe Prim.Int
foreign import toNumber :: Prim.Int -> Prim.Number
foreign import round :: Prim.Number -> Prim.Int
foreign import floor :: Prim.Number -> Prim.Int
foreign import ceil :: Prim.Number -> Prim.Int
foreign import fromNumber :: Prim.Number -> Data.Maybe.Maybe Prim.Int