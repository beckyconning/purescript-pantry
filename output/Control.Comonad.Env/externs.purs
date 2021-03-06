module Control.Comonad.Env (Env(), env, mapEnv, withEnv, runEnv) where
import Prelude ()
import Data.Identity ()
import Control.Comonad.Env.Trans ()
import Prim ()
import Prelude ()
import Control.Comonad.Env.Trans ()
import Data.Identity ()
import Data.Tuple ()
--  | The `Env` comonad is a synonym for the `EnvT` comonad transformer, applied
--  | to the `Identity` monad.
--  | Change the environment type in an `Env` computation.
--  | Unwrap a value in the `Env` comonad.
--  | Change the data type in an `Env` computation.
--  | Create a value in context in the `Env` comonad.
type Env (e :: *) = Control.Comonad.Env.Trans.EnvT e Data.Identity.Identity
foreign import env :: forall e a. e -> a -> Control.Comonad.Env.Env e a
foreign import mapEnv :: forall e a b. (a -> b) -> Control.Comonad.Env.Env e a -> Control.Comonad.Env.Env e b
foreign import withEnv :: forall e1 e2 a. (e1 -> e2) -> Control.Comonad.Env.Env e1 a -> Control.Comonad.Env.Env e2 a
foreign import runEnv :: forall e a. Control.Comonad.Env.Env e a -> Data.Tuple.Tuple e a