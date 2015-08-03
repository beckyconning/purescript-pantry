module Control.Monad.Eff.Ref.Unsafe (unsafeRunRef) where
import Control.Monad.Eff.Unsafe ()
import Prim ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Ref ()
import Control.Monad.Eff.Unsafe ()
--  | This handler function unsafely removes the `Ref` effect from an
--  | effectful action.
--  |
--  | This function might be used when it is impossible to prove to the
--  | typechecker that a particular mutable reference does not escape
--  | its scope.
foreign import unsafeRunRef :: forall eff a. Control.Monad.Eff.Eff (ref :: Control.Monad.Eff.Ref.REF | eff) a -> Control.Monad.Eff.Eff eff a