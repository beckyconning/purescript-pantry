module Test.Unit (Timer(), TestResult(), Assertion(), Test(), TestUnit(), setTimeout, runTest, test, assertFn, assertC, testFn, testC, assertFalse, assert, timeout, pickFirst, failure, success) where
import Prelude ()
import Control.Monad.Eff.Ref ()
import Control.Monad.Cont.Trans ()
import Control.Monad.Error.Trans ()
import Test.Unit ()
import Test.Unit.Console ()
import Prim ()
import Prelude ()
import Control.Monad.Cont.Trans ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Ref ()
import Control.Monad.Error.Trans ()
import Data.Either ()
import Test.Unit.Console ()
foreign import data Timer :: !
type TestResult = Data.Either.Either Prim.String Prelude.Unit
type Assertion (e :: # !) = Test.Unit.TestUnit e
type Test (e :: # !) = Test.Unit.TestUnit e
type TestUnit (e :: # !) = Control.Monad.Error.Trans.ErrorT Prim.String (Control.Monad.Cont.Trans.ContT Prelude.Unit (Control.Monad.Eff.Eff e)) Prelude.Unit
foreign import setTimeout :: forall e a. Prim.Int -> Control.Monad.Eff.Eff (timer :: Test.Unit.Timer | e) a -> Control.Monad.Eff.Eff (timer :: Test.Unit.Timer | e) Prelude.Unit
foreign import runTest :: forall e. Test.Unit.Test (testOutput :: Test.Unit.Console.TestOutput | e) -> Control.Monad.Eff.Eff (testOutput :: Test.Unit.Console.TestOutput | e) Prelude.Unit
foreign import test :: forall e. Prim.String -> Test.Unit.Assertion (testOutput :: Test.Unit.Console.TestOutput | e) -> Test.Unit.Test (testOutput :: Test.Unit.Console.TestOutput | e)
foreign import assertFn :: forall e. Prim.String -> ((Prim.Boolean -> Control.Monad.Eff.Eff e Prelude.Unit) -> Control.Monad.Eff.Eff e Prelude.Unit) -> Test.Unit.Assertion e
foreign import assertC :: forall e. Prim.String -> Control.Monad.Cont.Trans.ContT Prelude.Unit (Control.Monad.Eff.Eff e) Prim.Boolean -> Test.Unit.Assertion e
foreign import testFn :: forall e. ((Test.Unit.TestResult -> Control.Monad.Eff.Eff e Prelude.Unit) -> Control.Monad.Eff.Eff e Prelude.Unit) -> Test.Unit.Assertion e
foreign import testC :: forall e. Control.Monad.Cont.Trans.ContT Prelude.Unit (Control.Monad.Eff.Eff e) Test.Unit.TestResult -> Test.Unit.Assertion e
foreign import assertFalse :: forall e. Prim.String -> Prim.Boolean -> Test.Unit.Assertion e
foreign import assert :: forall e. Prim.String -> Prim.Boolean -> Test.Unit.Assertion e
foreign import timeout :: forall e. Prim.Int -> Test.Unit.TestUnit (ref :: Control.Monad.Eff.Ref.REF, timer :: Test.Unit.Timer | e) -> Test.Unit.TestUnit (ref :: Control.Monad.Eff.Ref.REF, timer :: Test.Unit.Timer | e)
foreign import pickFirst :: forall e. Test.Unit.TestUnit (ref :: Control.Monad.Eff.Ref.REF | e) -> Test.Unit.TestUnit (ref :: Control.Monad.Eff.Ref.REF | e) -> Test.Unit.TestUnit (ref :: Control.Monad.Eff.Ref.REF | e)
foreign import failure :: Prim.String -> Test.Unit.TestResult
foreign import success :: Test.Unit.TestResult