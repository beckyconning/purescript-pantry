module Test.Spec.Assertions.String (shouldNotContain, shouldContain) where
import Prelude ()
import Control.Monad ()
import Data.String ()
import Control.Monad.Error.Class ()
import Control.Monad.Eff.Exception ()
import Prim ()
import Prelude ()
import Control.Monad ()
import Control.Monad.Aff ()
import Control.Monad.Error.Class ()
import Control.Monad.Eff.Exception ()
import Data.String ()
foreign import shouldNotContain :: forall r. Prim.String -> Prim.String -> Control.Monad.Aff.Aff r Prelude.Unit
foreign import shouldContain :: forall r. Prim.String -> Prim.String -> Control.Monad.Aff.Aff r Prelude.Unit