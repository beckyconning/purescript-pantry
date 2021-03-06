module Control.Monad.Reader.Class (MonadReader, reader, local, ask) where
import Prelude ()
import Control.Monad.Reader.Class ()
import Control.Monad.Reader.Trans ()
import Control.Monad.Trans ()
import Control.Monad.Error.Trans ()
import Control.Monad.Maybe.Trans ()
import Control.Monad.Writer.Trans ()
import Control.Monad.State.Trans ()
import Control.Monad.RWS ()
import Prim ()
import Prelude ()
import Control.Monad.Trans ()
import Control.Monad.Reader.Trans ()
import Control.Monad.Error ()
import Control.Monad.Error.Trans ()
import Control.Monad.Maybe.Trans ()
import Control.Monad.RWS.Trans ()
import Control.Monad.State.Trans ()
import Control.Monad.Writer.Trans ()
import Data.Monoid ()
import Control.Monad.RWS ()
--  | The `MonadReader` type class represents those monads which support a global context via
--  | `ask` and `local`.
--  |
--  | - `ask` reads the current context.
--  | - `local f x` changes the value of the local context during the execution of the action `x`.
--  |
--  | An implementation is provided for `ReaderT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - `do { ask ; ask } = ask`
--  | - `local f ask = f <$> ask`
--  | - `local _ (pure a) = pure a`
--  | - `local f (do { a <- x ; y }) = do { a <- local f x ; local f y }` 
--  | The `MonadReader` type class represents those monads which support a global context via
--  | `ask` and `local`.
--  |
--  | - `ask` reads the current context.
--  | - `local f x` changes the value of the local context during the execution of the action `x`.
--  |
--  | An implementation is provided for `ReaderT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - `do { ask ; ask } = ask`
--  | - `local f ask = f <$> ask`
--  | - `local _ (pure a) = pure a`
--  | - `local f (do { a <- x ; y }) = do { a <- local f x ; local f y }` 
--  | The `MonadReader` type class represents those monads which support a global context via
--  | `ask` and `local`.
--  |
--  | - `ask` reads the current context.
--  | - `local f x` changes the value of the local context during the execution of the action `x`.
--  |
--  | An implementation is provided for `ReaderT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - `do { ask ; ask } = ask`
--  | - `local f ask = f <$> ask`
--  | - `local _ (pure a) = pure a`
--  | - `local f (do { a <- x ; y }) = do { a <- local f x ; local f y }` 
--  | The `MonadReader` type class represents those monads which support a global context via
--  | `ask` and `local`.
--  |
--  | - `ask` reads the current context.
--  | - `local f x` changes the value of the local context during the execution of the action `x`.
--  |
--  | An implementation is provided for `ReaderT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - `do { ask ; ask } = ask`
--  | - `local f ask = f <$> ask`
--  | - `local _ (pure a) = pure a`
--  | - `local f (do { a <- x ; y }) = do { a <- local f x ; local f y }` 
--  | Read a value which depends on the global context in any `MonadReader`.
class MonadReader r m where
  ask :: m r
  local :: forall a. (r -> r) -> m a -> m a
foreign import reader :: forall r m a. (Prelude.Monad m, Control.Monad.Reader.Class.MonadReader r m) => (r -> a) -> m a
foreign import instance monadReaderFun :: Control.Monad.Reader.Class.MonadReader r (Prim.Function r)
foreign import instance monadReaderReaderT :: (Prelude.Monad m) => Control.Monad.Reader.Class.MonadReader r (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance monadReaderErrorT :: (Prelude.Monad m, Control.Monad.Reader.Class.MonadReader r m) => Control.Monad.Reader.Class.MonadReader r (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance monadReaderMaybeT :: (Prelude.Monad m, Control.Monad.Reader.Class.MonadReader r m) => Control.Monad.Reader.Class.MonadReader r (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance monadReaderWriterT :: (Prelude.Monad m, Data.Monoid.Monoid w, Control.Monad.Reader.Class.MonadReader r m) => Control.Monad.Reader.Class.MonadReader r (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance monadReaderStateT :: (Prelude.Monad m, Control.Monad.Reader.Class.MonadReader r m) => Control.Monad.Reader.Class.MonadReader r (Control.Monad.State.Trans.StateT s m)
foreign import instance monadReaderRWST :: (Prelude.Monad m, Data.Monoid.Monoid w) => Control.Monad.Reader.Class.MonadReader r (Control.Monad.RWS.Trans.RWST r w s m)