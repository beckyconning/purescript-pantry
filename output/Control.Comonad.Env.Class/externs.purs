module Control.Comonad.Env.Class (ComonadEnv, asks, local, ask) where
import Prelude ()
import Control.Comonad.Env.Class ()
import Data.Tuple ()
import Control.Comonad.Env.Trans ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Comonad.Env ()
import Control.Comonad.Env.Trans ()
import Data.Tuple ()
--  | The `ComonadEnv` type class represents those monads which support a global environment via
--  | `ask` and `local`.
--  |
--  | - `ask` reads the current environment from the context.
--  | - `local` changes the value of the global environment.
--  |
--  | An implementation is provided for `EnvT`.
--  |
--  | Laws:
--  |
--  | - `ask (local f x) = f (ask x)`
--  | - `extract (local _ x) = extract a`
--  | - `extend g (local f x) = extend (g <<< local f) x` 
--  | The `ComonadEnv` type class represents those monads which support a global environment via
--  | `ask` and `local`.
--  |
--  | - `ask` reads the current environment from the context.
--  | - `local` changes the value of the global environment.
--  |
--  | An implementation is provided for `EnvT`.
--  |
--  | Laws:
--  |
--  | - `ask (local f x) = f (ask x)`
--  | - `extract (local _ x) = extract a`
--  | - `extend g (local f x) = extend (g <<< local f) x` 
--  | The `ComonadEnv` type class represents those monads which support a global environment via
--  | `ask` and `local`.
--  |
--  | - `ask` reads the current environment from the context.
--  | - `local` changes the value of the global environment.
--  |
--  | An implementation is provided for `EnvT`.
--  |
--  | Laws:
--  |
--  | - `ask (local f x) = f (ask x)`
--  | - `extract (local _ x) = extract a`
--  | - `extend g (local f x) = extend (g <<< local f) x` 
--  | The `ComonadEnv` type class represents those monads which support a global environment via
--  | `ask` and `local`.
--  |
--  | - `ask` reads the current environment from the context.
--  | - `local` changes the value of the global environment.
--  |
--  | An implementation is provided for `EnvT`.
--  |
--  | Laws:
--  |
--  | - `ask (local f x) = f (ask x)`
--  | - `extract (local _ x) = extract a`
--  | - `extend g (local f x) = extend (g <<< local f) x` 
--  | Get a value which depends on the environment.
class (Control.Comonad.Comonad w) <= ComonadEnv e w where
  ask :: forall a. w a -> e
  local :: forall a. (e -> e) -> w a -> w a
foreign import asks :: forall e1 e2 w a. (Control.Comonad.Env.Class.ComonadEnv e1 w) => (e1 -> e2) -> w e1 -> e2
foreign import instance comonadEnvTuple :: Control.Comonad.Env.Class.ComonadEnv e (Data.Tuple.Tuple e)
foreign import instance comonadEnvEnvT :: (Control.Comonad.Comonad w) => Control.Comonad.Env.Class.ComonadEnv e (Control.Comonad.Env.Trans.EnvT e w)