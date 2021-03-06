module Control.Monad.Error.Trans (ErrorT(ErrorT), liftCallCCError, liftPassError, liftListenError, mapErrorT, runErrorT) where
import Prelude ()
import Control.Monad.Error.Trans ()
import Control.Apply ()
import Control.Monad.Error ()
import Control.Monad.Rec.Class ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Alternative ()
import Control.Apply ()
import Control.Monad.Error ()
import Control.Monad.Rec.Class ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
import Control.MonadPlus ()
import Control.Plus ()
import Data.Either ()
import Data.Monoid ()
import Data.Tuple ()
--  | The error monad transformer
--  |
--  | This monad transformer extends the base monad with the ability to throw and handle
--  | errors.
--  |
--  | The `MonadError` type class describes the operations supported by this monad.
--  | Run a computation in the `ErrorT` monad.
--  | Change the error and result types in an `ErrorT` monad action.
newtype ErrorT (e :: *) (m :: * -> *) (a :: *) = ErrorT (m (Data.Either.Either e a))
foreign import liftCallCCError :: forall e m a b. (((Data.Either.Either e a -> m (Data.Either.Either e b)) -> m (Data.Either.Either e a)) -> m (Data.Either.Either e a)) -> ((a -> Control.Monad.Error.Trans.ErrorT e m b) -> Control.Monad.Error.Trans.ErrorT e m a) -> Control.Monad.Error.Trans.ErrorT e m a
foreign import liftPassError :: forall e m a w. (Prelude.Monad m) => (m (Data.Tuple.Tuple (Data.Either.Either e a) (w -> w)) -> m (Data.Either.Either e a)) -> Control.Monad.Error.Trans.ErrorT e m (Data.Tuple.Tuple a (w -> w)) -> Control.Monad.Error.Trans.ErrorT e m a
foreign import liftListenError :: forall e m a w. (Prelude.Monad m) => (m (Data.Either.Either e a) -> m (Data.Tuple.Tuple (Data.Either.Either e a) w)) -> Control.Monad.Error.Trans.ErrorT e m a -> Control.Monad.Error.Trans.ErrorT e m (Data.Tuple.Tuple a w)
foreign import mapErrorT :: forall e1 e2 m1 m2 a b. (m1 (Data.Either.Either e1 a) -> m2 (Data.Either.Either e2 b)) -> Control.Monad.Error.Trans.ErrorT e1 m1 a -> Control.Monad.Error.Trans.ErrorT e2 m2 b
foreign import runErrorT :: forall e m a. Control.Monad.Error.Trans.ErrorT e m a -> m (Data.Either.Either e a)
foreign import instance functorErrorT :: (Prelude.Functor m) => Prelude.Functor (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance applyErrorT :: (Prelude.Apply m) => Prelude.Apply (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance applicativeErrorT :: (Prelude.Applicative m) => Prelude.Applicative (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance altErrorT :: (Prelude.Monad m) => Control.Alt.Alt (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance plusErrorT :: (Prelude.Monad m, Control.Monad.Error.Error e) => Control.Plus.Plus (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance alternativeErrorT :: (Prelude.Monad m, Control.Monad.Error.Error e) => Control.Alternative.Alternative (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance bindErrorT :: (Prelude.Monad m) => Prelude.Bind (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance monadErrorT :: (Prelude.Monad m) => Prelude.Monad (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance monadRecErrorT :: (Control.Monad.Error.Error e, Control.Monad.Rec.Class.MonadRec m) => Control.Monad.Rec.Class.MonadRec (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance monadPlusErrorT :: (Prelude.Monad m, Control.Monad.Error.Error e) => Control.MonadPlus.MonadPlus (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance monadTransErrorT :: Control.Monad.Trans.MonadTrans (Control.Monad.Error.Trans.ErrorT e)
foreign import instance monadEffError :: (Prelude.Monad m, Control.Monad.Eff.Class.MonadEff eff m) => Control.Monad.Eff.Class.MonadEff eff (Control.Monad.Error.Trans.ErrorT e m)