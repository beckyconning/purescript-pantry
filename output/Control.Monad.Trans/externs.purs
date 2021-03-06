module Control.Monad.Trans (MonadTrans, lift) where
import Prim ()
import Prelude ()
--  | The `MonadTrans` type class represents _monad transformers_.
--  |
--  | A monad transformer is a type constructor of kind `(* -> *) -> * -> *`, which
--  | takes a `Monad` as its first argument, and returns another `Monad`.
--  |
--  | This allows us to add additional effects to an existing monad. By iterating this
--  | process, we create monad transformer _stacks_, which contain all of the effects
--  | required for a particular computation.
--  | 
--  | The laws state that `lift` is a `Monad` morphism.
--  |
--  | Laws:
--  |
--  | - `lift (pure a) = pure a`
--  | - `lift (do { x <- m ; y }) = do { x <- lift m ; lift y }`
--  | The `MonadTrans` type class represents _monad transformers_.
--  |
--  | A monad transformer is a type constructor of kind `(* -> *) -> * -> *`, which
--  | takes a `Monad` as its first argument, and returns another `Monad`.
--  |
--  | This allows us to add additional effects to an existing monad. By iterating this
--  | process, we create monad transformer _stacks_, which contain all of the effects
--  | required for a particular computation.
--  | 
--  | The laws state that `lift` is a `Monad` morphism.
--  |
--  | Laws:
--  |
--  | - `lift (pure a) = pure a`
--  | - `lift (do { x <- m ; y }) = do { x <- lift m ; lift y }`
--  | The `MonadTrans` type class represents _monad transformers_.
--  |
--  | A monad transformer is a type constructor of kind `(* -> *) -> * -> *`, which
--  | takes a `Monad` as its first argument, and returns another `Monad`.
--  |
--  | This allows us to add additional effects to an existing monad. By iterating this
--  | process, we create monad transformer _stacks_, which contain all of the effects
--  | required for a particular computation.
--  | 
--  | The laws state that `lift` is a `Monad` morphism.
--  |
--  | Laws:
--  |
--  | - `lift (pure a) = pure a`
--  | - `lift (do { x <- m ; y }) = do { x <- lift m ; lift y }`
class MonadTrans t where
  lift :: forall m a. (Prelude.Monad m) => m a -> t m a