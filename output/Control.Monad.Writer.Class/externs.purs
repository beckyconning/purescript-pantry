module Control.Monad.Writer.Class (MonadWriter, censor, listens, tell, pass, listen, writer) where
import Prelude ()
import Control.Monad.Writer.Class ()
import Control.Monad.Writer.Trans ()
import Control.Monad.Trans ()
import Control.Monad.Error.Trans ()
import Control.Monad.Maybe.Trans ()
import Control.Monad.State.Trans ()
import Control.Monad.Reader.Trans ()
import Control.Monad.RWS ()
import Prim ()
import Prelude ()
import Control.Monad.Trans ()
import Control.Monad.Writer.Trans ()
import Control.Monad.Error ()
import Control.Monad.Error.Trans ()
import Control.Monad.Maybe.Trans ()
import Control.Monad.Reader.Trans ()
import Control.Monad.RWS.Trans ()
import Control.Monad.State.Trans ()
import Data.Monoid ()
import Data.Tuple ()
import Control.Monad.RWS ()
--  | The `MonadWriter w` type class represents those monads which support a monoidal accumulator
--  | of type `w`.
--  |
--  | - `writer` appends a value to the accumulator.
--  | - `listen` modifies the result to include the changes to the accumulator.
--  | - `pass` applies the returned function to the accumulator.
--  |
--  | An implementation is provided for `WriterT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - `writer a mempty = pure a`
--  | - `do { tell x ; tell y } = tell (x <> y)`
--  | - `listen (pure a) = pure (Tuple a mempty)`
--  | - `listen (writer a x) = tell x $> Tuple a x`
--  |
--  | The `MonadWriter w` type class represents those monads which support a monoidal accumulator
--  | of type `w`.
--  |
--  | - `writer` appends a value to the accumulator.
--  | - `listen` modifies the result to include the changes to the accumulator.
--  | - `pass` applies the returned function to the accumulator.
--  |
--  | An implementation is provided for `WriterT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - `writer a mempty = pure a`
--  | - `do { tell x ; tell y } = tell (x <> y)`
--  | - `listen (pure a) = pure (Tuple a mempty)`
--  | - `listen (writer a x) = tell x $> Tuple a x`
--  |
--  | The `MonadWriter w` type class represents those monads which support a monoidal accumulator
--  | of type `w`.
--  |
--  | - `writer` appends a value to the accumulator.
--  | - `listen` modifies the result to include the changes to the accumulator.
--  | - `pass` applies the returned function to the accumulator.
--  |
--  | An implementation is provided for `WriterT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - `writer a mempty = pure a`
--  | - `do { tell x ; tell y } = tell (x <> y)`
--  | - `listen (pure a) = pure (Tuple a mempty)`
--  | - `listen (writer a x) = tell x $> Tuple a x`
--  |
--  | Append a value to the accumulator.
--  | The `MonadWriter w` type class represents those monads which support a monoidal accumulator
--  | of type `w`.
--  |
--  | - `writer` appends a value to the accumulator.
--  | - `listen` modifies the result to include the changes to the accumulator.
--  | - `pass` applies the returned function to the accumulator.
--  |
--  | An implementation is provided for `WriterT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - `writer a mempty = pure a`
--  | - `do { tell x ; tell y } = tell (x <> y)`
--  | - `listen (pure a) = pure (Tuple a mempty)`
--  | - `listen (writer a x) = tell x $> Tuple a x`
--  |
--  | The `MonadWriter w` type class represents those monads which support a monoidal accumulator
--  | of type `w`.
--  |
--  | - `writer` appends a value to the accumulator.
--  | - `listen` modifies the result to include the changes to the accumulator.
--  | - `pass` applies the returned function to the accumulator.
--  |
--  | An implementation is provided for `WriterT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - `writer a mempty = pure a`
--  | - `do { tell x ; tell y } = tell (x <> y)`
--  | - `listen (pure a) = pure (Tuple a mempty)`
--  | - `listen (writer a x) = tell x $> Tuple a x`
--  |
--  | Read a value which depends on the modifications made to the accumulator during an action.
--  | Modify the final accumulator value by applying a function.
class MonadWriter w m where
  writer :: forall a. Data.Tuple.Tuple a w -> m a
  listen :: forall a. m a -> m (Data.Tuple.Tuple a w)
  pass :: forall a. m (Data.Tuple.Tuple a (w -> w)) -> m a
foreign import censor :: forall w m a. (Data.Monoid.Monoid w, Prelude.Monad m, Control.Monad.Writer.Class.MonadWriter w m) => (w -> w) -> m a -> m a
foreign import listens :: forall w m a b. (Data.Monoid.Monoid w, Prelude.Monad m, Control.Monad.Writer.Class.MonadWriter w m) => (w -> b) -> m a -> m (Data.Tuple.Tuple a b)
foreign import tell :: forall w m a. (Data.Monoid.Monoid w, Prelude.Monad m, Control.Monad.Writer.Class.MonadWriter w m) => w -> m Prelude.Unit
foreign import instance monadWriterWriterT :: (Data.Monoid.Monoid w, Prelude.Monad m) => Control.Monad.Writer.Class.MonadWriter w (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance monadWriterErrorT :: (Prelude.Monad m, Control.Monad.Writer.Class.MonadWriter w m) => Control.Monad.Writer.Class.MonadWriter w (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance monadWriterMaybeT :: (Prelude.Monad m, Control.Monad.Writer.Class.MonadWriter w m) => Control.Monad.Writer.Class.MonadWriter w (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance monadWriterStateT :: (Prelude.Monad m, Control.Monad.Writer.Class.MonadWriter w m) => Control.Monad.Writer.Class.MonadWriter w (Control.Monad.State.Trans.StateT s m)
foreign import instance monadWriterReaderT :: (Prelude.Monad m, Control.Monad.Writer.Class.MonadWriter w m) => Control.Monad.Writer.Class.MonadWriter w (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance monadWriterRWST :: (Prelude.Monad m, Data.Monoid.Monoid w) => Control.Monad.Writer.Class.MonadWriter w (Control.Monad.RWS.Trans.RWST r w s m)