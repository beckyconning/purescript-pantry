module Control.Monad.RWS (RWS(), modify, put, gets, get, state, censor, listens, tell, pass, listen, writer, reader, local, ask, withRWS, mapRWS, execRWS, evalRWS, runRWS, rws) where
import Prelude ()
import Data.Identity ()
import Control.Monad.RWS.Trans ()
import Data.Monoid ()
import Control.Monad.RWS ()
import Prim ()
import Prelude ()
import Control.Monad.RWS.Trans ()
import Data.Identity ()
import Data.Monoid ()
import Data.Tuple ()
--  | The `RWS` monad is a synonym for the `RWST` monad transformer, applied
--  | to the `Identity` monad.
--  | Write to the accumulator in a `RWS` action
--  | Change the type of the context in a `RWS` action
--  | Append a value to the accumulator in a `RWS` action
--  | Get or modify the state in a `RWS` action
--  | Create an action in the `RWS` monad from a function which uses the 
--  | global context and state explicitly.
--  | Run a computation in the `RWS` monad.
--  | Read a value which depends on the context in a `RWS` action.
--  | Set the state in a `RWS` action
--  | Execute a `RWS` action and modify the accumulator
--  | Modify the state in a `RWS` action
--  | Change the types of the result and accumulator in a `RWS` action
--  | Locally change the context of a `RWS` action.
--  | Execute a `RWS` action, and return a value which depends on the accumulator along with the return value
--  | Execute a `RWS` action, and return the changes to the accumulator along with the return value
--  | Get a value which depends on the state in a `RWS` action
--  | Get the state in a `RWS` action
--  | Run a computation in the `RWS` monad, discarding the result
--  | Run a computation in the `RWS` monad, discarding the final state
--  | Modify the accumulator in a `RWS` action
--  | Get the context of a `RWS` action
type RWS (r :: *) (w :: *) (s :: *) = Control.Monad.RWS.Trans.RWST r w s Data.Identity.Identity
foreign import modify :: forall r w s m. (Prelude.Applicative m, Data.Monoid.Monoid w) => (s -> s) -> Control.Monad.RWS.Trans.RWST r w s m Prelude.Unit
foreign import put :: forall r w s m. (Prelude.Applicative m, Data.Monoid.Monoid w) => s -> Control.Monad.RWS.Trans.RWST r w s m Prelude.Unit
foreign import gets :: forall r w s m a. (Prelude.Applicative m, Data.Monoid.Monoid w) => (s -> a) -> Control.Monad.RWS.Trans.RWST r w s m a
foreign import get :: forall r w s m. (Prelude.Applicative m, Data.Monoid.Monoid w) => Control.Monad.RWS.Trans.RWST r w s m s
foreign import state :: forall r w s m a. (Prelude.Applicative m, Data.Monoid.Monoid w) => (s -> Data.Tuple.Tuple a s) -> Control.Monad.RWS.Trans.RWST r w s m a
foreign import censor :: forall r w s m a. (Prelude.Monad m) => (w -> w) -> Control.Monad.RWS.Trans.RWST r w s m a -> Control.Monad.RWS.Trans.RWST r w s m a
foreign import listens :: forall r w s m a b. (Prelude.Monad m) => (w -> b) -> Control.Monad.RWS.Trans.RWST r w s m a -> Control.Monad.RWS.Trans.RWST r w s m (Data.Tuple.Tuple a b)
foreign import tell :: forall r w s m. (Prelude.Applicative m) => w -> Control.Monad.RWS.Trans.RWST r w s m Prelude.Unit
foreign import pass :: forall r w s m a. (Prelude.Monad m) => Control.Monad.RWS.Trans.RWST r w s m (Data.Tuple.Tuple a (w -> w)) -> Control.Monad.RWS.Trans.RWST r w s m a
foreign import listen :: forall r w s m a. (Prelude.Monad m) => Control.Monad.RWS.Trans.RWST r w s m a -> Control.Monad.RWS.Trans.RWST r w s m (Data.Tuple.Tuple a w)
foreign import writer :: forall r w s m a. (Prelude.Applicative m) => Data.Tuple.Tuple a w -> Control.Monad.RWS.Trans.RWST r w s m a
foreign import reader :: forall r w s m a. (Prelude.Applicative m, Data.Monoid.Monoid w) => (r -> a) -> Control.Monad.RWS.Trans.RWST r w s m a
foreign import local :: forall r w s m a. (r -> r) -> Control.Monad.RWS.Trans.RWST r w s m a -> Control.Monad.RWS.Trans.RWST r w s m a
foreign import ask :: forall r w s m. (Prelude.Applicative m, Data.Monoid.Monoid w) => Control.Monad.RWS.Trans.RWST r w s m r
foreign import withRWS :: forall r1 r2 w s a. (r2 -> s -> Data.Tuple.Tuple r1 s) -> Control.Monad.RWS.RWS r1 w s a -> Control.Monad.RWS.RWS r2 w s a
foreign import mapRWS :: forall r w1 w2 s a1 a2. (Control.Monad.RWS.Trans.See s a1 w1 -> Control.Monad.RWS.Trans.See s a2 w2) -> Control.Monad.RWS.RWS r w1 s a1 -> Control.Monad.RWS.RWS r w2 s a2
foreign import execRWS :: forall r w s a. Control.Monad.RWS.RWS r w s a -> r -> s -> Data.Tuple.Tuple s w
foreign import evalRWS :: forall r w s a. Control.Monad.RWS.RWS r w s a -> r -> s -> Data.Tuple.Tuple a w
foreign import runRWS :: forall r w s a. Control.Monad.RWS.RWS r w s a -> r -> s -> Control.Monad.RWS.Trans.See s a w
foreign import rws :: forall r w s a. (r -> s -> Control.Monad.RWS.Trans.See s a w) -> Control.Monad.RWS.RWS r w s a