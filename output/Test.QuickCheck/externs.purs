module Test.QuickCheck (Result(Success, Failed), QC(), Testable, (/==), (===), (<?>), test, quickCheckPure, quickCheck', quickCheck) where
import Test.QuickCheck ()
import Prelude ()
import Control.Monad.Eff.Exception ()
import Test.QuickCheck.LCG ()
import Control.Monad.Eff.Console ()
import Test.QuickCheck.Gen ()
import Data.List ()
import Test.QuickCheck.Arbitrary ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Console ()
import Control.Monad.Eff.Exception ()
import Control.Monad.Eff.Random ()
import Data.Int ()
import Data.List ()
import Test.QuickCheck.Arbitrary ()
import Test.QuickCheck.Gen ()
import Test.QuickCheck.LCG ()
--  | The result of a test: success or failure (with an error message).
--  | The `Testable` class represents _testable properties_.
--  |
--  | A testable property is a function of zero or more `Arbitrary` arguments,
--  | returning a `Boolean` or `Result`.
--  |
--  | Testable properties can be passed to the `quickCheck` function.
--  | A type synonym which represents the effects used by the `quickCheck` function.
--  | The `Testable` class represents _testable properties_.
--  |
--  | A testable property is a function of zero or more `Arbitrary` arguments,
--  | returning a `Boolean` or `Result`.
--  |
--  | Testable properties can be passed to the `quickCheck` function.
--  | This operator attaches an error message to a failed test.
--  |
--  | For example:
--  |
--  | ```purescript
--  | test x = myProperty x <?> ("myProperty did not hold for " <> show x)
--  | ```
--  | Self-documenting equality assertion
--  | Self-documenting inequality assertion
--  | The `Testable` class represents _testable properties_.
--  |
--  | A testable property is a function of zero or more `Arbitrary` arguments,
--  | returning a `Boolean` or `Result`.
--  |
--  | Testable properties can be passed to the `quickCheck` function.
--  | Test a property, returning all test results as an array.
--  |
--  | The first argument is the _random seed_ to be passed to the random generator.
--  | The second argument is the number of tests to run.
--  | A variant of the `quickCheck` function which accepts an extra parameter
--  | representing the number of tests which should be run.
--  | Test a property.
--  |
--  | This function generates a new random seed, runs 100 tests and
--  | prints the test results to the console.
data Result = Success  | Failed Prim.String
type QC (eff :: # !) (a :: *) = Control.Monad.Eff.Eff (err :: Control.Monad.Eff.Exception.EXCEPTION, random :: Control.Monad.Eff.Random.RANDOM, console :: Control.Monad.Eff.Console.CONSOLE | eff) a
class Testable prop where
  test :: prop -> Test.QuickCheck.Gen.Gen Test.QuickCheck.Result
foreign import (/==) :: forall a b. (Prelude.Eq a, Prelude.Show a) => a -> a -> Test.QuickCheck.Result
foreign import (===) :: forall a b. (Prelude.Eq a, Prelude.Show a) => a -> a -> Test.QuickCheck.Result
foreign import (<?>) :: Prim.Boolean -> Prim.String -> Test.QuickCheck.Result
foreign import quickCheckPure :: forall prop. (Test.QuickCheck.Testable prop) => Test.QuickCheck.LCG.Seed -> Prim.Int -> prop -> Data.List.List Test.QuickCheck.Result
foreign import quickCheck' :: forall eff prop. (Test.QuickCheck.Testable prop) => Prim.Int -> prop -> Test.QuickCheck.QC eff Prelude.Unit
foreign import quickCheck :: forall eff prop. (Test.QuickCheck.Testable prop) => prop -> Test.QuickCheck.QC eff Prelude.Unit
foreign import instance testableResult :: Test.QuickCheck.Testable Test.QuickCheck.Result
foreign import instance testableBoolean :: Test.QuickCheck.Testable Prim.Boolean
foreign import instance testableFunction :: (Test.QuickCheck.Arbitrary.Arbitrary t, Test.QuickCheck.Testable prop) => Test.QuickCheck.Testable (t -> prop)
foreign import instance showResult :: Prelude.Show Test.QuickCheck.Result