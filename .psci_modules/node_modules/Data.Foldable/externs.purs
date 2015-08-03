module Data.Foldable (Foldable, find, notElem, elem, product, sum, all, any, or, and, intercalate, mconcat, sequence_, for_, traverse_, fold, foldMap, foldl, foldr) where
import Data.Foldable ()
import Prelude ()
import Data.Monoid ()
import Control.Apply ()
import Data.Monoid.Disj ()
import Data.Monoid.Conj ()
import Prim ()
import Prelude ()
import Control.Apply ()
import Data.Maybe ()
import Data.Maybe.First ()
import Data.Maybe.Last ()
import Data.Monoid ()
import Data.Monoid.Additive ()
import Data.Monoid.Dual ()
import Data.Monoid.Disj ()
import Data.Monoid.Conj ()
import Data.Monoid.Multiplicative ()
--  | `Foldable` represents data structures which can be _folded_.
--  |
--  | - `foldr` folds a structure from the right
--  | - `foldl` folds a structure from the left
--  | - `foldMap` folds a structure by accumulating values in a `Monoid`
--  | `Foldable` represents data structures which can be _folded_.
--  |
--  | - `foldr` folds a structure from the right
--  | - `foldl` folds a structure from the left
--  | - `foldMap` folds a structure by accumulating values in a `Monoid`
--  | `Foldable` represents data structures which can be _folded_.
--  |
--  | - `foldr` folds a structure from the right
--  | - `foldl` folds a structure from the left
--  | - `foldMap` folds a structure by accumulating values in a `Monoid`
--  | Traverse a data structure, performing some effects encoded by an
--  | `Applicative` functor at each value, ignoring the final result.
--  |
--  | For example:
--  |
--  | ```purescript
--  | traverse_ print [1, 2, 3]
--  | ```
--  | A version of `traverse_` with its arguments flipped.
--  |
--  | This can be useful when running an action written using do notation
--  | for every element in a data structure:
--  |
--  | For example:
--  |
--  | ```purescript
--  | for_ [1, 2, 3] \n -> do
--  |   print n
--  |   trace "squared is"
--  |   print (n * n)
--  | ```
--  | Perform all of the effects in some data structure in the order
--  | given by the `Foldable` instance, ignoring the final result.
--  |
--  | For example:
--  |
--  | ```purescript
--  | sequence_ [ trace "Hello, ", trace " world!" ]
--  | ```
--  | `Foldable` represents data structures which can be _folded_.
--  |
--  | - `foldr` folds a structure from the right
--  | - `foldl` folds a structure from the left
--  | - `foldMap` folds a structure by accumulating values in a `Monoid`
--  | Fold a data structure, accumulating values in some `Monoid`,
--  | combining adjacent elements using the specified separator.
--  | Fold a data structure, accumulating values in some `Monoid`.
--  | Find the product of the numeric values in a data structure.
--  | Find the sum of the numeric values in a data structure.
--  | `Foldable` represents data structures which can be _folded_.
--  |
--  | - `foldr` folds a structure from the right
--  | - `foldl` folds a structure from the left
--  | - `foldMap` folds a structure by accumulating values in a `Monoid`
--  | Fold a data structure, accumulating values in some `Monoid`.
--  | Try to find an element in a data structure which satisfies a predicate.
--  | Test whether a predicate holds for any element in a data structure.
--  | Test whether a value is an element of a data structure.
--  | Test whether a value is not an element of a data structure.
--  | Test whether any `Boolean` value in a data structure is `true`.
--  | Test whether a predicate holds for all elements in a data structure.
--  | Test whether all `Boolean` values in a data structure are `true`.
class Foldable f where
  foldr :: forall a b. (a -> b -> b) -> b -> f a -> b
  foldl :: forall a b. (b -> a -> b) -> b -> f a -> b
  foldMap :: forall a m. (Data.Monoid.Monoid m) => (a -> m) -> f a -> m
foreign import find :: forall a f. (Data.Foldable.Foldable f) => (a -> Prim.Boolean) -> f a -> Data.Maybe.Maybe a
foreign import notElem :: forall a f. (Data.Foldable.Foldable f, Prelude.Eq a) => a -> f a -> Prim.Boolean
foreign import elem :: forall a f. (Data.Foldable.Foldable f, Prelude.Eq a) => a -> f a -> Prim.Boolean
foreign import product :: forall a f. (Data.Foldable.Foldable f, Prelude.Semiring a) => f a -> a
foreign import sum :: forall a f. (Data.Foldable.Foldable f, Prelude.Semiring a) => f a -> a
foreign import all :: forall a b f. (Data.Foldable.Foldable f, Prelude.BooleanAlgebra b) => (a -> b) -> f a -> b
foreign import any :: forall a b f. (Data.Foldable.Foldable f, Prelude.BooleanAlgebra b) => (a -> b) -> f a -> b
foreign import or :: forall a f. (Data.Foldable.Foldable f, Prelude.BooleanAlgebra a) => f a -> a
foreign import and :: forall a f. (Data.Foldable.Foldable f, Prelude.BooleanAlgebra a) => f a -> a
foreign import intercalate :: forall f m. (Data.Foldable.Foldable f, Data.Monoid.Monoid m) => m -> f m -> m
foreign import mconcat :: forall f m. (Data.Foldable.Foldable f, Data.Monoid.Monoid m) => f m -> m
foreign import sequence_ :: forall a f m. (Prelude.Applicative m, Data.Foldable.Foldable f) => f (m a) -> m Prelude.Unit
foreign import for_ :: forall a b f m. (Prelude.Applicative m, Data.Foldable.Foldable f) => f a -> (a -> m b) -> m Prelude.Unit
foreign import traverse_ :: forall a b f m. (Prelude.Applicative m, Data.Foldable.Foldable f) => (a -> m b) -> f a -> m Prelude.Unit
foreign import fold :: forall f m. (Data.Foldable.Foldable f, Data.Monoid.Monoid m) => f m -> m
foreign import instance foldableArray :: Data.Foldable.Foldable Prim.Array
foreign import instance foldableMaybe :: Data.Foldable.Foldable Data.Maybe.Maybe
foreign import instance foldableFirst :: Data.Foldable.Foldable Data.Maybe.First.First
foreign import instance foldableLast :: Data.Foldable.Foldable Data.Maybe.Last.Last
foreign import instance foldableAdditive :: Data.Foldable.Foldable Data.Monoid.Additive.Additive
foreign import instance foldableDual :: Data.Foldable.Foldable Data.Monoid.Dual.Dual
foreign import instance foldableDisj :: Data.Foldable.Foldable Data.Monoid.Disj.Disj
foreign import instance foldableConj :: Data.Foldable.Foldable Data.Monoid.Conj.Conj
foreign import instance foldableMultiplicative :: Data.Foldable.Foldable Data.Monoid.Multiplicative.Multiplicative