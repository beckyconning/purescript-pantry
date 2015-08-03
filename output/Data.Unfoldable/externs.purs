module Data.Unfoldable (Unfoldable, unfoldr) where
import Control.Monad.Eff ()
import Data.Array.ST ()
import Prelude ()
import Control.Monad.ST ()
import Prim ()
import Prelude ()
import Data.Maybe ()
import Data.Tuple ()
import Data.Array.ST ()
import Control.Monad.Eff ()
import Control.Monad.ST ()
--  | This class identifies data structures which can be _unfolded_,
--  | generalizing `unfoldr` on arrays.
--  |
--  | The generating function `f` in `unfoldr f` in understood as follows:
--  |
--  | - If `f b` is `Nothing`, then `unfoldr f b` should be empty.
--  | - If `f b` is `Just (Tuple a b1)`, then `unfoldr f b` should consist of `a`
--  |   appended to the result of `unfoldr f b1`.
--  | This class identifies data structures which can be _unfolded_,
--  | generalizing `unfoldr` on arrays.
--  |
--  | The generating function `f` in `unfoldr f` in understood as follows:
--  |
--  | - If `f b` is `Nothing`, then `unfoldr f b` should be empty.
--  | - If `f b` is `Just (Tuple a b1)`, then `unfoldr f b` should consist of `a`
--  |   appended to the result of `unfoldr f b1`.
--  | This class identifies data structures which can be _unfolded_,
--  | generalizing `unfoldr` on arrays.
--  |
--  | The generating function `f` in `unfoldr f` in understood as follows:
--  |
--  | - If `f b` is `Nothing`, then `unfoldr f b` should be empty.
--  | - If `f b` is `Just (Tuple a b1)`, then `unfoldr f b` should consist of `a`
--  |   appended to the result of `unfoldr f b1`.
class Unfoldable t where
  unfoldr :: forall a b. (b -> Data.Maybe.Maybe (Data.Tuple.Tuple a b)) -> b -> t a
foreign import instance unfoldableArray :: Data.Unfoldable.Unfoldable Prim.Array