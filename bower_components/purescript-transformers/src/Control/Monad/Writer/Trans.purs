-- | This module defines the writer monad transformer, `WriterT`.

module Control.Monad.Writer.Trans where

import Prelude

import Control.Alt
import Control.Alternative
import Control.Monad.Rec.Class
import Control.Monad.Eff.Class
import Control.Monad.Trans
import Control.MonadPlus
import Control.Plus
import Data.Either (Either(..))
import Data.Monoid
import Data.Tuple

-- | The writer monad transformer.
-- |
-- | This monad transformer extends the base monad with a monoidal accumulator of
-- | type `w`.
-- |
-- | The `MonadWriter` type class describes the operations supported by this monad.
newtype WriterT w m a = WriterT (m (Tuple a w))

-- | Run a computation in the `WriterT` monad.
runWriterT :: forall w m a. WriterT w m a -> m (Tuple a w)
runWriterT (WriterT x) = x

-- | Run a computation in the `WriterT` monad, discarding the result.
execWriterT :: forall w m a. (Apply m) => WriterT w m a -> m w
execWriterT m = snd <$> runWriterT m

-- | Change the accumulator and base monad types in a `WriterT` monad action.
mapWriterT :: forall w1 w2 m1 m2 a b. (m1 (Tuple a w1) -> m2 (Tuple b w2)) -> WriterT w1 m1 a -> WriterT w2 m2 b
mapWriterT f m = WriterT $ f (runWriterT m)

instance functorWriterT :: (Functor m) => Functor (WriterT w m) where
  map f = mapWriterT $ (<$>) \(Tuple a w) -> Tuple (f a) w

instance applyWriterT :: (Monoid w, Apply m) => Apply (WriterT w m) where
  apply f v = WriterT $
    let k (Tuple a w) (Tuple b w') = Tuple (a b) (w <> w')
    in k <$> (runWriterT f) <*> (runWriterT v)

instance applicativeWriterT :: (Monoid w, Applicative m) => Applicative (WriterT w m) where
  pure a = WriterT $ pure $ Tuple a mempty

instance altWriterT :: (Monoid w, Alt m) => Alt (WriterT w m) where
  alt m n = WriterT $ runWriterT m <|> runWriterT n

instance plusWriterT :: (Monoid w, Plus m) => Plus (WriterT w m) where
  empty = WriterT empty

instance alternativeWriterT :: (Monoid w, Alternative m) => Alternative (WriterT w m)

instance bindWriterT :: (Monoid w, Monad m) => Bind (WriterT w m) where
  bind m k  = WriterT $ do
    Tuple a w <- runWriterT m
    Tuple b w' <- runWriterT (k a)
    return $ Tuple b (w <> w')

instance monadWriterT :: (Monoid w, Monad m) => Monad (WriterT w m)

instance monadRecWriterT :: (Monoid w, MonadRec m) => MonadRec (WriterT w m) where
  tailRecM f a = WriterT $ tailRecM f' (Tuple a mempty)
    where
    f' (Tuple a w) = do
      Tuple m w1 <- runWriterT (f a)
      return case m of
        Left a -> Left (Tuple a (w <> w1))
        Right b -> Right (Tuple b (w <> w1))

instance monadPlusWriterT :: (Monoid w, MonadPlus m) => MonadPlus (WriterT w m)

instance monadTransWriterT :: (Monoid w) => MonadTrans (WriterT w) where
  lift m = WriterT $ do
    a <- m
    return $ Tuple a mempty

instance monadEffWriter :: (Monad m, Monoid w, MonadEff eff m) => MonadEff eff (WriterT w m) where
  liftEff = lift <<< liftEff

liftCatchWriter :: forall w m e a. (m (Tuple a w) -> (e -> m (Tuple a w)) -> m (Tuple a w)) -> WriterT w m a -> (e -> WriterT w m a) -> WriterT w m a
liftCatchWriter catch m h = WriterT $ catch (runWriterT m) (\e -> runWriterT (h e))

liftCallCCWriter :: forall w m a b. (Monoid w) => ((((Tuple a w) -> m (Tuple b w)) -> m (Tuple a w)) -> m (Tuple a w)) -> ((a -> WriterT w m b) -> WriterT w m a) -> WriterT w m a
liftCallCCWriter callCC f = WriterT $ callCC $ \c -> runWriterT (f (\a -> WriterT $ c (Tuple a mempty)))
