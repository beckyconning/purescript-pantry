module Data.Monoid.Dual (Dual(Dual), runDual) where
import Prelude ()
import Data.Monoid.Dual ()
import Data.Monoid ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Extend ()
import Data.Functor.Invariant ()
import Data.Monoid ()
--  | The dual of a monoid.
--  |
--  | ``` purescript
--  | Dual x <> Dual y == Dual (y <> x)
--  | mempty :: Dual _ == Dual mempty
--  | ```
newtype Dual (a :: *) = Dual a
foreign import runDual :: forall a. Data.Monoid.Dual.Dual a -> a
foreign import instance eqDual :: (Prelude.Eq a) => Prelude.Eq (Data.Monoid.Dual.Dual a)
foreign import instance ordDual :: (Prelude.Ord a) => Prelude.Ord (Data.Monoid.Dual.Dual a)
foreign import instance functorDual :: Prelude.Functor Data.Monoid.Dual.Dual
foreign import instance applyDual :: Prelude.Apply Data.Monoid.Dual.Dual
foreign import instance applicativeDual :: Prelude.Applicative Data.Monoid.Dual.Dual
foreign import instance bindDual :: Prelude.Bind Data.Monoid.Dual.Dual
foreign import instance monadDual :: Prelude.Monad Data.Monoid.Dual.Dual
foreign import instance extendDual :: Control.Extend.Extend Data.Monoid.Dual.Dual
foreign import instance comonadDual :: Control.Comonad.Comonad Data.Monoid.Dual.Dual
foreign import instance invariantDual :: Data.Functor.Invariant.Invariant Data.Monoid.Dual.Dual
foreign import instance showDual :: (Prelude.Show a) => Prelude.Show (Data.Monoid.Dual.Dual a)
foreign import instance semigroupDual :: (Prelude.Semigroup a) => Prelude.Semigroup (Data.Monoid.Dual.Dual a)
foreign import instance monoidDual :: (Data.Monoid.Monoid a) => Data.Monoid.Monoid (Data.Monoid.Dual.Dual a)