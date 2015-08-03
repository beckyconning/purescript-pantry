module Test.Spec.Assertions.Aff (expectError) where
import Prelude ()
import Control.Monad.Aff ()
import Control.Monad.Error.Class ()
import Control.Monad.Eff.Exception ()
import Prim ()
import Prelude ()
import Control.Monad.Aff ()
import Control.Monad.Eff.Class ()
import Control.Monad.Eff.Exception ()
import Control.Monad.Error.Class ()
import Data.Either ()
foreign import expectError :: forall r t. Control.Monad.Aff.Aff r t -> Control.Monad.Aff.Aff r Prelude.Unit