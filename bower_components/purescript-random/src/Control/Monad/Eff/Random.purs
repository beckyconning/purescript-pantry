module Control.Monad.Eff.Random where

import Prelude

import Control.Monad.Eff (Eff())
import Data.Int (fromNumber, toNumber, floor)

-- | The `RANDOM` effect indicates that an Eff action may access or modify the
-- | JavaScript global random number generator, i.e. `Math.random()`.
foreign import data RANDOM :: !

-- | Returns a random number between 0 (inclusive) and 1 (exclusive). This is
-- | a direct wrapper around JavaScript's `Math.random()`.
foreign import random :: forall e. Eff (random :: RANDOM | e) Number

-- | Takes a range specified by `low` (the first argument) and `high` (the
-- | second), and returns a random integer uniformly distributed in the closed
-- | interval `[low, high]`. It is unspecified what happens if `low > high`,
-- | or if either of `low` or `high` is not an integer.
-- |
-- | For example:
-- | ``` purescript
-- | randomInt 1 10 >>= Console.print
-- | ```
-- | will print a random integer between 1 and 10.
randomInt :: forall e. Int -> Int -> Eff (random :: RANDOM | e) Int
randomInt low high = do
  n <- random
  let asNumber = (toNumber high - toNumber low + one) * n + toNumber low
  return $ floor asNumber

-- | Returns a random number between a minimum value (inclusive) and a maximum
-- | value (exclusive). It is unspecified what happens if `maximum < minimum`.
-- |
-- | For example:
-- | ``` purescript
-- | randomRange 1.0 2.0 >>= Console.print
-- | ```
-- | will print a random number between 1 and 2.
randomRange :: forall e. Number -> Number -> Eff (random :: RANDOM | e) Number
randomRange min max = do
    n <- random
    return (n * (max - min) + min)

-- | Returns a random boolean value with an equal chance of being `true` or
-- | `false`.
randomBool :: forall e. Eff (random :: RANDOM | e) Boolean
randomBool = (< 0.5) <$> random
