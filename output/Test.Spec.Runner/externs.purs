module Test.Spec.Runner (Process(), run) where
import Control.Monad.Aff ()
import Prelude ()
import Test.Spec.Console ()
import Control.Monad.Eff.Console ()
import Test.Spec.Runner ()
import Data.Foldable ()
import Control.Monad ()
import Test.Spec.Summary ()
import Test.Spec ()
import Prim ()
import Prelude ()
import Control.Monad ()
import Control.Monad.Aff ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Console ()
import Data.Foldable ()
import Test.Spec ()
import Test.Spec.Console ()
import Test.Spec.Summary ()
import Test.Spec.Reporter ()
--  Runs the tests and invoke all reporters.
--  If run in a NodeJS environment any failed test will cause the
--  process to exit with a non-zero exit code.
foreign import data Process :: !
foreign import run :: forall e r. Prim.Array (Test.Spec.Reporter.Reporter (console :: Control.Monad.Eff.Console.CONSOLE, process :: Test.Spec.Runner.Process | e)) -> Test.Spec.Spec (console :: Control.Monad.Eff.Console.CONSOLE, process :: Test.Spec.Runner.Process | e) Prelude.Unit -> Control.Monad.Eff.Eff (console :: Control.Monad.Eff.Console.CONSOLE, process :: Test.Spec.Runner.Process | e) Prelude.Unit