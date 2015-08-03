module Data.Monoid.Conj (Conj(Conj), runConj) where
import Prelude ()
import Data.Monoid.Conj ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Extend ()
import Data.Monoid ()
--  | Monoid under conjuntion.
--  |
--  | ``` purescript
--  | Conj x <> Conj y == Conj (x && y)
--  | mempty :: Conj _ == Conj top
--  | ```
newtype Conj (a :: *) = Conj a
foreign import runConj :: forall a. Data.Monoid.Conj.Conj a -> a
foreign import instance eqConj :: (Prelude.Eq a) => Prelude.Eq (Data.Monoid.Conj.Conj a)
foreign import instance ordConj :: (Prelude.Ord a) => Prelude.Ord (Data.Monoid.Conj.Conj a)
foreign import instance boundedConj :: (Prelude.Bounded a) => Prelude.Bounded (Data.Monoid.Conj.Conj a)
foreign import instance functorConj :: Prelude.Functor Data.Monoid.Conj.Conj
foreign import instance applyConj :: Prelude.Apply Data.Monoid.Conj.Conj
foreign import instance applicativeConj :: Prelude.Applicative Data.Monoid.Conj.Conj
foreign import instance bindConj :: Prelude.Bind Data.Monoid.Conj.Conj
foreign import instance monadConj :: Prelude.Monad Data.Monoid.Conj.Conj
foreign import instance extendConj :: Control.Extend.Extend Data.Monoid.Conj.Conj
foreign import instance comonadConj :: Control.Comonad.Comonad Data.Monoid.Conj.Conj
foreign import instance showConj :: (Prelude.Show a) => Prelude.Show (Data.Monoid.Conj.Conj a)
foreign import instance semigroupConj :: (Prelude.BooleanAlgebra a) => Prelude.Semigroup (Data.Monoid.Conj.Conj a)
foreign import instance monoidConj :: (Prelude.BooleanAlgebra a) => Data.Monoid.Monoid (Data.Monoid.Conj.Conj a)