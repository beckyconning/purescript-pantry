module Control.Monad.Maybe.Trans (MaybeT(MaybeT), liftCallCCMaybe, liftPassMaybe, liftListenMaybe, liftCatchMaybe, mapMaybeT, runMaybeT) where
import Prelude ()
import Control.Monad.Maybe.Trans ()
import Control.Monad.Rec.Class ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Alternative ()
import Control.Monad ()
import Control.Monad.Rec.Class ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
import Control.MonadPlus ()
import Control.Plus ()
import Data.Either ()
import Data.Maybe ()
import Data.Tuple ()
--  | The `MaybeT` monad transformer.
--  |
--  | This monad transformer extends the base monad, supporting failure and alternation via
--  | the `MonadPlus` type class.
--  | Run a computation in the `MaybeT` monad.
--  | Change the result type of a `MaybeT` monad action.
newtype MaybeT (m :: * -> *) (a :: *) = MaybeT (m (Data.Maybe.Maybe a))
foreign import liftCallCCMaybe :: forall m a b. (((Data.Maybe.Maybe a -> m (Data.Maybe.Maybe b)) -> m (Data.Maybe.Maybe a)) -> m (Data.Maybe.Maybe a)) -> ((a -> Control.Monad.Maybe.Trans.MaybeT m b) -> Control.Monad.Maybe.Trans.MaybeT m a) -> Control.Monad.Maybe.Trans.MaybeT m a
foreign import liftPassMaybe :: forall m a w. (Prelude.Monad m) => (m (Data.Tuple.Tuple (Data.Maybe.Maybe a) (w -> w)) -> m (Data.Maybe.Maybe a)) -> Control.Monad.Maybe.Trans.MaybeT m (Data.Tuple.Tuple a (w -> w)) -> Control.Monad.Maybe.Trans.MaybeT m a
foreign import liftListenMaybe :: forall m a w. (Prelude.Monad m) => (m (Data.Maybe.Maybe a) -> m (Data.Tuple.Tuple (Data.Maybe.Maybe a) w)) -> Control.Monad.Maybe.Trans.MaybeT m a -> Control.Monad.Maybe.Trans.MaybeT m (Data.Tuple.Tuple a w)
foreign import liftCatchMaybe :: forall m e a. (m (Data.Maybe.Maybe a) -> (e -> m (Data.Maybe.Maybe a)) -> m (Data.Maybe.Maybe a)) -> Control.Monad.Maybe.Trans.MaybeT m a -> (e -> Control.Monad.Maybe.Trans.MaybeT m a) -> Control.Monad.Maybe.Trans.MaybeT m a
foreign import mapMaybeT :: forall m1 m2 a b. (m1 (Data.Maybe.Maybe a) -> m2 (Data.Maybe.Maybe b)) -> Control.Monad.Maybe.Trans.MaybeT m1 a -> Control.Monad.Maybe.Trans.MaybeT m2 b
foreign import runMaybeT :: forall m a. Control.Monad.Maybe.Trans.MaybeT m a -> m (Data.Maybe.Maybe a)
foreign import instance functorMaybeT :: (Prelude.Monad m) => Prelude.Functor (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance applyMaybeT :: (Prelude.Monad m) => Prelude.Apply (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance applicativeMaybeT :: (Prelude.Monad m) => Prelude.Applicative (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance bindMaybeT :: (Prelude.Monad m) => Prelude.Bind (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance monadMaybeT :: (Prelude.Monad m) => Prelude.Monad (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance monadTransMaybeT :: Control.Monad.Trans.MonadTrans Control.Monad.Maybe.Trans.MaybeT
foreign import instance altMaybeT :: (Prelude.Monad m) => Control.Alt.Alt (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance plusMaybeT :: (Prelude.Monad m) => Control.Plus.Plus (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance alternativeMaybeT :: (Prelude.Monad m) => Control.Alternative.Alternative (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance monadPlusMaybeT :: (Prelude.Monad m) => Control.MonadPlus.MonadPlus (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance monadRecMaybeT :: (Control.Monad.Rec.Class.MonadRec m) => Control.Monad.Rec.Class.MonadRec (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance monadEffMaybe :: (Prelude.Monad m, Control.Monad.Eff.Class.MonadEff eff m) => Control.Monad.Eff.Class.MonadEff eff (Control.Monad.Maybe.Trans.MaybeT m)