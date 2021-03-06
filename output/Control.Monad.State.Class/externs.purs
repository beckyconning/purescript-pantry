module Control.Monad.State.Class (MonadState, modify, put, gets, get, state) where
import Control.Monad.State.Class ()
import Prelude ()
import Control.Monad.Trans ()
import Control.Monad.RWS ()
import Prim ()
import Prelude ()
import Control.Monad.Trans ()
import Control.Monad.State.Trans ()
import Control.Monad.Error ()
import Control.Monad.Error.Trans ()
import Control.Monad.Maybe.Trans ()
import Control.Monad.Reader.Trans ()
import Control.Monad.RWS.Trans ()
import Control.Monad.Writer.Trans ()
import Data.Monoid ()
import Data.Tuple ()
import Control.Monad.RWS ()
--  | The `MonadState s` type class represents those monads which support a single piece of mutable
--  | state of type `s`.
--  |
--  | - `state f` updates the state using the function `f`.
--  |
--  | An implementation is provided for `StateT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - `do { get ; get } = get`
--  | - `do { put x ; put y } = put y`
--  | - `do { put x ; get } = put x $> x`
--  | - `do { s <- get ; put s } = pure unit`
--  |
--  | The `MonadState s` type class represents those monads which support a single piece of mutable
--  | state of type `s`.
--  |
--  | - `state f` updates the state using the function `f`.
--  |
--  | An implementation is provided for `StateT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - `do { get ; get } = get`
--  | - `do { put x ; put y } = put y`
--  | - `do { put x ; get } = put x $> x`
--  | - `do { s <- get ; put s } = pure unit`
--  |
--  | The `MonadState s` type class represents those monads which support a single piece of mutable
--  | state of type `s`.
--  |
--  | - `state f` updates the state using the function `f`.
--  |
--  | An implementation is provided for `StateT`, and for other monad transformers
--  | defined in this library.
--  |
--  | Laws:
--  |
--  | - `do { get ; get } = get`
--  | - `do { put x ; put y } = put y`
--  | - `do { put x ; get } = put x $> x`
--  | - `do { s <- get ; put s } = pure unit`
--  |
--  | Set the state.
--  | Modify the state by applying a function to the current state.
--  | Get a value which depends on the current state.
--  | Get the current state.
class MonadState s m where
  state :: forall a. (s -> Data.Tuple.Tuple a s) -> m a
foreign import modify :: forall s m. (Prelude.Monad m, Control.Monad.State.Class.MonadState s m) => (s -> s) -> m Prelude.Unit
foreign import put :: forall m s. (Prelude.Monad m, Control.Monad.State.Class.MonadState s m) => s -> m Prelude.Unit
foreign import gets :: forall s m a. (Prelude.Monad m, Control.Monad.State.Class.MonadState s m) => (s -> a) -> m a
foreign import get :: forall m s. (Prelude.Monad m, Control.Monad.State.Class.MonadState s m) => m s
foreign import instance monadStateStateT :: (Prelude.Monad m) => Control.Monad.State.Class.MonadState s (Control.Monad.State.Trans.StateT s m)
foreign import instance monadStateStateT1 :: (Prelude.Monad m, Control.Monad.State.Class.MonadState s m) => Control.Monad.State.Class.MonadState s (Control.Monad.State.Trans.StateT s1 m)
foreign import instance monadStateErrorT :: (Prelude.Monad m, Control.Monad.State.Class.MonadState s m) => Control.Monad.State.Class.MonadState s (Control.Monad.Error.Trans.ErrorT e m)
foreign import instance monadStateMaybeT :: (Prelude.Monad m, Control.Monad.State.Class.MonadState s m) => Control.Monad.State.Class.MonadState s (Control.Monad.Maybe.Trans.MaybeT m)
foreign import instance monadStateReaderT :: (Prelude.Monad m, Control.Monad.State.Class.MonadState s m) => Control.Monad.State.Class.MonadState s (Control.Monad.Reader.Trans.ReaderT r m)
foreign import instance monadStateWriterT :: (Prelude.Monad m, Data.Monoid.Monoid w, Control.Monad.State.Class.MonadState s m) => Control.Monad.State.Class.MonadState s (Control.Monad.Writer.Trans.WriterT w m)
foreign import instance monadStateRWST :: (Prelude.Monad m, Data.Monoid.Monoid w) => Control.Monad.State.Class.MonadState s (Control.Monad.RWS.Trans.RWST r w s m)