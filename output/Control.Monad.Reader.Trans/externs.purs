module Control.Monad.Reader.Trans (ReaderT(ReaderT), liftCallCCReader, liftCatchReader, liftReaderT, mapReaderT, withReaderT, runReaderT) where
import Prelude ()
import Control.Monad.Reader.Trans ()
import Control.Alt ()
import Control.Plus ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
import Data.Distributive ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Alternative ()
import Control.Monad.Eff.Class ()
import Control.Monad.Trans ()
import Control.MonadPlus ()
import Control.Plus ()
import Data.Distributive ()
--  | The reader monad transformer.
--  |
--  | This monad transformer extends the base monad transformer with a _global context_ of
--  | type `r`.
--  |
--  | The `MonadReader` type class describes the operations supported by this monad.
--  | Run a computation in the `ReaderT` monad.
--  | Change the type of the context in a `ReaderT` monad action.
--  | Change the type of the result in a `ReaderT` monad action.
newtype ReaderT (r :: *) (m :: * -> *) (a :: *) = ReaderT (r -> m a)
foreign import liftCallCCReader :: forall r m a b. (((a -> m b) -> m a) -> m a) -> ((a -> Control.Monad.Reader.Trans.ReaderT r m b) -> Control.Monad.Reader.Trans.ReaderT r m a) -> Control.Monad.Reader.Trans.ReaderT r m a
foreign import liftCatchReader :: forall r m e a. (m a -> (e -> m a) -> m a) -> Control.Monad.Reader.Trans.ReaderT r m a -> (e -> Control.Monad.Reader.Trans.ReaderT r m a) -> Control.Monad.Reader.Trans.ReaderT r m a
foreign import liftReaderT :: forall r m a. m a -> Control.Monad.Reader.Trans.ReaderT r m a
foreign import mapReaderT :: forall r m1 m2 a b. (m1 a -> m2 b) -> Control.Monad.Reader.Trans.ReaderT r m1 a -> Control.Monad.Reader.Trans.ReaderT r m2 b
foreign import withReaderT :: forall r1 r2 m a b. (r2 -> r1) -> Control.Monad.Reader.Trans.ReaderT r1 m a -> Control.Monad.Reader.Trans.ReaderT r2 m a
foreign import runReaderT :: forall r m a. Control.Monad.Reader.Trans.ReaderT r m a -> r -> m a
foreign import instance functorReaderT :: (Prelude.Functor m) => Prelude.Functor (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance applyReaderT :: (Prelude.Applicative m) => Prelude.Apply (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance applicativeReaderT :: (Prelude.Applicative m) => Prelude.Applicative (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance altReaderT :: (Control.Alt.Alt m) => Control.Alt.Alt (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance plusReaderT :: (Control.Plus.Plus m) => Control.Plus.Plus (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance alternativeReaderT :: (Control.Alternative.Alternative m) => Control.Alternative.Alternative (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance bindReaderT :: (Prelude.Monad m) => Prelude.Bind (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance monadReaderT :: (Prelude.Monad m) => Prelude.Monad (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance monadPlusReaderT :: (Control.MonadPlus.MonadPlus m) => Control.MonadPlus.MonadPlus (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance monadTransReaderT :: Control.Monad.Trans.MonadTrans (Control.Monad.Reader.Trans.ReaderT r)
foreign import instance monadEffReader :: (Prelude.Monad m, Control.Monad.Eff.Class.MonadEff eff m) => Control.Monad.Eff.Class.MonadEff eff (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance distributiveReaderT :: (Data.Distributive.Distributive g) => Data.Distributive.Distributive (Control.Monad.Reader.Trans.ReaderT e g)