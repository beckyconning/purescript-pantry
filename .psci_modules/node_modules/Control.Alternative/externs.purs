module Control.Alternative (Alternative) where
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Lazy ()
import Control.Plus ()
--  | The `Alternative` type class has no members of its own; it just specifies
--  | that the type constructor has both `Applicative` and `Plus` instances.
--  |
--  | Types which have `Alternative` instances should also satisfy the following
--  | laws:
--  |
--  | - Distributivity: `(f <|> g) <*> x == (f <*> x) <|> (g <*> x)`
--  | - Annihilation: `empty <*> f = empty`
--  | The `Alternative` type class has no members of its own; it just specifies
--  | that the type constructor has both `Applicative` and `Plus` instances.
--  |
--  | Types which have `Alternative` instances should also satisfy the following
--  | laws:
--  |
--  | - Distributivity: `(f <|> g) <*> x == (f <*> x) <|> (g <*> x)`
--  | - Annihilation: `empty <*> f = empty`
class (Prelude.Applicative f, Control.Plus.Plus f) <= Alternative f where
foreign import instance alternativeArray :: Control.Alternative.Alternative Prim.Array