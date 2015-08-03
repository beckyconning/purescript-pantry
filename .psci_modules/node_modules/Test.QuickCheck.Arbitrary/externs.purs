module Test.QuickCheck.Arbitrary (Coarbitrary, Arbitrary, coarbitrary, arbitrary) where
import Prelude ()
import Test.QuickCheck.Gen ()
import Data.Int ()
import Data.String ()
import Test.QuickCheck.Arbitrary ()
import Data.Char ()
import Data.Foldable ()
import Prim ()
import Prelude ()
import Data.Char ()
import Data.Either ()
import Data.Maybe ()
import Data.String ()
import Data.Tuple ()
import Data.Int ()
import Data.Foldable ()
import Test.QuickCheck.Gen ()
--  | The `Coarbitrary` class represents types which appear on the left of
--  | an `Arbitrary` function arrow.
--  |
--  | To construct an `Arbitrary` instance for the type `a -> b`, we need to
--  | use the input of type `a` to _perturb_ a random generator for `b`. This
--  | is the role of the `coarbitrary` function.
--  |
--  | `Coarbitrary` instances can be written using the `perturbGen` function.
--  | The `Arbitrary` class represents those types whose values can be
--  | _randomly-generated_.
--  |
--  | `arbitrary` uses the `Gen` monad to express a random generator for
--  | the type `t`. Combinators in the `Test.QuickCheck.Gen`
--  | module can be used to construct random generators.
--  | The `Arbitrary` class represents those types whose values can be
--  | _randomly-generated_.
--  |
--  | `arbitrary` uses the `Gen` monad to express a random generator for
--  | the type `t`. Combinators in the `Test.QuickCheck.Gen`
--  | module can be used to construct random generators.
--  | The `Coarbitrary` class represents types which appear on the left of
--  | an `Arbitrary` function arrow.
--  |
--  | To construct an `Arbitrary` instance for the type `a -> b`, we need to
--  | use the input of type `a` to _perturb_ a random generator for `b`. This
--  | is the role of the `coarbitrary` function.
--  |
--  | `Coarbitrary` instances can be written using the `perturbGen` function.
--  | The `Coarbitrary` class represents types which appear on the left of
--  | an `Arbitrary` function arrow.
--  |
--  | To construct an `Arbitrary` instance for the type `a -> b`, we need to
--  | use the input of type `a` to _perturb_ a random generator for `b`. This
--  | is the role of the `coarbitrary` function.
--  |
--  | `Coarbitrary` instances can be written using the `perturbGen` function.
--  | The `Arbitrary` class represents those types whose values can be
--  | _randomly-generated_.
--  |
--  | `arbitrary` uses the `Gen` monad to express a random generator for
--  | the type `t`. Combinators in the `Test.QuickCheck.Gen`
--  | module can be used to construct random generators.
class Coarbitrary t where
  coarbitrary :: forall r. t -> Test.QuickCheck.Gen.Gen r -> Test.QuickCheck.Gen.Gen r
class Arbitrary t where
  arbitrary :: Test.QuickCheck.Gen.Gen t
foreign import instance arbBoolean :: Test.QuickCheck.Arbitrary.Arbitrary Prim.Boolean
foreign import instance coarbBoolean :: Test.QuickCheck.Arbitrary.Coarbitrary Prim.Boolean
foreign import instance arbNumber :: Test.QuickCheck.Arbitrary.Arbitrary Prim.Number
foreign import instance coarbNumber :: Test.QuickCheck.Arbitrary.Coarbitrary Prim.Number
foreign import instance arbInt :: Test.QuickCheck.Arbitrary.Arbitrary Prim.Int
foreign import instance coarbInt :: Test.QuickCheck.Arbitrary.Coarbitrary Prim.Int
foreign import instance arbString :: Test.QuickCheck.Arbitrary.Arbitrary Prim.String
foreign import instance coarbString :: Test.QuickCheck.Arbitrary.Coarbitrary Prim.String
foreign import instance arbChar :: Test.QuickCheck.Arbitrary.Arbitrary Prim.Char
foreign import instance coarbChar :: Test.QuickCheck.Arbitrary.Coarbitrary Prim.Char
foreign import instance arbUnit :: Test.QuickCheck.Arbitrary.Arbitrary Prelude.Unit
foreign import instance coarbUnit :: Test.QuickCheck.Arbitrary.Coarbitrary Prelude.Unit
foreign import instance arbOrdering :: Test.QuickCheck.Arbitrary.Arbitrary Prelude.Ordering
foreign import instance coarbOrdering :: Test.QuickCheck.Arbitrary.Coarbitrary Prelude.Ordering
foreign import instance arbArray :: (Test.QuickCheck.Arbitrary.Arbitrary a) => Test.QuickCheck.Arbitrary.Arbitrary (Prim.Array a)
foreign import instance coarbArray :: (Test.QuickCheck.Arbitrary.Coarbitrary a) => Test.QuickCheck.Arbitrary.Coarbitrary (Prim.Array a)
foreign import instance arbFunction :: (Test.QuickCheck.Arbitrary.Coarbitrary a, Test.QuickCheck.Arbitrary.Arbitrary b) => Test.QuickCheck.Arbitrary.Arbitrary (a -> b)
foreign import instance coarbFunction :: (Test.QuickCheck.Arbitrary.Arbitrary a, Test.QuickCheck.Arbitrary.Coarbitrary b) => Test.QuickCheck.Arbitrary.Coarbitrary (a -> b)
foreign import instance arbTuple :: (Test.QuickCheck.Arbitrary.Arbitrary a, Test.QuickCheck.Arbitrary.Arbitrary b) => Test.QuickCheck.Arbitrary.Arbitrary (Data.Tuple.Tuple a b)
foreign import instance coarbTuple :: (Test.QuickCheck.Arbitrary.Coarbitrary a, Test.QuickCheck.Arbitrary.Coarbitrary b) => Test.QuickCheck.Arbitrary.Coarbitrary (Data.Tuple.Tuple a b)
foreign import instance arbMaybe :: (Test.QuickCheck.Arbitrary.Arbitrary a) => Test.QuickCheck.Arbitrary.Arbitrary (Data.Maybe.Maybe a)
foreign import instance coarbMaybe :: (Test.QuickCheck.Arbitrary.Coarbitrary a) => Test.QuickCheck.Arbitrary.Coarbitrary (Data.Maybe.Maybe a)
foreign import instance arbEither :: (Test.QuickCheck.Arbitrary.Arbitrary a, Test.QuickCheck.Arbitrary.Arbitrary b) => Test.QuickCheck.Arbitrary.Arbitrary (Data.Either.Either a b)
foreign import instance coarbEither :: (Test.QuickCheck.Arbitrary.Coarbitrary a, Test.QuickCheck.Arbitrary.Coarbitrary b) => Test.QuickCheck.Arbitrary.Coarbitrary (Data.Either.Either a b)