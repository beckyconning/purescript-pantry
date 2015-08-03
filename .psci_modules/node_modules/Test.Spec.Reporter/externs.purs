module Test.Spec.Reporter (Reporter(), Entry(Describe, It, Pending), collapse) where
import Prelude ()
import Control.Monad.Eff.Exception ()
import Data.Foldable ()
import Data.Array ()
import Test.Spec.Reporter ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Exception ()
import Data.Array ()
import Data.Foldable ()
import Test.Spec ()
type Reporter (e :: # !) = Prim.Array Test.Spec.Group -> Control.Monad.Eff.Eff e Prelude.Unit
data Entry = Describe (Prim.Array Test.Spec.Name) | It Test.Spec.Name Test.Spec.Result | Pending Test.Spec.Name
foreign import collapse :: Test.Spec.Group -> Prim.Array Test.Spec.Reporter.Entry
foreign import instance eqEntry :: Prelude.Eq Test.Spec.Reporter.Entry
foreign import instance showEntry :: Prelude.Show Test.Spec.Reporter.Entry