module Test.QuickCheck.Data.ApproxNumber (ApproxNumber(ApproxNumber), (=~=)) where
import Prelude ()
import Test.QuickCheck.Arbitrary ()
import Test.QuickCheck.Data.ApproxNumber ()
import Prim ()
import Prelude ()
import Test.QuickCheck.Arbitrary ()
--  | A newtype for `Number` whose `Eq` instance uses an epsilon value to allow
--  | for precision erros when comparing.
--  Approximate equality comparison
newtype ApproxNumber = ApproxNumber Prim.Number
foreign import (=~=) :: Prim.Number -> Prim.Number -> Prim.Boolean
foreign import instance arbitraryApproxNumber :: Test.QuickCheck.Arbitrary.Arbitrary Test.QuickCheck.Data.ApproxNumber.ApproxNumber
foreign import instance coarbitraryApproxNumber :: Test.QuickCheck.Arbitrary.Coarbitrary Test.QuickCheck.Data.ApproxNumber.ApproxNumber
foreign import instance eqApproxNumber :: Prelude.Eq Test.QuickCheck.Data.ApproxNumber.ApproxNumber
foreign import instance ordApproxNumber :: Prelude.Ord Test.QuickCheck.Data.ApproxNumber.ApproxNumber
foreign import instance semiringApproxNumber :: Prelude.Semiring Test.QuickCheck.Data.ApproxNumber.ApproxNumber
foreign import instance moduloSemiringApproxNumber :: Prelude.ModuloSemiring Test.QuickCheck.Data.ApproxNumber.ApproxNumber
foreign import instance ringApproxNumber :: Prelude.Ring Test.QuickCheck.Data.ApproxNumber.ApproxNumber
foreign import instance divisionRingApproxNumber :: Prelude.DivisionRing Test.QuickCheck.Data.ApproxNumber.ApproxNumber
foreign import instance numApproxNumber :: Prelude.Num Test.QuickCheck.Data.ApproxNumber.ApproxNumber