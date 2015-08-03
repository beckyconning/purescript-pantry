module Test.QuickCheck.LCG (Seed(), randomSeed, lcgNext, lcgN, lcgC, lcgM, runSeed, mkSeed) where
import Prelude ()
import Data.Maybe.Unsafe ()
import Data.Int ()
import Math ()
import Test.QuickCheck.LCG ()
import Control.Monad.Eff.Random ()
import Prim ()
import Prelude ()
import Math ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Random ()
import Data.Int ()
import Data.Int.Bits ()
import Data.Maybe.Unsafe ()
--  | A seed for the linear congruential generator. We omit a `Semiring`
--  | instance because there is no `zero` value, as 0 is not an acceptable
--  | seed for the generator.
--  | The minimum permissible Seed value.
--  | The *modulus*: a magic constant for the linear congruential generator.
--  | It is equal to 2^31 - 1, a Mersenne prime. It is useful for this value to
--  | be prime, because then the requirement of the initial seed being coprime
--  | to the modulus is satisfied when the seed is between 1 and lcgN - 1.
--  | The *multiplier*: a magic constant for the linear congruential generator
--  | The maximum permissible Seed value.
--  | The *increment*: a magic constant for the linear congruential generator
--  | Step the linear congruential generator
--  | Create a random seed
data Seed
foreign import randomSeed :: forall e. Control.Monad.Eff.Eff (random :: Control.Monad.Eff.Random.RANDOM | e) Test.QuickCheck.LCG.Seed
foreign import lcgNext :: Test.QuickCheck.LCG.Seed -> Test.QuickCheck.LCG.Seed
foreign import lcgN :: Prim.Int
foreign import lcgC :: Prim.Int
foreign import lcgM :: Prim.Int
foreign import runSeed :: Test.QuickCheck.LCG.Seed -> Prim.Int
foreign import mkSeed :: Prim.Int -> Test.QuickCheck.LCG.Seed
foreign import instance showSeed :: Prelude.Show Test.QuickCheck.LCG.Seed
foreign import instance eqSeed :: Prelude.Eq Test.QuickCheck.LCG.Seed