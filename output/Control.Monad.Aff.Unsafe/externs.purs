module Control.Monad.Aff.Unsafe (unsafeInterleaveAff, unsafeTrace) where
import Prim ()
import Prelude ()
import Control.Monad.Aff ()
foreign import unsafeInterleaveAff :: forall e1 e2 a. Control.Monad.Aff.Aff e1 a -> Control.Monad.Aff.Aff e2 a
foreign import unsafeTrace :: forall e a. a -> Control.Monad.Aff.Aff e Prelude.Unit