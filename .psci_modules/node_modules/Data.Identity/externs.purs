module Data.Identity (Identity(Identity), runIdentity) where
import Prelude ()
import Data.Monoid ()
import Data.Functor.Invariant ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Extend ()
import Data.Foldable ()
import Data.Functor.Invariant ()
import Data.Monoid ()
import Data.Traversable ()
newtype Identity (a :: *) = Identity a
foreign import runIdentity :: forall a. Data.Identity.Identity a -> a
foreign import instance eqIdentity :: (Prelude.Eq a) => Prelude.Eq (Data.Identity.Identity a)
foreign import instance ordIdentity :: (Prelude.Ord a) => Prelude.Ord (Data.Identity.Identity a)
foreign import instance boundedIdentity :: (Prelude.Bounded a) => Prelude.Bounded (Data.Identity.Identity a)
foreign import instance boundedOrdIdentity :: (Prelude.BoundedOrd a) => Prelude.BoundedOrd (Data.Identity.Identity a)
foreign import instance booleanAlgebraIdentity :: (Prelude.BooleanAlgebra a) => Prelude.BooleanAlgebra (Data.Identity.Identity a)
foreign import instance semigroupIdenity :: (Prelude.Semigroup a) => Prelude.Semigroup (Data.Identity.Identity a)
foreign import instance monoidIdentity :: (Data.Monoid.Monoid a) => Data.Monoid.Monoid (Data.Identity.Identity a)
foreign import instance semiringIdentity :: (Prelude.Semiring a) => Prelude.Semiring (Data.Identity.Identity a)
foreign import instance moduloSemiringIdentity :: (Prelude.ModuloSemiring a) => Prelude.ModuloSemiring (Data.Identity.Identity a)
foreign import instance ringIdentity :: (Prelude.Ring a) => Prelude.Ring (Data.Identity.Identity a)
foreign import instance divisionRingIdentity :: (Prelude.DivisionRing a) => Prelude.DivisionRing (Data.Identity.Identity a)
foreign import instance numIdentity :: (Prelude.Num a) => Prelude.Num (Data.Identity.Identity a)
foreign import instance showIdentity :: (Prelude.Show a) => Prelude.Show (Data.Identity.Identity a)
foreign import instance functorIdentity :: Prelude.Functor Data.Identity.Identity
foreign import instance invariantIdentity :: Data.Functor.Invariant.Invariant Data.Identity.Identity
foreign import instance applyIdentity :: Prelude.Apply Data.Identity.Identity
foreign import instance applicativeIdentity :: Prelude.Applicative Data.Identity.Identity
foreign import instance bindIdentity :: Prelude.Bind Data.Identity.Identity
foreign import instance monadIdentity :: Prelude.Monad Data.Identity.Identity
foreign import instance extendIdentity :: Control.Extend.Extend Data.Identity.Identity
foreign import instance comonadIdentity :: Control.Comonad.Comonad Data.Identity.Identity
foreign import instance foldableIdentity :: Data.Foldable.Foldable Data.Identity.Identity
foreign import instance traversableIdentity :: Data.Traversable.Traversable Data.Identity.Identity