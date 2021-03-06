module Control.Comonad.Env.Trans (EnvT(EnvT), mapEnvT, withEnvT, runEnvT) where
import Prelude ()
import Control.Extend ()
import Control.Comonad ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Comonad.Trans ()
import Control.Extend ()
import Data.Tuple ()
--  | The environment comonad transformer.
--  |
--  | This comonad transformer extends the context of a value in the base comonad with a _global environment_ of
--  | type `e`.
--  |
--  | The `ComonadEnv` type class describes the operations supported by this comonad.
--  | Change the environment type in an `EnvT` context.
--  | Unwrap a value in the `EnvT` comonad.
--  | Change the underlying comonad and data type in an `EnvT` context.
newtype EnvT (e :: *) (w :: * -> *) (a :: *) = EnvT (Data.Tuple.Tuple e (w a))
foreign import mapEnvT :: forall e w1 w2 a b. (w1 a -> w2 b) -> Control.Comonad.Env.Trans.EnvT e w1 a -> Control.Comonad.Env.Trans.EnvT e w2 b
foreign import withEnvT :: forall e1 e2 w a. (e1 -> e2) -> Control.Comonad.Env.Trans.EnvT e1 w a -> Control.Comonad.Env.Trans.EnvT e2 w a
foreign import runEnvT :: forall e w a. Control.Comonad.Env.Trans.EnvT e w a -> Data.Tuple.Tuple e (w a)
foreign import instance functorEnvT :: (Prelude.Functor w) => Prelude.Functor (Control.Comonad.Env.Trans.EnvT e w)
foreign import instance extendEnvT :: (Control.Extend.Extend w) => Control.Extend.Extend (Control.Comonad.Env.Trans.EnvT e w)
foreign import instance comonadEnvT :: (Control.Comonad.Comonad w) => Control.Comonad.Comonad (Control.Comonad.Env.Trans.EnvT e w)
foreign import instance comonadTransEnvT :: Control.Comonad.Trans.ComonadTrans (Control.Comonad.Env.Trans.EnvT e)