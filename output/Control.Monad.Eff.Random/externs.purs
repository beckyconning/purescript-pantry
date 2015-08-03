module Control.Monad.Eff.Random (RANDOM(), randomBool, randomRange, randomInt, random) where
import Prelude ()
import Control.Monad.Eff.Random ()
import Data.Maybe.Unsafe ()
import Data.Int ()
import Math ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Data.Int ()
import Data.Maybe.Unsafe ()
--  | The `RANDOM` effect indicates that an Eff action may access or modify the
--  | JavaScript global random number generator, i.e. `Math.random()`.
--  | Returns a random number between 0 (inclusive) and 1 (exclusive). This is
--  | a direct wrapper around JavaScript's `Math.random()`.
--  | Returns a random number between a minimum value (inclusive) and a maximum
--  | value (exclusive). It is unspecified what happens if `maximum < minimum`.
--  |
--  | For example:
--  | ``` purescript
--  | randomRange 1.0 2.0 >>= Console.print
--  | ```
--  | will print a random number between 1 and 2.
--  | Takes a range specified by `low` (the first argument) and `high` (the
--  | second), and returns a random integer uniformly distributed in the closed
--  | interval `[low, high]`. It is unspecified what happens if `low > high`,
--  | or if either of `low` or `high` is not an integer.
--  |
--  | For example:
--  | ``` purescript
--  | randomInt 1 10 >>= Console.print
--  | ```
--  | will print a random integer between 1 and 10.
--  | Returns a random boolean value with an equal chance of being `true` or
--  | `false`.
foreign import data RANDOM :: !
foreign import randomBool :: forall e. Control.Monad.Eff.Eff (random :: Control.Monad.Eff.Random.RANDOM | e) Prim.Boolean
foreign import randomRange :: forall e. Prim.Number -> Prim.Number -> Control.Monad.Eff.Eff (random :: Control.Monad.Eff.Random.RANDOM | e) Prim.Number
foreign import randomInt :: forall e. Prim.Int -> Prim.Int -> Control.Monad.Eff.Eff (random :: Control.Monad.Eff.Random.RANDOM | e) Prim.Int
foreign import random :: forall e. Control.Monad.Eff.Eff (random :: Control.Monad.Eff.Random.RANDOM | e) Prim.Number