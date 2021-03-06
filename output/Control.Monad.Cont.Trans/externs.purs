module Control.Monad.Cont.Trans (ContT(ContT), callCC, withContT, mapContT, runContT) where
import Prelude ()
import Control.Monad.Cont.Trans ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
import Prim ()
import Prelude ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
--  | The CPS monad transformer.
--  |
--  | This monad transformer extends the base monad with the operation `callCC`.
--  | Run a computation in the `ContT` monad, by providing a continuation.
--  | Modify the continuation in a `ContT` monad action
--  | Modify the underlying action in a `ContT` monad action.
--  | `callCC`, or _call-with-current-continuation_.
--  |
--  | This action makes the current continuation available to the caller.
--  |
--  | For example:
--  |
--  | ```purescript
--  | delay :: forall eff. Number -> ContT Unit (Eff (timeout :: Timeout | eff)) Unit
--  | delay n = callCC \cont ->
--  |   lift $ setTimeout n (runContT (cont unit) (\_ -> return unit))
--  | ```
newtype ContT (r :: *) (m :: * -> *) (a :: *) = ContT ((a -> m r) -> m r)
foreign import callCC :: forall r m a b. ((a -> Control.Monad.Cont.Trans.ContT r m b) -> Control.Monad.Cont.Trans.ContT r m a) -> Control.Monad.Cont.Trans.ContT r m a
foreign import withContT :: forall r m a b. ((b -> m r) -> a -> m r) -> Control.Monad.Cont.Trans.ContT r m a -> Control.Monad.Cont.Trans.ContT r m b
foreign import mapContT :: forall r m a. (m r -> m r) -> Control.Monad.Cont.Trans.ContT r m a -> Control.Monad.Cont.Trans.ContT r m a
foreign import runContT :: forall r m a. Control.Monad.Cont.Trans.ContT r m a -> (a -> m r) -> m r
foreign import instance functorContT :: (Prelude.Monad m) => Prelude.Functor (Control.Monad.Cont.Trans.ContT r m)
foreign import instance applyContT :: (Prelude.Functor m, Prelude.Monad m) => Prelude.Apply (Control.Monad.Cont.Trans.ContT r m)
foreign import instance applicativeContT :: (Prelude.Functor m, Prelude.Monad m) => Prelude.Applicative (Control.Monad.Cont.Trans.ContT r m)
foreign import instance bindContT :: (Prelude.Monad m) => Prelude.Bind (Control.Monad.Cont.Trans.ContT r m)
foreign import instance monadContT :: (Prelude.Monad m) => Prelude.Monad (Control.Monad.Cont.Trans.ContT r m)
foreign import instance monadTransContT :: Control.Monad.Trans.MonadTrans (Control.Monad.Cont.Trans.ContT r)
foreign import instance monadEffContT :: (Prelude.Monad m, Control.Monad.Eff.Class.MonadEff eff m) => Control.Monad.Eff.Class.MonadEff eff (Control.Monad.Cont.Trans.ContT r m)