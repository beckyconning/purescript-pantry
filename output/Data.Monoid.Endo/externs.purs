module Data.Monoid.Endo (Endo(Endo), runEndo) where
import Prelude ()
import Prim ()
import Prelude ()
import Data.Functor.Invariant ()
import Data.Monoid ()
--  | Monoid of endomorphisms under composition.
--  |
--  | Composes of functions of type `a -> a`:
--  | ``` purescript
--  | Endo f <> Endo g == Endo (f <<< g)
--  | mempty :: Endo _ == Endo id
--  | ```
newtype Endo (a :: *) = Endo (a -> a)
foreign import runEndo :: forall a. Data.Monoid.Endo.Endo a -> a -> a
foreign import instance invariantEndo :: Data.Functor.Invariant.Invariant Data.Monoid.Endo.Endo
foreign import instance semigroupEndo :: Prelude.Semigroup (Data.Monoid.Endo.Endo a)
foreign import instance monoidEndo :: Data.Monoid.Monoid (Data.Monoid.Endo.Endo a)