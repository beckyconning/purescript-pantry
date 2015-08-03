module Test.QuickCheck.Gen (Size(), GenOut(), GenState(), Gen(), randomSample', randomSample, sample, uniform, perturbGen, evalGen, runGen, elements, vectorOf, arrayOf1, arrayOf, frequency, oneOf, chooseInt, choose, resize, sized, variant, stateful, repeatable) where
import Prelude ()
import Test.QuickCheck.Gen ()
import Math ()
import Data.Array ()
import Data.Maybe ()
import Data.Monoid.Additive ()
import Data.Foldable ()
import Data.Tuple ()
import Data.Traversable ()
import Test.QuickCheck.LCG ()
import Data.Int ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Random ()
import Data.Array ()
import Data.Foldable ()
import Data.Int ()
import Data.Maybe ()
import Data.Monoid.Additive ()
import Data.Traversable ()
import Data.Tuple ()
import Data.List ()
import Test.QuickCheck.LCG ()
import Math ()
--  | Tests are parameterized by the `Size` of the randomly-generated data,
--  | the meaning of which depends on the particular generator used.
--  | The state of the random generator monad
--  | The output of the random generator monad
--  | The random generator monad
--  |
--  | `Gen` is a state monad which encodes a linear congruential generator.
--  | Run a random generator
--  | Create a random generator which uses the generator state explicitly.
--  | Create a random generator which depends on the size parameter.
--  | Modify a random generator by setting a new random seed.
--  | Modify a random generator by setting a new size parameter.
--  | Create a random generator for a function type.
--  | Perturb a random generator by modifying the current seed
--  | A random generator which simply outputs the current seed
--  | A random generator which approximates a uniform random variable on `[0, 1]`
--  | Run a random generator, keeping only the randomly-generated result
--  | Create a random generator which chooses uniformly distributed
--  | integers from the closed interval `[a, b]`.
--  | Create a random generator which samples a range of `Number`s i
--  | with uniform probability.
--  | Create a random generator which selects and executes a random generator from
--  | a non-empty, weighted collection of random generators.
--  | Create a random generator which selects and executes a random generator from
--  | a non-empty collection of random generators with uniform probability.
--  | Create a random generator which selects a value from a non-empty collection with
--  | uniform probability.
--  | Create a random generator which generates a vector of random values of a specified size.
--  | Create a random generator which generates an array of random values.
--  | Create a random generator which generates a non-empty array of random values.
--  | Sample a random generator
--  | Sample a random generator, using a randomly generated seed
--  | Get a random sample of 10 values
type Size = Prim.Int
type GenOut (a :: *) = { value :: a, state :: Test.QuickCheck.Gen.GenState }
type GenState = { size :: Test.QuickCheck.Gen.Size, newSeed :: Test.QuickCheck.LCG.Seed }
data Gen (a :: *)
foreign import randomSample' :: forall r a. Test.QuickCheck.Gen.Size -> Test.QuickCheck.Gen.Gen a -> Control.Monad.Eff.Eff (random :: Control.Monad.Eff.Random.RANDOM | r) (Prim.Array a)
foreign import randomSample :: forall r a. Test.QuickCheck.Gen.Gen a -> Control.Monad.Eff.Eff (random :: Control.Monad.Eff.Random.RANDOM | r) (Prim.Array a)
foreign import sample :: forall r a. Test.QuickCheck.LCG.Seed -> Test.QuickCheck.Gen.Size -> Test.QuickCheck.Gen.Gen a -> Prim.Array a
foreign import uniform :: Test.QuickCheck.Gen.Gen Prim.Number
foreign import perturbGen :: forall a. Prim.Number -> Test.QuickCheck.Gen.Gen a -> Test.QuickCheck.Gen.Gen a
foreign import evalGen :: forall a. Test.QuickCheck.Gen.Gen a -> Test.QuickCheck.Gen.GenState -> a
foreign import runGen :: forall a. Test.QuickCheck.Gen.Gen a -> Test.QuickCheck.Gen.GenState -> Test.QuickCheck.Gen.GenOut a
foreign import elements :: forall a. a -> Prim.Array a -> Test.QuickCheck.Gen.Gen a
foreign import vectorOf :: forall a. Prim.Int -> Test.QuickCheck.Gen.Gen a -> Test.QuickCheck.Gen.Gen (Prim.Array a)
foreign import arrayOf1 :: forall a. Test.QuickCheck.Gen.Gen a -> Test.QuickCheck.Gen.Gen (Data.Tuple.Tuple a (Prim.Array a))
foreign import arrayOf :: forall a. Test.QuickCheck.Gen.Gen a -> Test.QuickCheck.Gen.Gen (Prim.Array a)
foreign import frequency :: forall a. Data.Tuple.Tuple Prim.Number (Test.QuickCheck.Gen.Gen a) -> Data.List.List (Data.Tuple.Tuple Prim.Number (Test.QuickCheck.Gen.Gen a)) -> Test.QuickCheck.Gen.Gen a
foreign import oneOf :: forall a. Test.QuickCheck.Gen.Gen a -> Prim.Array (Test.QuickCheck.Gen.Gen a) -> Test.QuickCheck.Gen.Gen a
foreign import chooseInt :: Prim.Int -> Prim.Int -> Test.QuickCheck.Gen.Gen Prim.Int
foreign import choose :: Prim.Number -> Prim.Number -> Test.QuickCheck.Gen.Gen Prim.Number
foreign import resize :: forall a. Test.QuickCheck.Gen.Size -> Test.QuickCheck.Gen.Gen a -> Test.QuickCheck.Gen.Gen a
foreign import sized :: forall a. (Test.QuickCheck.Gen.Size -> Test.QuickCheck.Gen.Gen a) -> Test.QuickCheck.Gen.Gen a
foreign import variant :: forall a. Test.QuickCheck.LCG.Seed -> Test.QuickCheck.Gen.Gen a -> Test.QuickCheck.Gen.Gen a
foreign import stateful :: forall a. (Test.QuickCheck.Gen.GenState -> Test.QuickCheck.Gen.Gen a) -> Test.QuickCheck.Gen.Gen a
foreign import repeatable :: forall a b. (a -> Test.QuickCheck.Gen.Gen b) -> Test.QuickCheck.Gen.Gen (a -> b)
foreign import instance functorGen :: Prelude.Functor Test.QuickCheck.Gen.Gen
foreign import instance applyGen :: Prelude.Apply Test.QuickCheck.Gen.Gen
foreign import instance applicativeGen :: Prelude.Applicative Test.QuickCheck.Gen.Gen
foreign import instance bindGen :: Prelude.Bind Test.QuickCheck.Gen.Gen
foreign import instance monadGen :: Prelude.Monad Test.QuickCheck.Gen.Gen