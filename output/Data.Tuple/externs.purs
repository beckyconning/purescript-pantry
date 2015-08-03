module Data.Tuple (Tuple(Tuple), lookup, swap, uncurry, curry, snd, fst) where
import Prelude ()
import Data.Monoid ()
import Data.Functor.Invariant ()
import Data.Tuple ()
import Control.Lazy ()
import Data.Maybe.First ()
import Data.Foldable ()
import Prim ()
import Prelude ()
import Control.Biapplicative ()
import Control.Biapply ()
import Control.Comonad ()
import Control.Extend ()
import Control.Lazy ()
import Data.Bifoldable ()
import Data.Bifunctor ()
import Data.Bitraversable ()
import Data.Foldable ()
import Data.Functor.Invariant ()
import Data.Maybe ()
import Data.Maybe.First ()
import Data.Monoid ()
import Data.Traversable ()
--  | A simple product type for wrapping a pair of component values.
--  | Allows `Tuple`s to be rendered as a string with `show` whenever there are
--  | `Show` instances for both component types.
--  | Allows `Tuple`s to be checked for equality with `==` and `/=` whenever
--  | there are `Eq` instances for both component types.
--  | Allows `Tuple`s to be compared with `compare`, `>`, `>=`, `<` and `<=`
--  | whenever there are `Ord` instances for both component types. To obtain
--  | the result, the `fst`s are `compare`d, and if they are `EQ`ual, the
--  | `snd`s are `compare`d.
--  | The `Semigroup` instance enables use of the associative operator `<>` on
--  | `Tuple`s whenever there are `Semigroup` instances for the component
--  | types. The `<>` operator is applied pairwise, so:
--  | ```purescript
--  | (Tuple a1 b1) <> (Tuple a2 b2) = Tuple (a1 <> a2) (b1 <> b2)
--  | ```
--  | The `Functor` instance allows functions to transform the contents of a
--  | `Tuple` with the `<$>` operator, applying the function to the second
--  | component, so:
--  | ```purescript
--  | f <$> (Tuple x y) = Tuple x (f y)
--  | ````
--  | The `Functor` instance allows functions to transform the contents of a
--  | `Tuple` with the `<*>` operator whenever there is a `Semigroup` instance
--  | for the `fst` component, so:
--  | ```purescript
--  | (Tuple a1 f) <*> (Tuple a2 x) == Tuple (a1 <> a2) (f x)
--  | ```
--  | Turn a function of two arguments into a function that expects a tuple.
--  | Exchange the first and second components of a tuple.
--  | Returns the second component of a tuple.
--  | Allows `Tuple`s to be rendered as a string with `show` whenever there are
--  | `Show` instances for both component types.
--  | The `Semigroup` instance enables use of the associative operator `<>` on
--  | `Tuple`s whenever there are `Semigroup` instances for the component
--  | types. The `<>` operator is applied pairwise, so:
--  | ```purescript
--  | (Tuple a1 b1) <> (Tuple a2 b2) = Tuple (a1 <> a2) (b1 <> b2)
--  | ```
--  | Lookup a value in a data structure of `Tuple`s, generalizing association lists.
--  | The `Functor` instance allows functions to transform the contents of a
--  | `Tuple` with the `<$>` operator, applying the function to the second
--  | component, so:
--  | ```purescript
--  | f <$> (Tuple x y) = Tuple x (f y)
--  | ````
--  | Returns the first component of a tuple.
--  | Allows `Tuple`s to be checked for equality with `==` and `/=` whenever
--  | there are `Eq` instances for both component types.
--  | Allows `Tuple`s to be compared with `compare`, `>`, `>=`, `<` and `<=`
--  | whenever there are `Ord` instances for both component types. To obtain
--  | the result, the `fst`s are `compare`d, and if they are `EQ`ual, the
--  | `snd`s are `compare`d.
--  | Turn a function that expects a tuple into a function of two arguments.
--  | The `Functor` instance allows functions to transform the contents of a
--  | `Tuple` with the `<*>` operator whenever there is a `Semigroup` instance
--  | for the `fst` component, so:
--  | ```purescript
--  | (Tuple a1 f) <*> (Tuple a2 x) == Tuple (a1 <> a2) (f x)
--  | ```
data Tuple (a :: *) (b :: *) = Tuple a b
foreign import lookup :: forall a b f. (Data.Foldable.Foldable f, Prelude.Eq a) => a -> f (Data.Tuple.Tuple a b) -> Data.Maybe.Maybe b
foreign import swap :: forall a b. Data.Tuple.Tuple a b -> Data.Tuple.Tuple b a
foreign import uncurry :: forall a b c. (a -> b -> c) -> Data.Tuple.Tuple a b -> c
foreign import curry :: forall a b c. (Data.Tuple.Tuple a b -> c) -> a -> b -> c
foreign import snd :: forall a b. Data.Tuple.Tuple a b -> b
foreign import fst :: forall a b. Data.Tuple.Tuple a b -> a
foreign import instance showTuple :: (Prelude.Show a, Prelude.Show b) => Prelude.Show (Data.Tuple.Tuple a b)
foreign import instance eqTuple :: (Prelude.Eq a, Prelude.Eq b) => Prelude.Eq (Data.Tuple.Tuple a b)
foreign import instance ordTuple :: (Prelude.Ord a, Prelude.Ord b) => Prelude.Ord (Data.Tuple.Tuple a b)
foreign import instance boundedTuple :: (Prelude.Bounded a, Prelude.Bounded b) => Prelude.Bounded (Data.Tuple.Tuple a b)
foreign import instance boundedOrdTuple :: (Prelude.BoundedOrd a, Prelude.BoundedOrd b) => Prelude.BoundedOrd (Data.Tuple.Tuple a b)
foreign import instance semigroupoidTuple :: Prelude.Semigroupoid Data.Tuple.Tuple
foreign import instance semigroupTuple :: (Prelude.Semigroup a, Prelude.Semigroup b) => Prelude.Semigroup (Data.Tuple.Tuple a b)
foreign import instance monoidTuple :: (Data.Monoid.Monoid a, Data.Monoid.Monoid b) => Data.Monoid.Monoid (Data.Tuple.Tuple a b)
foreign import instance semiringTuple :: (Prelude.Semiring a, Prelude.Semiring b) => Prelude.Semiring (Data.Tuple.Tuple a b)
foreign import instance moduloSemiringTuple :: (Prelude.ModuloSemiring a, Prelude.ModuloSemiring b) => Prelude.ModuloSemiring (Data.Tuple.Tuple a b)
foreign import instance ringTuple :: (Prelude.Ring a, Prelude.Ring b) => Prelude.Ring (Data.Tuple.Tuple a b)
foreign import instance divisionRingTuple :: (Prelude.DivisionRing a, Prelude.DivisionRing b) => Prelude.DivisionRing (Data.Tuple.Tuple a b)
foreign import instance numTuple :: (Prelude.Num a, Prelude.Num b) => Prelude.Num (Data.Tuple.Tuple a b)
foreign import instance booleanAlgebraTuple :: (Prelude.BooleanAlgebra a, Prelude.BooleanAlgebra b) => Prelude.BooleanAlgebra (Data.Tuple.Tuple a b)
foreign import instance functorTuple :: Prelude.Functor (Data.Tuple.Tuple a)
foreign import instance invariantTuple :: Data.Functor.Invariant.Invariant (Data.Tuple.Tuple a)
foreign import instance bifunctorTuple :: Data.Bifunctor.Bifunctor Data.Tuple.Tuple
foreign import instance applyTuple :: (Prelude.Semigroup a) => Prelude.Apply (Data.Tuple.Tuple a)
foreign import instance biapplyTuple :: Control.Biapply.Biapply Data.Tuple.Tuple
foreign import instance applicativeTuple :: (Data.Monoid.Monoid a) => Prelude.Applicative (Data.Tuple.Tuple a)
foreign import instance biapplicativeTuple :: Control.Biapplicative.Biapplicative Data.Tuple.Tuple
foreign import instance bindTuple :: (Prelude.Semigroup a) => Prelude.Bind (Data.Tuple.Tuple a)
foreign import instance monadTuple :: (Data.Monoid.Monoid a) => Prelude.Monad (Data.Tuple.Tuple a)
foreign import instance extendTuple :: Control.Extend.Extend (Data.Tuple.Tuple a)
foreign import instance comonadTuple :: Control.Comonad.Comonad (Data.Tuple.Tuple a)
foreign import instance lazyTuple :: (Control.Lazy.Lazy a, Control.Lazy.Lazy b) => Control.Lazy.Lazy (Data.Tuple.Tuple a b)
foreign import instance foldableTuple :: Data.Foldable.Foldable (Data.Tuple.Tuple a)
foreign import instance bifoldableTuple :: Data.Bifoldable.Bifoldable Data.Tuple.Tuple
foreign import instance traversableTuple :: Data.Traversable.Traversable (Data.Tuple.Tuple a)
foreign import instance bitraversableTuple :: Data.Bitraversable.Bitraversable Data.Tuple.Tuple