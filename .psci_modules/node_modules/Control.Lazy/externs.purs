module Control.Lazy (Lazy, fix, defer) where
import Control.Lazy ()
import Prim ()
import Prelude ()
--  | The `Lazy` class represents types which allow evaluation of values
--  | to be _deferred_.
--  |
--  | Usually, this means that a type contains a function arrow which can
--  | be used to delay evaluation.
--  | The `Lazy` class represents types which allow evaluation of values
--  | to be _deferred_.
--  |
--  | Usually, this means that a type contains a function arrow which can
--  | be used to delay evaluation.
--  | The `Lazy` class represents types which allow evaluation of values
--  | to be _deferred_.
--  |
--  | Usually, this means that a type contains a function arrow which can
--  | be used to delay evaluation.
class Lazy l where
  defer :: (Prelude.Unit -> l) -> l
foreign import fix :: forall l a. (Control.Lazy.Lazy l) => (l -> l) -> l