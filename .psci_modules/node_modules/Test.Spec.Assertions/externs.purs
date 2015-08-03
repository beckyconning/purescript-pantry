module Test.Spec.Assertions (shouldContain, shouldNotEqual, shouldEqual, fail) where
import Prelude ()
import Control.Monad.Error.Class ()
import Control.Monad.Eff.Exception ()
import Control.Monad ()
import Test.Spec.Assertions ()
import Prim ()
import Prelude ()
import Control.Monad ()
import Control.Monad.Aff ()
import Control.Monad.Eff.Exception ()
import Control.Monad.Error.Class ()
import Data.Foldable ()
foreign import shouldContain :: forall r f a. (Prelude.Show a, Prelude.Eq a, Prelude.Show (f a), Data.Foldable.Foldable f) => f a -> a -> Control.Monad.Aff.Aff r Prelude.Unit
foreign import shouldNotEqual :: forall r t. (Prelude.Show t, Prelude.Eq t) => t -> t -> Control.Monad.Aff.Aff r Prelude.Unit
foreign import shouldEqual :: forall r t. (Prelude.Show t, Prelude.Eq t) => t -> t -> Control.Monad.Aff.Aff r Prelude.Unit
foreign import fail :: forall r. Prim.String -> Control.Monad.Aff.Aff r Prelude.Unit