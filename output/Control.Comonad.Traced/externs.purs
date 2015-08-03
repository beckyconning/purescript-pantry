module Control.Comonad.Traced (Traced(), traced, runTraced) where
import Prelude ()
import Control.Comonad.Traced.Trans ()
import Data.Identity ()
import Prim ()
import Prelude ()
import Control.Comonad.Traced.Trans ()
import Data.Identity ()
--  | The `Traced` comonad is a synonym for the `TracedT` comonad transformer, applied
--  | to the `Identity` monad.
--  | Create a value in context in the `Traced` comonad.
--  | Unwrap a value in the `Traced` comonad.
type Traced (m :: *) = Control.Comonad.Traced.Trans.TracedT m Data.Identity.Identity
foreign import traced :: forall m a. (m -> a) -> Control.Comonad.Traced.Traced m a
foreign import runTraced :: forall m a. Control.Comonad.Traced.Traced m a -> m -> a