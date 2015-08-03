module Control.Comonad.Store.Class (ComonadStore, seeks, seek, peeks, experiment, peek, pos) where
import Prelude ()
import Control.Comonad.Store.Class ()
import Control.Extend ()
import Control.Comonad ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Comonad.Store.Trans ()
import Control.Extend ()
import Data.Tuple ()
--  | The `ComonadStore` type class represents those monads which support local position information via
--  | `pos` and `peek`.
--  |
--  | - `pos` reads the current position.
--  | - `peek` reads the value at the specified position in the specified context.
--  |
--  | An implementation is provided for `StoreT`.
--  |
--  | Laws:
--  |
--  | - `pos (extend _ x) = pos x`
--  | - `peek (pos x) x = extract x`
--  |
--  | For example:
--  |
--  | ```purescript
--  | blur :: forall w. (ComonadStore Number w) -> w Number -> w Number
--  | blur = extend \r -> (peeks (\n -> n - 1) r + peeks (\n -> n + 1) r) / 2)
--  | ```
--  | The `ComonadStore` type class represents those monads which support local position information via
--  | `pos` and `peek`.
--  |
--  | - `pos` reads the current position.
--  | - `peek` reads the value at the specified position in the specified context.
--  |
--  | An implementation is provided for `StoreT`.
--  |
--  | Laws:
--  |
--  | - `pos (extend _ x) = pos x`
--  | - `peek (pos x) x = extract x`
--  |
--  | For example:
--  |
--  | ```purescript
--  | blur :: forall w. (ComonadStore Number w) -> w Number -> w Number
--  | blur = extend \r -> (peeks (\n -> n - 1) r + peeks (\n -> n + 1) r) / 2)
--  | ```
--  | The `ComonadStore` type class represents those monads which support local position information via
--  | `pos` and `peek`.
--  |
--  | - `pos` reads the current position.
--  | - `peek` reads the value at the specified position in the specified context.
--  |
--  | An implementation is provided for `StoreT`.
--  |
--  | Laws:
--  |
--  | - `pos (extend _ x) = pos x`
--  | - `peek (pos x) x = extract x`
--  |
--  | For example:
--  |
--  | ```purescript
--  | blur :: forall w. (ComonadStore Number w) -> w Number -> w Number
--  | blur = extend \r -> (peeks (\n -> n - 1) r + peeks (\n -> n + 1) r) / 2)
--  | ```
--  | The `ComonadStore` type class represents those monads which support local position information via
--  | `pos` and `peek`.
--  |
--  | - `pos` reads the current position.
--  | - `peek` reads the value at the specified position in the specified context.
--  |
--  | An implementation is provided for `StoreT`.
--  |
--  | Laws:
--  |
--  | - `pos (extend _ x) = pos x`
--  | - `peek (pos x) x = extract x`
--  |
--  | For example:
--  |
--  | ```purescript
--  | blur :: forall w. (ComonadStore Number w) -> w Number -> w Number
--  | blur = extend \r -> (peeks (\n -> n - 1) r + peeks (\n -> n + 1) r) / 2)
--  | ```
--  | Extract a value from a position which depends on the current position.
--  | Reposition the focus at the specified position, which depends on the current position.
--  | Reposition the focus at the specified position.
--  | Extract a collection of values from positions which depend on the current position.
class (Control.Comonad.Comonad w) <= ComonadStore s w where
  pos :: forall a. w a -> s
  peek :: forall a. s -> w a -> a
foreign import seeks :: forall s a w. (Control.Comonad.Store.Class.ComonadStore s w, Control.Extend.Extend w) => (s -> s) -> w a -> w a
foreign import seek :: forall s a w. (Control.Comonad.Store.Class.ComonadStore s w, Control.Extend.Extend w) => s -> w a -> w a
foreign import peeks :: forall s a w. (Control.Comonad.Store.Class.ComonadStore s w) => (s -> s) -> w a -> a
foreign import experiment :: forall f a w s. (Control.Comonad.Store.Class.ComonadStore s w, Prelude.Functor f) => (s -> f s) -> w a -> f a
foreign import instance comonadStoreStoreT :: (Control.Comonad.Comonad w) => Control.Comonad.Store.Class.ComonadStore s (Control.Comonad.Store.Trans.StoreT s w)