module Test.Spec.Console (withAttrs, reset, setAttr, writeln, write) where
import Prelude ()
import Test.Spec.Console ()
import Control.Apply ()
import Data.Foldable ()
import Prim ()
import Prelude ()
import Control.Apply ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Console ()
import Data.Foldable ()
foreign import withAttrs :: forall r. Prim.Array Prim.Int -> Control.Monad.Eff.Eff (console :: Control.Monad.Eff.Console.CONSOLE | r) Prelude.Unit -> Control.Monad.Eff.Eff (console :: Control.Monad.Eff.Console.CONSOLE | r) Prelude.Unit
foreign import reset :: forall e. Control.Monad.Eff.Eff (console :: Control.Monad.Eff.Console.CONSOLE | e) Prelude.Unit
foreign import setAttr :: forall e. Prim.Int -> Control.Monad.Eff.Eff (console :: Control.Monad.Eff.Console.CONSOLE | e) Prelude.Unit
foreign import writeln :: forall e. Prim.String -> Control.Monad.Eff.Eff (console :: Control.Monad.Eff.Console.CONSOLE | e) Prelude.Unit
foreign import write :: forall e. Prim.String -> Control.Monad.Eff.Eff (console :: Control.Monad.Eff.Console.CONSOLE | e) Prelude.Unit