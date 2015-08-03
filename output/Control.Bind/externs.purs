module Control.Bind (ifM, join, (<=<), (>=>), (=<<)) where
import Prelude ()
import Control.Bind ()
import Prim ()
import Prelude ()
infixr 1 =<<
infixr 1 >=>
infixr 1 <=<
--  | Forwards Kleisli composition.
--  |
--  | For example:
--  |
--  | ```purescript
--  | import Data.Array (head, tail)
--  |
--  | third = tail >=> tail >=> head
--  | ```
--  | A version of `(>>=)` with its arguments flipped.
--  | Backwards Kleisli composition.
--  | Collapse two applications of a monadic type constructor into one.
--  | Execute a monadic action if a condition holds.
--  |
--  | For example:
--  |
--  | ```purescript
--  | main = ifM ((< 0.5) <$> random)
--  |          (trace "Heads")
--  |          (trace "Tails")
--  | ```
foreign import ifM :: forall a m. (Prelude.Bind m) => m Prim.Boolean -> m a -> m a -> m a
foreign import join :: forall a m. (Prelude.Bind m) => m (m a) -> m a
foreign import (<=<) :: forall a b c m. (Prelude.Bind m) => (b -> m c) -> (a -> m b) -> a -> m c
foreign import (>=>) :: forall a b c m. (Prelude.Bind m) => (a -> m b) -> (b -> m c) -> a -> m c
foreign import (=<<) :: forall a b m. (Prelude.Bind m) => (a -> m b) -> m a -> m b