module Data.Monoid.Disj (Disj(Disj), runDisj) where
import Prelude ()
import Data.Monoid.Disj ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Extend ()
import Data.Monoid ()
--  | Monoid under disjuntion.
--  |
--  | ``` purescript
--  | Disj x <> Disj y == Disj (x || y)
--  | mempty :: Disj _ == Disj bottom
--  | ```
newtype Disj (a :: *) = Disj a
foreign import runDisj :: forall a. Data.Monoid.Disj.Disj a -> a
foreign import instance eqDisj :: (Prelude.Eq a) => Prelude.Eq (Data.Monoid.Disj.Disj a)
foreign import instance ordDisj :: (Prelude.Ord a) => Prelude.Ord (Data.Monoid.Disj.Disj a)
foreign import instance boundedDisj :: (Prelude.Bounded a) => Prelude.Bounded (Data.Monoid.Disj.Disj a)
foreign import instance functorDisj :: Prelude.Functor Data.Monoid.Disj.Disj
foreign import instance applyDisj :: Prelude.Apply Data.Monoid.Disj.Disj
foreign import instance applicativeDisj :: Prelude.Applicative Data.Monoid.Disj.Disj
foreign import instance bindDisj :: Prelude.Bind Data.Monoid.Disj.Disj
foreign import instance monadDisj :: Prelude.Monad Data.Monoid.Disj.Disj
foreign import instance extendDisj :: Control.Extend.Extend Data.Monoid.Disj.Disj
foreign import instance comonadDisj :: Control.Comonad.Comonad Data.Monoid.Disj.Disj
foreign import instance showDisj :: (Prelude.Show a) => Prelude.Show (Data.Monoid.Disj.Disj a)
foreign import instance semigroupDisj :: (Prelude.BooleanAlgebra a) => Prelude.Semigroup (Data.Monoid.Disj.Disj a)
foreign import instance monoidDisj :: (Prelude.BooleanAlgebra a) => Data.Monoid.Monoid (Data.Monoid.Disj.Disj a)