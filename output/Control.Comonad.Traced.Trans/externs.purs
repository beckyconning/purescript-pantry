module Control.Comonad.Traced.Trans (TracedT(TracedT), runTracedT) where
import Prelude ()
import Control.Extend ()
import Control.Comonad ()
import Data.Monoid ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Comonad.Trans ()
import Control.Extend ()
import Data.Monoid ()
import Data.Tuple ()
--  | The cowriter comonad transformer.
--  |
--  | This comonad transformer extends the context of a value in the base comonad so that the value
--  | depends on a monoidal position of type `t`.
--  |
--  | The `ComonadTraced` type class describes the operations supported by this comonad.
--  | Unwrap a value in the `TracedT` comonad.
newtype TracedT (t :: *) (w :: * -> *) (a :: *) = TracedT (w (t -> a))
foreign import runTracedT :: forall w a t. Control.Comonad.Traced.Trans.TracedT t w a -> w (t -> a)
foreign import instance functorTracedT :: (Prelude.Functor w) => Prelude.Functor (Control.Comonad.Traced.Trans.TracedT t w)
foreign import instance extendTracedT :: (Control.Extend.Extend w, Prelude.Semigroup t) => Control.Extend.Extend (Control.Comonad.Traced.Trans.TracedT t w)
foreign import instance comonadTracedT :: (Control.Comonad.Comonad w, Data.Monoid.Monoid t) => Control.Comonad.Comonad (Control.Comonad.Traced.Trans.TracedT t w)
foreign import instance comonadTransTracedT :: (Data.Monoid.Monoid t) => Control.Comonad.Trans.ComonadTrans (Control.Comonad.Traced.Trans.TracedT t)