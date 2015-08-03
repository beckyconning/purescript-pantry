module Control.Monad (unless, when) where
import Prelude ()
import Prim ()
import Prelude ()
--  | Perform a monadic action when a condition is true.
--  | Perform a monadic action unless a condition is true.
foreign import unless :: forall m. (Prelude.Monad m) => Prim.Boolean -> m Prelude.Unit -> m Prelude.Unit
foreign import when :: forall m. (Prelude.Monad m) => Prim.Boolean -> m Prelude.Unit -> m Prelude.Unit