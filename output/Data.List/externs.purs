module Data.List (List(Nil, Cons), foldM, unzip, zip, zipWithA, zipWith, intersectBy, intersect, (\\), deleteBy, delete, unionBy, union, nubBy, nub, groupBy, group', group, span, dropWhile, drop, takeWhile, take, slice, sortBy, sort, catMaybes, mapMaybe, filterM, filter, concatMap, concat, reverse, alterAt, modifyAt, updateAt, deleteAt, insertAt, findLastIndex, findIndex, elemLastIndex, elemIndex, index, (!!), uncons, init, tail, last, head, insertBy, insert, snoc, (:), length, null, many, some, replicateM, replicate, range, (..), singleton, toList, fromList) where
import Data.Unfoldable ()
import Prelude ()
import Data.List ()
import Data.Foldable ()
import Control.Lazy ()
import Control.Alt ()
import Data.Traversable ()
import Data.Monoid ()
import Prim ()
import Prelude ()
import Data.Maybe ()
import Data.Tuple ()
import Data.Monoid ()
import Data.Foldable ()
import Data.Unfoldable ()
import Data.Traversable ()
import Control.Alt ()
import Control.Lazy ()
import Control.Plus ()
import Control.Alternative ()
import Control.MonadPlus ()
--  | A strict linked list.
--  |
--  | A list is either empty (represented by the `Nil` constructor) or non-empty, in
--  | which case it consists of a head element, and another list (represented by the
--  | `Cons` constructor).
-- ------------------------------------------------------------------------------
--  Instances -------------------------------------------------------------------
-- ------------------------------------------------------------------------------
infix 8 ..
-- ------------------------------------------------------------------------------
--  Extending arrays ------------------------------------------------------------
-- ------------------------------------------------------------------------------
infixr 6 :
infixl 8 !!
infix 5 \\
--  | An infix alias for `Cons`; attaches an element to the front of
--  | a list.
--  |
--  | Running time: `O(1)`
--  | Collect pairs of elements at the same positions in two lists.
--  |
--  | Running time: `O(min(m, n))`
--  | Break a list into its first element, and the remaining elements,
--  | or `Nothing` if the list is empty.
--  |
--  | Running time: `O(1)`
--  | Construct a list from a foldable structure.
--  |
--  | Running time: `O(n)`
--  | Get all but the first element of a list, or `Nothing` if the list is empty.
--  |
--  | Running time: `O(1)`
-- ------------------------------------------------------------------------------
--  List creation ---------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Create a list with a single element.
--  |
--  | Running time: `O(1)`
--  | Sort the elements of a list in increasing order, where elements are
--  | compared using the specified ordering.
-- ------------------------------------------------------------------------------
--  Sorting ---------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Sort the elements of an list in increasing order.
-- ------------------------------------------------------------------------------
--  Transformations -------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Reverse a list.
--  |
--  | Running time: `O(n)`
--  | Append an element to the end of an array, creating a new array.
--  |
--  | Running time: `O(2n)`
--  | Take the specified number of elements from the front of a list.
--  |
--  | Running time: `O(n)` where `n` is the number of elements to take.
--  | Take those elements from the front of a list which match a predicate.
--  |
--  | Running time (worst case): `O(n)`
--  | Create a list with repeated instances of a value.
--  | Create a list containing a range of integers, including both endpoints.
--  | An infix synonym for `range`.
-- ------------------------------------------------------------------------------
--  List size -------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Test whether a list is empty.
--  |
--  | Running time: `O(1)`
--  | Apply a function to each element in a list, keeping only the results which
--  | contain a value.
--  |
--  | Running time: `O(n)`
--  | Insert an element into a sorted list.
--  |
--  | Running time: `O(n)`
--  | An infix synonym for `index`.
-- ------------------------------------------------------------------------------
--  Non-indexed reads -----------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Get the first element in a list, or `Nothing` if the list is empty.
--  |
--  | Running time: `O(1)`.
--  | Group equal, consecutive elements of a list into lists.
--  |
--  | For example,
--  |
--  | ```purescript
--  | group (1 : 1 : 2 : 2 : 1 : Nil) == (1 : 1 : Nil) : (2 : 2 : Nil) : (1 : Nil) : Nil
--  | ```
--  |
--  | Running time: `O(n)`
--  | Sort and then group the elements of a list into lists.
--  |
--  | ```purescript
--  | group' [1,1,2,2,1] == [[1,1,1],[2,2]]
--  | ```
--  | Convert a list into any unfoldable structure.
--  |
--  | Running time: `O(n)`
--  | A generalization of `zipWith` which accumulates results in some `Applicative`
--  | functor.
--  | Transforms a list of pairs into a list of first components and a list of
--  | second components.
--  | Find the first index for which a predicate holds.
--  | Find the last index for which a predicate holds.
--  | Filter a list, keeping the elements which satisfy a predicate function.
--  |
--  | Running time: `O(n)`
--  | Calculate the intersection of two lists, using the specified
--  | function to determine equality of elements.
--  |
--  | Running time: `O(n^2)`
--  | Calculate the intersection of two lists.
--  |
--  | Running time: `O(n^2)`
-- ------------------------------------------------------------------------------
--  Set-like operations ---------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Remove duplicate elements from a list.
--  |
--  | Running time: `O(n^2)`
--  | Find the index of the last element equal to the specified element.
--  | Find the index of the first element equal to the specified element.
--  | Drop those elements from the front of a list which match a predicate.
--  |
--  | Running time (worst case): `O(n)`
-- ------------------------------------------------------------------------------
--  Sublists --------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Extract a sublist by a start and end index.
--  | Calculate the union of two lists, using the specified
--  | function to determine equality of elements.
--  |
--  | Running time: `O(n^2)`
--  | Calculate the union of two lists.
--  |
--  | Running time: `O(n^2)`
--  | Delete the first occurrence of an element from a list.
--  |
--  | Running time: `O(n)`
--  | Delete the first occurrence of each element in the second list from the first list.
--  |
--  | Running time: `O(n^2)`
--  | Filter a list of optional values, keeping only the elements which contain
--  | a value.
--  | Flatten a list of lists.
--  |
--  | Running time: `O(n)`, where `n` is the total number of elements.
--  | Update the element at the specified index by applying a function to
--  | the current value, returning a new list or `Nothing` if the index is
--  | out-of-bounds.
--  |
--  | Running time: `O(n)`
data List (a :: *) = Nil  | Cons a (Data.List.List a)
foreign import foldM :: forall m a b. (Prelude.Monad m) => (a -> b -> m a) -> a -> Data.List.List b -> m a
foreign import unzip :: forall a b. Data.List.List (Data.Tuple.Tuple a b) -> Data.Tuple.Tuple (Data.List.List a) (Data.List.List b)
foreign import zip :: forall a b. Data.List.List a -> Data.List.List b -> Data.List.List (Data.Tuple.Tuple a b)
foreign import zipWithA :: forall m a b c. (Prelude.Applicative m) => (a -> b -> m c) -> Data.List.List a -> Data.List.List b -> m (Data.List.List c)
foreign import zipWith :: forall a b c. (a -> b -> c) -> Data.List.List a -> Data.List.List b -> Data.List.List c
foreign import intersectBy :: forall a. (a -> a -> Prim.Boolean) -> Data.List.List a -> Data.List.List a -> Data.List.List a
foreign import intersect :: forall a. (Prelude.Eq a) => Data.List.List a -> Data.List.List a -> Data.List.List a
foreign import (\\) :: forall a. (Prelude.Eq a) => Data.List.List a -> Data.List.List a -> Data.List.List a
foreign import deleteBy :: forall a. (a -> a -> Prim.Boolean) -> a -> Data.List.List a -> Data.List.List a
foreign import delete :: forall a. (Prelude.Eq a) => a -> Data.List.List a -> Data.List.List a
foreign import unionBy :: forall a. (a -> a -> Prim.Boolean) -> Data.List.List a -> Data.List.List a -> Data.List.List a
foreign import union :: forall a. (Prelude.Eq a) => Data.List.List a -> Data.List.List a -> Data.List.List a
foreign import nubBy :: forall a. (a -> a -> Prim.Boolean) -> Data.List.List a -> Data.List.List a
foreign import nub :: forall a. (Prelude.Eq a) => Data.List.List a -> Data.List.List a
foreign import groupBy :: forall a. (a -> a -> Prim.Boolean) -> Data.List.List a -> Data.List.List (Data.List.List a)
foreign import group' :: forall a. (Prelude.Ord a) => Data.List.List a -> Data.List.List (Data.List.List a)
foreign import group :: forall a. (Prelude.Eq a) => Data.List.List a -> Data.List.List (Data.List.List a)
foreign import span :: forall a. (a -> Prim.Boolean) -> Data.List.List a -> { rest :: Data.List.List a, init :: Data.List.List a }
foreign import dropWhile :: forall a. (a -> Prim.Boolean) -> Data.List.List a -> Data.List.List a
foreign import drop :: forall a. Prim.Int -> Data.List.List a -> Data.List.List a
foreign import takeWhile :: forall a. (a -> Prim.Boolean) -> Data.List.List a -> Data.List.List a
foreign import take :: forall a. Prim.Int -> Data.List.List a -> Data.List.List a
foreign import slice :: forall a. Prim.Int -> Prim.Int -> Data.List.List a -> Data.List.List a
foreign import sortBy :: forall a. (a -> a -> Prelude.Ordering) -> Data.List.List a -> Data.List.List a
foreign import sort :: forall a. (Prelude.Ord a) => Data.List.List a -> Data.List.List a
foreign import catMaybes :: forall a. Data.List.List (Data.Maybe.Maybe a) -> Data.List.List a
foreign import mapMaybe :: forall a b. (a -> Data.Maybe.Maybe b) -> Data.List.List a -> Data.List.List b
foreign import filterM :: forall a m. (Prelude.Monad m) => (a -> m Prim.Boolean) -> Data.List.List a -> m (Data.List.List a)
foreign import filter :: forall a. (a -> Prim.Boolean) -> Data.List.List a -> Data.List.List a
foreign import concatMap :: forall a b. (a -> Data.List.List b) -> Data.List.List a -> Data.List.List b
foreign import concat :: forall a. Data.List.List (Data.List.List a) -> Data.List.List a
foreign import reverse :: forall a. Data.List.List a -> Data.List.List a
foreign import alterAt :: forall a. Prim.Int -> (a -> Data.Maybe.Maybe a) -> Data.List.List a -> Data.Maybe.Maybe (Data.List.List a)
foreign import modifyAt :: forall a. Prim.Int -> (a -> a) -> Data.List.List a -> Data.Maybe.Maybe (Data.List.List a)
foreign import updateAt :: forall a. Prim.Int -> a -> Data.List.List a -> Data.Maybe.Maybe (Data.List.List a)
foreign import deleteAt :: forall a. Prim.Int -> Data.List.List a -> Data.Maybe.Maybe (Data.List.List a)
foreign import insertAt :: forall a. Prim.Int -> a -> Data.List.List a -> Data.Maybe.Maybe (Data.List.List a)
foreign import findLastIndex :: forall a. (a -> Prim.Boolean) -> Data.List.List a -> Data.Maybe.Maybe Prim.Int
foreign import findIndex :: forall a. (a -> Prim.Boolean) -> Data.List.List a -> Data.Maybe.Maybe Prim.Int
foreign import elemLastIndex :: forall a. (Prelude.Eq a) => a -> Data.List.List a -> Data.Maybe.Maybe Prim.Int
foreign import elemIndex :: forall a. (Prelude.Eq a) => a -> Data.List.List a -> Data.Maybe.Maybe Prim.Int
foreign import index :: forall a. Data.List.List a -> Prim.Int -> Data.Maybe.Maybe a
foreign import (!!) :: forall a. Data.List.List a -> Prim.Int -> Data.Maybe.Maybe a
foreign import uncons :: forall a. Data.List.List a -> Data.Maybe.Maybe { tail :: Data.List.List a, head :: a }
foreign import init :: forall a. Data.List.List a -> Data.Maybe.Maybe (Data.List.List a)
foreign import tail :: forall a. Data.List.List a -> Data.Maybe.Maybe (Data.List.List a)
foreign import last :: forall a. Data.List.List a -> Data.Maybe.Maybe a
foreign import head :: forall a. Data.List.List a -> Data.Maybe.Maybe a
foreign import insertBy :: forall a. (a -> a -> Prelude.Ordering) -> a -> Data.List.List a -> Data.List.List a
foreign import insert :: forall a. (Prelude.Ord a) => a -> Data.List.List a -> Data.List.List a
foreign import snoc :: forall a. Data.List.List a -> a -> Data.List.List a
foreign import (:) :: forall a. a -> Data.List.List a -> Data.List.List a
foreign import length :: forall a. Data.List.List a -> Prim.Int
foreign import null :: forall a. Data.List.List a -> Prim.Boolean
foreign import many :: forall f a. (Control.Alternative.Alternative f, Control.Lazy.Lazy (f (Data.List.List a))) => f a -> f (Data.List.List a)
foreign import some :: forall f a. (Control.Alternative.Alternative f, Control.Lazy.Lazy (f (Data.List.List a))) => f a -> f (Data.List.List a)
foreign import replicateM :: forall m a. (Prelude.Monad m) => Prim.Int -> m a -> m (Data.List.List a)
foreign import replicate :: forall a. Prim.Int -> a -> Data.List.List a
foreign import range :: Prim.Int -> Prim.Int -> Data.List.List Prim.Int
foreign import (..) :: Prim.Int -> Prim.Int -> Data.List.List Prim.Int
foreign import singleton :: forall a. a -> Data.List.List a
foreign import toList :: forall f a. (Data.Foldable.Foldable f) => f a -> Data.List.List a
foreign import fromList :: forall f a. (Data.Unfoldable.Unfoldable f) => Data.List.List a -> f a
foreign import instance showList :: (Prelude.Show a) => Prelude.Show (Data.List.List a)
foreign import instance eqList :: (Prelude.Eq a) => Prelude.Eq (Data.List.List a)
foreign import instance ordList :: (Prelude.Ord a) => Prelude.Ord (Data.List.List a)
foreign import instance semigroupList :: Prelude.Semigroup (Data.List.List a)
foreign import instance monoidList :: Data.Monoid.Monoid (Data.List.List a)
foreign import instance functorList :: Prelude.Functor Data.List.List
foreign import instance foldableList :: Data.Foldable.Foldable Data.List.List
foreign import instance unfoldableList :: Data.Unfoldable.Unfoldable Data.List.List
foreign import instance traversableList :: Data.Traversable.Traversable Data.List.List
foreign import instance applyList :: Prelude.Apply Data.List.List
foreign import instance applicativeList :: Prelude.Applicative Data.List.List
foreign import instance bindList :: Prelude.Bind Data.List.List
foreign import instance monadList :: Prelude.Monad Data.List.List
foreign import instance altList :: Control.Alt.Alt Data.List.List
foreign import instance plusList :: Control.Plus.Plus Data.List.List
foreign import instance alternativeList :: Control.Alternative.Alternative Data.List.List
foreign import instance monadPlusList :: Control.MonadPlus.MonadPlus Data.List.List