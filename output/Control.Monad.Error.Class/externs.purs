module Control.Monad.Error.Class (MonadError, catchJust, catchError, throwError) where
import Control.Monad.Error.Class ()
import Prelude ()
import Control.Monad.Error.Trans ()
import Control.Monad.Except.Trans ()
import Control.Monad.Trans ()
import Control.Monad.Maybe.Trans ()
import Control.Monad.Reader.Trans ()
import Control.Monad.Writer.Trans ()
import Control.Monad.State.Trans ()
import Prim ()
import Prelude ()
import Control.Monad.Trans ()
import Control.Monad.Error ()
import Control.Monad.Error.Trans ()
import Control.Monad.Except.Trans ()
import Control.Monad.Maybe.Trans ()
import Control.Monad.Reader.Trans ()
import Control.Monad.Writer.Trans ()
import Control.Monad.State.Trans ()
import Data.Either ()
import Data.Maybe ()
import Data.Monoid ()
--  | The `MonadError` type class represents those monads which support errors via
--  | `throwError` and `catchError`.
--  |
--  | - `throwError e` throws the error `e`
--  | - `catchError x f` calls the error handler `f` if an error is thrown during the
--  |   evaluation of `x`.
--  |
--  | An implementation is provided for `ErrorT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - Left zero: `throwError e >>= f = throwError e`
--  | - Catch: `catchError (throwError e) f = f e`
--  | - Pure: `catchError (pure a) f = pure a`
--  | 
--  | The `MonadError` type class represents those monads which support errors via
--  | `throwError` and `catchError`.
--  |
--  | - `throwError e` throws the error `e`
--  | - `catchError x f` calls the error handler `f` if an error is thrown during the
--  |   evaluation of `x`.
--  |
--  | An implementation is provided for `ErrorT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - Left zero: `throwError e >>= f = throwError e`
--  | - Catch: `catchError (throwError e) f = f e`
--  | - Pure: `catchError (pure a) f = pure a`
--  | 
--  | The `MonadError` type class represents those monads which support errors via
--  | `throwError` and `catchError`.
--  |
--  | - `throwError e` throws the error `e`
--  | - `catchError x f` calls the error handler `f` if an error is thrown during the
--  |   evaluation of `x`.
--  |
--  | An implementation is provided for `ErrorT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - Left zero: `throwError e >>= f = throwError e`
--  | - Catch: `catchError (throwError e) f = f e`
--  | - Pure: `catchError (pure a) f = pure a`
--  | 
--  | The `MonadError` type class represents those monads which support errors via
--  | `throwError` and `catchError`.
--  |
--  | - `throwError e` throws the error `e`
--  | - `catchError x f` calls the error handler `f` if an error is thrown during the
--  |   evaluation of `x`.
--  |
--  | An implementation is provided for `ErrorT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - Left zero: `throwError e >>= f = throwError e`
--  | - Catch: `catchError (throwError e) f = f e`
--  | - Pure: `catchError (pure a) f = pure a`
--  | 
--  | This function allows you to provide a predicate for selecting the
--  | exceptions that you're interested in, and handle only those exceptons.
--  | If the inner computation throws an exception, and the predicate returns
--  | Nothing, then the whole computation will still fail with that exception.
class MonadError e m where
  throwError :: forall a. e -> m a
  catchError :: forall a. m a -> (e -> m a) -> m a
foreign import catchJust :: forall e m a b. (Control.Monad.Error.Class.MonadError e m) => (e -> Data.Maybe.Maybe b) -> m a -> (b -> m a) -> m a
foreign import instance monadErrorEither :: Control.Monad.Error.Class.MonadError e (Data.Either.Either e)
foreign import instance monadErrorMaybe :: Control.Monad.Error.Class.MonadError Prelude.Unit Data.Maybe.Maybe
foreign import instance monadErrorErrorT :: (Prelude.Monad m) => Control.Monad.Error.Class.MonadError e (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance monadErrorExceptT :: (Prelude.Monad m) => Control.Monad.Error.Class.MonadError e (Control.Monad.Except.Trans.ExceptT e m)
foreign import instance monadErrorMaybeT :: (Prelude.Monad m, Control.Monad.Error.Class.MonadError e m) => Control.Monad.Error.Class.MonadError e (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance monadErrorReaderT :: (Prelude.Monad m, Control.Monad.Error.Class.MonadError e m) => Control.Monad.Error.Class.MonadError e (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance monadErrorWriterT :: (Prelude.Monad m, Data.Monoid.Monoid w, Control.Monad.Error.Class.MonadError e m) => Control.Monad.Error.Class.MonadError e (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance monadErrorStateT :: (Prelude.Monad m, Control.Monad.Error.Class.MonadError e m) => Control.Monad.Error.Class.MonadError e (Control.Monad.State.Trans.StateT s m)