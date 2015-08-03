module Control.Monad.Writer.Trans (WriterT(WriterT), liftCallCCWriter, liftCatchWriter, mapWriterT, execWriterT, runWriterT) where
import Prelude ()
import Data.Tuple ()
import Control.Monad.Writer.Trans ()
import Data.Monoid ()
import Control.Alt ()
import Control.Plus ()
import Control.Monad.Rec.Class ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Alternative ()
import Control.Monad.Rec.Class ()
import Control.Monad.Eff.Class ()
import Control.Monad.Trans ()
import Control.MonadPlus ()
import Control.Plus ()
import Data.Either ()
import Data.Monoid ()
import Data.Tuple ()
--  | The writer monad transformer.
--  |
--  | This monad transformer extends the base monad with a monoidal accumulator of
--  | type `w`.
--  |
--  | The `MonadWriter` type class describes the operations supported by this monad.
--  | Run a computation in the `WriterT` monad.
--  | Change the accumulator and base monad types in a `WriterT` monad action.
--  | Run a computation in the `WriterT` monad, discarding the result.
newtype WriterT (w :: *) (m :: * -> *) (a :: *) = WriterT (m (Data.Tuple.Tuple a w))
foreign import liftCallCCWriter :: forall w m a b. (Data.Monoid.Monoid w) => (((Data.Tuple.Tuple a w -> m (Data.Tuple.Tuple b w)) -> m (Data.Tuple.Tuple a w)) -> m (Data.Tuple.Tuple a w)) -> ((a -> Control.Monad.Writer.Trans.WriterT w m b) -> Control.Monad.Writer.Trans.WriterT w m a) -> Control.Monad.Writer.Trans.WriterT w m a
foreign import liftCatchWriter :: forall w m e a. (m (Data.Tuple.Tuple a w) -> (e -> m (Data.Tuple.Tuple a w)) -> m (Data.Tuple.Tuple a w)) -> Control.Monad.Writer.Trans.WriterT w m a -> (e -> Control.Monad.Writer.Trans.WriterT w m a) -> Control.Monad.Writer.Trans.WriterT w m a
foreign import mapWriterT :: forall w1 w2 m1 m2 a b. (m1 (Data.Tuple.Tuple a w1) -> m2 (Data.Tuple.Tuple b w2)) -> Control.Monad.Writer.Trans.WriterT w1 m1 a -> Control.Monad.Writer.Trans.WriterT w2 m2 b
foreign import execWriterT :: forall w m a. (Prelude.Apply m) => Control.Monad.Writer.Trans.WriterT w m a -> m w
foreign import runWriterT :: forall w m a. Control.Monad.Writer.Trans.WriterT w m a -> m (Data.Tuple.Tuple a w)
foreign import instance functorWriterT :: (Prelude.Functor m) => Prelude.Functor (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance applyWriterT :: (Data.Monoid.Monoid w, Prelude.Apply m) => Prelude.Apply (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance applicativeWriterT :: (Data.Monoid.Monoid w, Prelude.Applicative m) => Prelude.Applicative (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance altWriterT :: (Data.Monoid.Monoid w, Control.Alt.Alt m) => Control.Alt.Alt (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance plusWriterT :: (Data.Monoid.Monoid w, Control.Plus.Plus m) => Control.Plus.Plus (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance alternativeWriterT :: (Data.Monoid.Monoid w, Control.Alternative.Alternative m) => Control.Alternative.Alternative (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance bindWriterT :: (Data.Monoid.Monoid w, Prelude.Monad m) => Prelude.Bind (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance monadWriterT :: (Data.Monoid.Monoid w, Prelude.Monad m) => Prelude.Monad (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance monadRecWriterT :: (Data.Monoid.Monoid w, Control.Monad.Rec.Class.MonadRec m) => Control.Monad.Rec.Class.MonadRec (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance monadPlusWriterT :: (Data.Monoid.Monoid w, Control.MonadPlus.MonadPlus m) => Control.MonadPlus.MonadPlus (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance monadTransWriterT :: (Data.Monoid.Monoid w) => Control.Monad.Trans.MonadTrans (Control.Monad.Writer.Trans.WriterT w)
foreign import instance monadEffWriter :: (Prelude.Monad m, Data.Monoid.Monoid w, Control.Monad.Eff.Class.MonadEff eff m) => Control.Monad.Eff.Class.MonadEff eff (Control.Monad.Writer.Trans.WriterT w m)