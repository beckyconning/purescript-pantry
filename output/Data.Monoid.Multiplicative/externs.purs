module Data.Monoid.Multiplicative (Multiplicative(Multiplicative), runMultiplicative) where
import Prelude ()
import Data.Monoid.Multiplicative ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Extend ()
import Data.Functor.Invariant ()
import Data.Monoid ()
--  | Monoid and semigroup for semirings under multiplication.
--  |
--  | ``` purescript
--  | Multiplicative x <> Multiplicative y == Multiplicative (x * y)
--  | mempty :: Multiplicative _ == Multiplicative one
--  | ```
newtype Multiplicative (a :: *) = Multiplicative a
foreign import runMultiplicative :: forall a. Data.Monoid.Multiplicative.Multiplicative a -> a
foreign import instance eqMultiplicative :: (Prelude.Eq a) => Prelude.Eq (Data.Monoid.Multiplicative.Multiplicative a)
foreign import instance ordMultiplicative :: (Prelude.Ord a) => Prelude.Ord (Data.Monoid.Multiplicative.Multiplicative a)
foreign import instance functorMultiplicative :: Prelude.Functor Data.Monoid.Multiplicative.Multiplicative
foreign import instance applyMultiplicative :: Prelude.Apply Data.Monoid.Multiplicative.Multiplicative
foreign import instance applicativeMultiplicative :: Prelude.Applicative Data.Monoid.Multiplicative.Multiplicative
foreign import instance bindMultiplicative :: Prelude.Bind Data.Monoid.Multiplicative.Multiplicative
foreign import instance monadMultiplicative :: Prelude.Monad Data.Monoid.Multiplicative.Multiplicative
foreign import instance extendMultiplicative :: Control.Extend.Extend Data.Monoid.Multiplicative.Multiplicative
foreign import instance comonadMultiplicative :: Control.Comonad.Comonad Data.Monoid.Multiplicative.Multiplicative
foreign import instance invariantMultiplicative :: Data.Functor.Invariant.Invariant Data.Monoid.Multiplicative.Multiplicative
foreign import instance showMultiplicative :: (Prelude.Show a) => Prelude.Show (Data.Monoid.Multiplicative.Multiplicative a)
foreign import instance semigroupMultiplicative :: (Prelude.Semiring a) => Prelude.Semigroup (Data.Monoid.Multiplicative.Multiplicative a)
foreign import instance monoidMultiplicative :: (Prelude.Semiring a) => Data.Monoid.Monoid (Data.Monoid.Multiplicative.Multiplicative a)