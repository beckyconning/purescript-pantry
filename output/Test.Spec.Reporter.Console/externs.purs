module Test.Spec.Reporter.Console (consoleReporter) where
import Prelude ()
import Test.Spec.Reporter.Console ()
import Test.Spec.Console ()
import Test.Spec.Summary ()
import Control.Monad.Eff.Console ()
import Control.Monad.Eff.Exception ()
import Data.Foldable ()
import Data.Array ()
import Test.Spec.Reporter ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Console ()
import Control.Monad.Eff.Exception ()
import Data.Array ()
import Data.Foldable ()
import Test.Spec ()
import Test.Spec.Console ()
import Test.Spec.Reporter ()
import Test.Spec.Summary ()
foreign import consoleReporter :: forall e. Test.Spec.Reporter.Reporter (console :: Control.Monad.Eff.Console.CONSOLE | e)