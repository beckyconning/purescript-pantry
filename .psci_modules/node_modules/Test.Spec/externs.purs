module Test.Spec (Spec(), Group(Describe, It, Pending), Result(Success, Failure), Name(), collect, it, pending, describe) where
import Prelude ()
import Control.Monad.Trans ()
import Test.Spec ()
import Control.Monad.State.Class ()
import Control.Monad.Aff ()
import Data.Either ()
import Control.Monad.State.Trans ()
import Data.Tuple ()
import Prim ()
import Prelude ()
import Control.Monad.Aff ()
import Control.Monad.Eff.Exception ()
import Control.Monad.State.Class ()
import Control.Monad.State.Trans ()
import Control.Monad.Trans ()
import Data.Either ()
import Data.Monoid ()
import Data.Tuple ()
type Spec (r :: # !) (t :: *) = Control.Monad.State.Trans.StateT (Prim.Array Test.Spec.Group) (Control.Monad.Aff.Aff r) t
data Group = Describe Test.Spec.Name (Prim.Array Test.Spec.Group) | It Test.Spec.Name Test.Spec.Result | Pending Test.Spec.Name
data Result = Success  | Failure Control.Monad.Eff.Exception.Error
type Name = Prim.String
foreign import collect :: forall r. Test.Spec.Spec r Prelude.Unit -> Control.Monad.Aff.Aff r (Prim.Array Test.Spec.Group)
foreign import it :: forall r. Prim.String -> Control.Monad.Aff.Aff r Prelude.Unit -> Test.Spec.Spec r Prelude.Unit
foreign import pending :: forall r. Prim.String -> Test.Spec.Spec r Prelude.Unit
foreign import describe :: forall r. Prim.String -> Test.Spec.Spec r Prelude.Unit -> Test.Spec.Spec r Prelude.Unit
foreign import instance showResult :: Prelude.Show Test.Spec.Result
foreign import instance eqResult :: Prelude.Eq Test.Spec.Result
foreign import instance showGroup :: Prelude.Show Test.Spec.Group
foreign import instance eqGroup :: Prelude.Eq Test.Spec.Group