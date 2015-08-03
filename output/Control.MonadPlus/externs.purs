module Control.MonadPlus (MonadPlus, guard) where
import Prelude ()
import Control.Plus ()
import Prim ()
import Prelude ()
import Control.Alternative ()
import Control.Plus ()
--  | The `MonadPlus` type class has no members of its own; it just specifies
--  | that the type has both `Monad` and `Alternative` instances.
--  |
--  | Types which have `MonadPlus` instances should also satisfy the following
--  | laws:
--  |
--  | - Distributivity: `(x <|> y) >>= f == (x >>= f) <|> (y >>= f)`
--  | - Annihilation: `empty >>= f = empty`
--  | The `MonadPlus` type class has no members of its own; it just specifies
--  | that the type has both `Monad` and `Alternative` instances.
--  |
--  | Types which have `MonadPlus` instances should also satisfy the following
--  | laws:
--  |
--  | - Distributivity: `(x <|> y) >>= f == (x >>= f) <|> (y >>= f)`
--  | - Annihilation: `empty >>= f = empty`
--  | Fail using `Plus` if a condition does not hold, or
--  | succeed using `Monad` if it does.
--  |
--  | For example:
--  |
--  | ```purescript
--  | import Data.Array
--  |
--  | factors :: Number -> Array Number
--  | factors n = do
--  |   a <- 1 .. n
--  |   b <- 1 .. a
--  |   guard $ a * b == n
--  |   return a
--  | ```
class (Prelude.Monad m, Control.Alternative.Alternative m) <= MonadPlus m where
foreign import guard :: forall m. (Control.MonadPlus.MonadPlus m) => Prim.Boolean -> m Prelude.Unit
foreign import instance monadPlusArray :: Control.MonadPlus.MonadPlus Prim.Array