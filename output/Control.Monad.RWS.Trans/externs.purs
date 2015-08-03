module Control.Monad.RWS.Trans (RWST(RWST), See(), withRWST, mapRWST, execRWST, evalRWST, runRWST, mkSee) where
import Prelude ()
import Control.Monad.RWS.Trans ()
import Data.Tuple ()
import Data.Monoid ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
import Prim ()
import Prelude ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
import Data.Monoid ()
import Data.Tuple ()
--  | The reader-writer-state monad transformer, which combines the operations
--  | of `ReaderT`, `WriterT` and `StateT` into a single monad transformer.
--  | Run a computation in the `RWST` monad.
--  | Change the context type in a `RWST` monad action.
--  | Change the result and accumulator types in a `RWST` monad action.
--  | Run a computation in the `RWST` monad, discarding the result.
--  | Run a computation in the `RWST` monad, discarding the final state.
newtype RWST (r :: *) (w :: *) (s :: *) (m :: * -> *) (a :: *) = RWST (r -> s -> m (Control.Monad.RWS.Trans.See s a w))
type See (s :: *) (a :: *) (w :: *) = { log :: w, result :: a, state :: s }
foreign import withRWST :: forall r1 r2 w s m a. (r2 -> s -> Data.Tuple.Tuple r1 s) -> Control.Monad.RWS.Trans.RWST r1 w s m a -> Control.Monad.RWS.Trans.RWST r2 w s m a
foreign import mapRWST :: forall r w1 w2 s m1 m2 a1 a2. (m1 (Control.Monad.RWS.Trans.See s a1 w1) -> m2 (Control.Monad.RWS.Trans.See s a2 w2)) -> Control.Monad.RWS.Trans.RWST r w1 s m1 a1 -> Control.Monad.RWS.Trans.RWST r w2 s m2 a2
foreign import execRWST :: forall r w s m a. (Prelude.Monad m) => Control.Monad.RWS.Trans.RWST r w s m a -> r -> s -> m (Data.Tuple.Tuple s w)
foreign import evalRWST :: forall r w s m a. (Prelude.Monad m) => Control.Monad.RWS.Trans.RWST r w s m a -> r -> s -> m (Data.Tuple.Tuple a w)
foreign import runRWST :: forall r w s m a. Control.Monad.RWS.Trans.RWST r w s m a -> r -> s -> m (Control.Monad.RWS.Trans.See s a w)
foreign import mkSee :: forall s a w. (Data.Monoid.Monoid w) => s -> a -> w -> Control.Monad.RWS.Trans.See s a w
foreign import instance functorRWST :: (Prelude.Functor m) => Prelude.Functor (Control.Monad.RWS.Trans.RWST r w s m)
foreign import instance applyRWST :: (Prelude.Bind m, Data.Monoid.Monoid w) => Prelude.Apply (Control.Monad.RWS.Trans.RWST r w s m)
foreign import instance bindRWST :: (Prelude.Bind m, Data.Monoid.Monoid w) => Prelude.Bind (Control.Monad.RWS.Trans.RWST r w s m)
foreign import instance applicativeRWST :: (Prelude.Monad m, Data.Monoid.Monoid w) => Prelude.Applicative (Control.Monad.RWS.Trans.RWST r w s m)
foreign import instance monadRWST :: (Prelude.Monad m, Data.Monoid.Monoid w) => Prelude.Monad (Control.Monad.RWS.Trans.RWST r w s m)
foreign import instance monadTransRWST :: (Data.Monoid.Monoid w) => Control.Monad.Trans.MonadTrans (Control.Monad.RWS.Trans.RWST r w s)
foreign import instance monadEffRWS :: (Prelude.Monad m, Data.Monoid.Monoid w, Control.Monad.Eff.Class.MonadEff eff m) => Control.Monad.Eff.Class.MonadEff eff (Control.Monad.RWS.Trans.RWST r w s m)