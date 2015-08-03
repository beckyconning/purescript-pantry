module Control.Monad.RWS.Class (MonadRWS) where
import Prim ()
import Prelude ()
import Control.Monad.RWS.Trans ()
import Control.Monad.Error.Trans ()
import Control.Monad.Error ()
import Control.Monad.Maybe.Trans ()
import Control.Monad.Reader.Class ()
import Control.Monad.State.Class ()
import Control.Monad.Writer.Class ()
import Data.Monoid ()
--  | `MonadRWS r w s` combines the operations and laws of the `MonadReader r`, 
--  | `MonadWriter w` and `MonadState s` type classes.
--  |
--  | An implementation is provided for `RWST`, and for other monad transformers
--  | defined in this library.
--  | `MonadRWS r w s` combines the operations and laws of the `MonadReader r`, 
--  | `MonadWriter w` and `MonadState s` type classes.
--  |
--  | An implementation is provided for `RWST`, and for other monad transformers
--  | defined in this library.
class (Prelude.Monad m, Data.Monoid.Monoid w, Control.Monad.Reader.Class.MonadReader r m, Control.Monad.Writer.Class.MonadWriter w m, Control.Monad.State.Class.MonadState s m) <= MonadRWS r w s m where
foreign import instance monadRWSRWST :: (Prelude.Monad m, Data.Monoid.Monoid w) => Control.Monad.RWS.Class.MonadRWS r w s (Control.Monad.RWS.Trans.RWST r w s m)
foreign import instance monadRWSErrorT :: (Prelude.Monad m, Data.Monoid.Monoid w, Control.Monad.RWS.Class.MonadRWS r w s m, Control.Monad.Reader.Class.MonadReader r m, Control.Monad.Writer.Class.MonadWriter w m, Control.Monad.State.Class.MonadState s m) => Control.Monad.RWS.Class.MonadRWS r w s (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance monadRWSMaybeT :: (Prelude.Monad m, Data.Monoid.Monoid w, Control.Monad.RWS.Class.MonadRWS r w s m, Control.Monad.Reader.Class.MonadReader r m, Control.Monad.Writer.Class.MonadWriter w m, Control.Monad.State.Class.MonadState s m) => Control.Monad.RWS.Class.MonadRWS r w s (Control.Monad.Maybe.Trans.MaybeT m)