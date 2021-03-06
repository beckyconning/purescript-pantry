module Control.Monad.State.Trans (StateT(StateT), liftCallCCState', liftCallCCState, liftPassState, liftListenState, liftCatchState, withStateT, mapStateT, execStateT, evalStateT, runStateT) where
import Prelude ()
import Data.Tuple ()
import Control.Monad.State.Trans ()
import Control.Alt ()
import Control.Plus ()
import Control.Monad.Rec.Class ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Alternative ()
import Control.Lazy ()
import Control.Monad.Rec.Class ()
import Control.Monad.Eff.Class ()
import Control.Monad.Trans ()
import Control.MonadPlus ()
import Control.Plus ()
import Data.Tuple ()
import Data.Either ()
--  | The state monad transformer.
--  |
--  | This monad transformer extends the base monad with the operations `get`
--  | and `put` which can be used to model a single piece of mutable state.
--  |
--  | The `MonadState` type class describes the operations supported by this monad.
--  | Run a computation in the `StateT` monad.
--  | Modify the final state in a `StateT` monad action.
--  | Change the result type in a `StateT` monad action.
--  | Run a computation in the `StateT` monad discarding the result.
--  | Run a computation in the `StateT` monad, discarding the final state.
newtype StateT (s :: *) (m :: * -> *) (a :: *) = StateT (s -> m (Data.Tuple.Tuple a s))
foreign import liftCallCCState' :: forall s m a b. (((Data.Tuple.Tuple a s -> m (Data.Tuple.Tuple b s)) -> m (Data.Tuple.Tuple a s)) -> m (Data.Tuple.Tuple a s)) -> ((a -> Control.Monad.State.Trans.StateT s m b) -> Control.Monad.State.Trans.StateT s m a) -> Control.Monad.State.Trans.StateT s m a
foreign import liftCallCCState :: forall s m a b. (((Data.Tuple.Tuple a s -> m (Data.Tuple.Tuple b s)) -> m (Data.Tuple.Tuple a s)) -> m (Data.Tuple.Tuple a s)) -> ((a -> Control.Monad.State.Trans.StateT s m b) -> Control.Monad.State.Trans.StateT s m a) -> Control.Monad.State.Trans.StateT s m a
foreign import liftPassState :: forall s m a b w. (Prelude.Monad m) => (m (Data.Tuple.Tuple (Data.Tuple.Tuple a s) b) -> m (Data.Tuple.Tuple a s)) -> Control.Monad.State.Trans.StateT s m (Data.Tuple.Tuple a b) -> Control.Monad.State.Trans.StateT s m a
foreign import liftListenState :: forall s m a w. (Prelude.Monad m) => (m (Data.Tuple.Tuple a s) -> m (Data.Tuple.Tuple (Data.Tuple.Tuple a s) w)) -> Control.Monad.State.Trans.StateT s m a -> Control.Monad.State.Trans.StateT s m (Data.Tuple.Tuple a w)
foreign import liftCatchState :: forall s m e a. (m (Data.Tuple.Tuple a s) -> (e -> m (Data.Tuple.Tuple a s)) -> m (Data.Tuple.Tuple a s)) -> Control.Monad.State.Trans.StateT s m a -> (e -> Control.Monad.State.Trans.StateT s m a) -> Control.Monad.State.Trans.StateT s m a
foreign import withStateT :: forall s m a. (s -> s) -> Control.Monad.State.Trans.StateT s m a -> Control.Monad.State.Trans.StateT s m a
foreign import mapStateT :: forall s m1 m2 a b. (m1 (Data.Tuple.Tuple a s) -> m2 (Data.Tuple.Tuple b s)) -> Control.Monad.State.Trans.StateT s m1 a -> Control.Monad.State.Trans.StateT s m2 b
foreign import execStateT :: forall s m a. (Prelude.Apply m) => Control.Monad.State.Trans.StateT s m a -> s -> m s
foreign import evalStateT :: forall s m a. (Prelude.Apply m) => Control.Monad.State.Trans.StateT s m a -> s -> m a
foreign import runStateT :: forall s m a. Control.Monad.State.Trans.StateT s m a -> s -> m (Data.Tuple.Tuple a s)
foreign import instance functorStateT :: (Prelude.Monad m) => Prelude.Functor (Control.Monad.State.Trans.StateT s m)
foreign import instance applyStateT :: (Prelude.Monad m) => Prelude.Apply (Control.Monad.State.Trans.StateT s m)
foreign import instance applicativeStateT :: (Prelude.Monad m) => Prelude.Applicative (Control.Monad.State.Trans.StateT s m)
foreign import instance altStateT :: (Prelude.Monad m, Control.Alt.Alt m) => Control.Alt.Alt (Control.Monad.State.Trans.StateT s m)
foreign import instance plusStateT :: (Prelude.Monad m, Control.Plus.Plus m) => Control.Plus.Plus (Control.Monad.State.Trans.StateT s m)
foreign import instance alternativeStateT :: (Prelude.Monad m, Control.Alternative.Alternative m) => Control.Alternative.Alternative (Control.Monad.State.Trans.StateT s m)
foreign import instance bindStateT :: (Prelude.Monad m) => Prelude.Bind (Control.Monad.State.Trans.StateT s m)
foreign import instance monadStateT :: (Prelude.Monad m) => Prelude.Monad (Control.Monad.State.Trans.StateT s m)
foreign import instance monadRecStateT :: (Control.Monad.Rec.Class.MonadRec m) => Control.Monad.Rec.Class.MonadRec (Control.Monad.State.Trans.StateT s m)
foreign import instance monadPlusStateT :: (Control.MonadPlus.MonadPlus m) => Control.MonadPlus.MonadPlus (Control.Monad.State.Trans.StateT s m)
foreign import instance monadTransStateT :: Control.Monad.Trans.MonadTrans (Control.Monad.State.Trans.StateT s)
foreign import instance lazyStateT :: Control.Lazy.Lazy (Control.Monad.State.Trans.StateT s m a)
foreign import instance monadEffState :: (Prelude.Monad m, Control.Monad.Eff.Class.MonadEff eff m) => Control.Monad.Eff.Class.MonadEff eff (Control.Monad.State.Trans.StateT s m)