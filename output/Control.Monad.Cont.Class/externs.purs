module Control.Monad.Cont.Class (MonadCont, callCC) where
import Control.Monad.Cont.Trans ()
import Control.Monad.Error.Trans ()
import Control.Monad.Cont.Class ()
import Control.Monad.Maybe.Trans ()
import Control.Monad.Reader.Trans ()
import Control.Monad.State.Trans ()
import Control.Monad.Writer.Trans ()
import Prim ()
import Prelude ()
import Control.Monad.Error ()
import Control.Monad.Cont.Trans ()
import Control.Monad.Error ()
import Control.Monad.Error.Trans ()
import Control.Monad.Maybe.Trans ()
import Control.Monad.Reader.Trans ()
import Control.Monad.State.Trans ()
import Control.Monad.Writer.Trans ()
import Data.Monoid ()
--  | The `MonadCont` type class represents those monads which support the
--  | `callCC` operation.
--  |
--  | An implementation is provided for `ContT`, and for other monad transformers
--  | defined in this library.
--  | The `MonadCont` type class represents those monads which support the
--  | `callCC` operation.
--  |
--  | An implementation is provided for `ContT`, and for other monad transformers
--  | defined in this library.
--  | The `MonadCont` type class represents those monads which support the
--  | `callCC` operation.
--  |
--  | An implementation is provided for `ContT`, and for other monad transformers
--  | defined in this library.
class MonadCont m where
  callCC :: forall a b. ((a -> m b) -> m a) -> m a
foreign import instance monadContContT :: (Prelude.Monad m) => Control.Monad.Cont.Class.MonadCont (Control.Monad.Cont.Trans.ContT r m)
foreign import instance monadContErrorT :: (Control.Monad.Cont.Class.MonadCont m) => Control.Monad.Cont.Class.MonadCont (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance monadContMaybeT :: (Control.Monad.Cont.Class.MonadCont m) => Control.Monad.Cont.Class.MonadCont (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance monadContReaderT :: (Control.Monad.Cont.Class.MonadCont m) => Control.Monad.Cont.Class.MonadCont (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance monadContStateT :: (Control.Monad.Cont.Class.MonadCont m) => Control.Monad.Cont.Class.MonadCont (Control.Monad.State.Trans.StateT s m)
foreign import instance monadWriterT :: (Data.Monoid.Monoid w, Control.Monad.Cont.Class.MonadCont m) => Control.Monad.Cont.Class.MonadCont (Control.Monad.Writer.Trans.WriterT w m)