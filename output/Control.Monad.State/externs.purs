module Control.Monad.State (State(), withState, mapState, execState, evalState, runState) where
import Prelude ()
import Data.Identity ()
import Control.Monad.State.Trans ()
import Data.Tuple ()
import Control.Monad.State ()
import Prim ()
import Prelude ()
import Control.Monad.State.Trans ()
import Data.Identity ()
import Data.Tuple ()
--  | The `State` monad is a synonym for the `StateT` monad transformer, applied
--  | to the `Identity` monad.
--  | Modify the state in a `State` action
--  | Run a computation in the `State` monad
--  | Change the type of the result in a `State` action
--  | Run a computation in the `State` monad, discarding the result
--  | Run a computation in the `State` monad, discarding the final state
type State (s :: *) = Control.Monad.State.Trans.StateT s Data.Identity.Identity
foreign import withState :: forall s a. (s -> s) -> Control.Monad.State.State s a -> Control.Monad.State.State s a
foreign import mapState :: forall s a b. (Data.Tuple.Tuple a s -> Data.Tuple.Tuple b s) -> Control.Monad.State.State s a -> Control.Monad.State.State s b
foreign import execState :: forall s a. Control.Monad.State.State s a -> s -> s
foreign import evalState :: forall s a. Control.Monad.State.State s a -> s -> a
foreign import runState :: forall s a. Control.Monad.State.State s a -> s -> Data.Tuple.Tuple a s