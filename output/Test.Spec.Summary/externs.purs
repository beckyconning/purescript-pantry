module Test.Spec.Summary (Summary(Count), successful, summarize) where
import Prelude ()
import Data.Foldable ()
import Test.Spec.Summary ()
import Prim ()
import Prelude ()
import Data.Foldable ()
import Data.Monoid ()
import Test.Spec ()
data Summary = Count Prim.Int Prim.Int Prim.Int
foreign import successful :: Prim.Array Test.Spec.Group -> Prim.Boolean
foreign import summarize :: Prim.Array Test.Spec.Group -> Test.Spec.Summary.Summary
foreign import instance semigroupCount :: Prelude.Semigroup Test.Spec.Summary.Summary
foreign import instance monoidCount :: Data.Monoid.Monoid Test.Spec.Summary.Summary