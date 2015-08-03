module Data.Array (foldM, unzip, zip, zipWithA, zipWith, intersectBy, intersect, (\\), deleteBy, delete, unionBy, union, nubBy, nub, groupBy, group', group, span, dropWhile, drop, takeWhile, take, slice, sortBy, sort, catMaybes, mapMaybe, filterM, filter, concatMap, concat, reverse, alterAt, modifyAt, updateAt, deleteAt, insertAt, findLastIndex, findIndex, elemLastIndex, elemIndex, index, (!!), uncons, init, tail, last, head, insertBy, insert, snoc, cons, (:), length, null, many, some, replicateM, replicate, range, (..), singleton) where
import Data.Array ()
import Prelude ()
import Data.Traversable ()
import Control.Lazy ()
import Control.Alt ()
import Data.Maybe ()
import Data.Maybe.Unsafe ()
import Data.Foldable ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Alternative ()
import Control.Lazy ()
import Control.MonadPlus ()
import Control.Plus ()
import Data.Foldable ()
import Data.Functor.Invariant ()
import Data.Maybe ()
import Data.Monoid ()
import Data.Traversable ()
import Data.Tuple ()
import Data.Maybe.Unsafe ()
infix 8 ..
infixr 6 :
infixl 8 !!
infix 5 \\
--  | Create an array containing a range of integers, including both endpoints.
--  | Create an array with repeated instances of a value.
--  | Get the number of elements in an array.
-- ------------------------------------------------------------------------------
--  Extending arrays ------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Attaches an element to the front of an array, creating a new array.
--  |
--  | ```purescript
--  | cons 1 [2, 3, 4] = [1, 2, 3, 4]
--  | ```
--  |
--  | Note, the running time of this function is `O(n)`.
--  | Append an element to the end of an array, creating a new array.
-- ------------------------------------------------------------------------------
--  Transformations -------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Reverse an array, creating a new array.
--  | Flatten an array of arrays, creating a new array.
--  | Filter an array, keeping the elements which satisfy a predicate function,
--  | creating a new array.
-- ------------------------------------------------------------------------------
--  Subarrays -------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Extract a subarray by a start and end index.
--  | Drop a number of elements from the start of an array, creating a new array.
-- ------------------------------------------------------------------------------
--  Zipping ---------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Apply a function to pairs of elements at the same index in two arrays,
--  | collecting the results in a new array.
--  |
--  | If one array is longer, elements will be discarded from the longer array.
--  |
--  | For example
--  |
--  | ```purescript
--  | zipWith (*) [1, 2, 3] [4, 5, 6, 7] == [4, 10, 18]
--  | ```
--  | An infix alias for `cons`.
--  |
--  | Note, the running time of this function is `O(n)`.
--  | An infix synonym for `range`.
--  | A generalization of `zipWith` which accumulates results in some `Applicative`
--  | functor.
--  | Rakes two lists and returns a list of corresponding pairs.
--  | If one input list is short, excess elements of the longer list are discarded.
--  | Change the element at the specified index, creating a new array, or
--  | returning `Nothing` if the index is out of bounds.
--  | Break an array into its first element and remaining elements.
--  |
--  | Using `uncons` provides a way of writing code that would use cons patterns
--  | in Haskell or pre-PureScript 0.7:
--  | ``` purescript
--  | f (x : xs) = something
--  | f [] = somethingElse
--  | ```
--  | Becomes:
--  | ``` purescript
--  | f arr = case uncons arr of
--  |   Just { head: x, tail: xs } -> something
--  |   Nothing -> somethingElse
--  | ```
--  | Keep only a number of elements from the start of an array, creating a new
--  | array.
--  | Get all but the first element of an array, creating a new array, or `Nothing` if the array is empty
--  |
--  | Running time: `O(n)` where `n` is the length of the array
--  | Split an array into two parts:
--  |
--  | 1. the longest initial subarray for which all element satisfy the specified
--  |    predicate
--  | 2. the remaining elements
--  |
--  | ```purescript
--  | span (\n -> n % 2 == 1) [1,3,2,4,5] == { init: [1,3], rest: [2,4,5] }
--  | ```
--  | Calculate the longest initial subarray for which all element satisfy the
--  | specified predicate, creating a new array.
--  | Sort the elements of an array in increasing order, where elements are compared using
--  | the specified partial ordering, creating a new array.
-- ------------------------------------------------------------------------------
--  Sorting ---------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Sort the elements of an array in increasing order, creating a new array.
-- ------------------------------------------------------------------------------
--  Array creation --------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Create an array of one element
--  | Perform a monadic action `n` times collecting all of the results.
-- ------------------------------------------------------------------------------
--  Array size ------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Test whether an array is empty.
-- ------------------------------------------------------------------------------
--  Set-like operations ---------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Remove the duplicates from an array, creating a new array.
--  | Insert an element at the specified index, creating a new array, or
--  | returning `Nothing` if the index is out of bounds.
--  | Get all but the last element of an array, creating a new array, or `Nothing` if the array is empty.
--  |
--  | Running time: `O(n)` where `n` is the length of the array
-- ------------------------------------------------------------------------------
--  Indexed operations ----------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | This function provides a safe way to read a value at a particular index
--  | from an array.
--  | An infix version of `index`.
--  | Get the last element in an array, or `Nothing` if the array is empty
--  |
--  | Running time: `O(1)`.
--  | Apply a function to the element at the specified index, creating a new
--  | array, or returning `Nothing` if the index is out of bounds.
-- ------------------------------------------------------------------------------
--  Non-indexed reads -----------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Get the first element in an array, or `Nothing` if the array is empty
--  |
--  | Running time: `O(1)`.
--  | Group equal, consecutive elements of an array into arrays, using the
--  | specified equivalence relation to detemine equality.
--  | Group equal, consecutive elements of an array into arrays.
--  |
--  | ```purescript
--  | group [1,1,2,2,1] == [[1,1],[2,2],[1]]
--  | ```
--  | Sort and then group the elements of an array into arrays.
--  |
--  | ```purescript
--  | group' [1,1,2,2,1] == [[1,1,1],[2,2]]
--  | ```
--  | Find the last index for which a predicate holds.
--  | Insert an element into a sorted array, using the specified function to
--  | determine the ordering of elements.
--  | Insert an element into a sorted array.
--  | Find the first index for which a predicate holds.
--  | Calculate the intersection of two arrays, using the specified equivalence
--  | relation to compare elements, creating a new array.
--  | Calculate the intersection of two arrays, creating a new array.
--  | Find the index of the last element equal to the specified element.
--  | Find the index of the first element equal to the specified element.
--  | Remove the longest initial subarray for which all element satisfy the
--  | specified predicate, creating a new array.
--  | Delete the element at the specified index, creating a new array, or
--  | returning `Nothing` if the index is out of bounds.
--  | Delete the first element of an array which matches the specified value,
--  | under the equivalence relation provided in the first argument, creating a
--  | new array.
--  | Calculate the union of two arrays, using the specified function to
--  | determine equality of elements.
--  | Calculate the union of two lists.
--  |
--  | Running time: `O(n^2)`
--  | Delete the first element of an array which is equal to the specified value,
--  | creating a new array.
--  | Apply a function to each element in an array, and flatten the results
--  | into a single, new array.
--  | Apply a function to each element in an array, keeping only the results
--  | which contain a value, creating a new array.
--  | Filter an array of optional values, keeping only the elements which contain
--  | a value, creating a new array.
--  | Update or delete the element at the specified index by applying a
--  | function to the current value, returning a new array or `Nothing` if the
--  | index is out-of-bounds.
foreign import foldM :: forall m a b. (Prelude.Monad m) => (a -> b -> m a) -> a -> Prim.Array b -> m a
foreign import unzip :: forall a b. Prim.Array (Data.Tuple.Tuple a b) -> Data.Tuple.Tuple (Prim.Array a) (Prim.Array b)
foreign import zip :: forall a b. Prim.Array a -> Prim.Array b -> Prim.Array (Data.Tuple.Tuple a b)
foreign import zipWithA :: forall m a b c. (Prelude.Applicative m) => (a -> b -> m c) -> Prim.Array a -> Prim.Array b -> m (Prim.Array c)
foreign import zipWith :: forall a b c. (a -> b -> c) -> Prim.Array a -> Prim.Array b -> Prim.Array c
foreign import intersectBy :: forall a. (a -> a -> Prim.Boolean) -> Prim.Array a -> Prim.Array a -> Prim.Array a
foreign import intersect :: forall a. (Prelude.Eq a) => Prim.Array a -> Prim.Array a -> Prim.Array a
foreign import (\\) :: forall a. (Prelude.Eq a) => Prim.Array a -> Prim.Array a -> Prim.Array a
foreign import deleteBy :: forall a. (a -> a -> Prim.Boolean) -> a -> Prim.Array a -> Prim.Array a
foreign import delete :: forall a. (Prelude.Eq a) => a -> Prim.Array a -> Prim.Array a
foreign import unionBy :: forall a. (a -> a -> Prim.Boolean) -> Prim.Array a -> Prim.Array a -> Prim.Array a
foreign import union :: forall a. (Prelude.Eq a) => Prim.Array a -> Prim.Array a -> Prim.Array a
foreign import nubBy :: forall a. (a -> a -> Prim.Boolean) -> Prim.Array a -> Prim.Array a
foreign import nub :: forall a. (Prelude.Eq a) => Prim.Array a -> Prim.Array a
foreign import groupBy :: forall a. (a -> a -> Prim.Boolean) -> Prim.Array a -> Prim.Array (Prim.Array a)
foreign import group' :: forall a. (Prelude.Ord a) => Prim.Array a -> Prim.Array (Prim.Array a)
foreign import group :: forall a. (Prelude.Eq a) => Prim.Array a -> Prim.Array (Prim.Array a)
foreign import span :: forall a. (a -> Prim.Boolean) -> Prim.Array a -> { rest :: Prim.Array a, init :: Prim.Array a }
foreign import dropWhile :: forall a. (a -> Prim.Boolean) -> Prim.Array a -> Prim.Array a
foreign import drop :: forall a. Prim.Int -> Prim.Array a -> Prim.Array a
foreign import takeWhile :: forall a. (a -> Prim.Boolean) -> Prim.Array a -> Prim.Array a
foreign import take :: forall a. Prim.Int -> Prim.Array a -> Prim.Array a
foreign import slice :: forall a. Prim.Int -> Prim.Int -> Prim.Array a -> Prim.Array a
foreign import sortBy :: forall a. (a -> a -> Prelude.Ordering) -> Prim.Array a -> Prim.Array a
foreign import sort :: forall a. (Prelude.Ord a) => Prim.Array a -> Prim.Array a
foreign import catMaybes :: forall a. Prim.Array (Data.Maybe.Maybe a) -> Prim.Array a
foreign import mapMaybe :: forall a b. (a -> Data.Maybe.Maybe b) -> Prim.Array a -> Prim.Array b
foreign import filterM :: forall a m. (Prelude.Monad m) => (a -> m Prim.Boolean) -> Prim.Array a -> m (Prim.Array a)
foreign import filter :: forall a. (a -> Prim.Boolean) -> Prim.Array a -> Prim.Array a
foreign import concatMap :: forall a b. (a -> Prim.Array b) -> Prim.Array a -> Prim.Array b
foreign import concat :: forall a. Prim.Array (Prim.Array a) -> Prim.Array a
foreign import reverse :: forall a. Prim.Array a -> Prim.Array a
foreign import alterAt :: forall a. Prim.Int -> (a -> Data.Maybe.Maybe a) -> Prim.Array a -> Data.Maybe.Maybe (Prim.Array a)
foreign import modifyAt :: forall a. Prim.Int -> (a -> a) -> Prim.Array a -> Data.Maybe.Maybe (Prim.Array a)
foreign import updateAt :: forall a. Prim.Int -> a -> Prim.Array a -> Data.Maybe.Maybe (Prim.Array a)
foreign import deleteAt :: forall a. Prim.Int -> Prim.Array a -> Data.Maybe.Maybe (Prim.Array a)
foreign import insertAt :: forall a. Prim.Int -> a -> Prim.Array a -> Data.Maybe.Maybe (Prim.Array a)
foreign import findLastIndex :: forall a. (a -> Prim.Boolean) -> Prim.Array a -> Data.Maybe.Maybe Prim.Int
foreign import findIndex :: forall a. (a -> Prim.Boolean) -> Prim.Array a -> Data.Maybe.Maybe Prim.Int
foreign import elemLastIndex :: forall a. (Prelude.Eq a) => a -> Prim.Array a -> Data.Maybe.Maybe Prim.Int
foreign import elemIndex :: forall a. (Prelude.Eq a) => a -> Prim.Array a -> Data.Maybe.Maybe Prim.Int
foreign import index :: forall a. Prim.Array a -> Prim.Int -> Data.Maybe.Maybe a
foreign import (!!) :: forall a. Prim.Array a -> Prim.Int -> Data.Maybe.Maybe a
foreign import uncons :: forall a. Prim.Array a -> Data.Maybe.Maybe { tail :: Prim.Array a, head :: a }
foreign import init :: forall a. Prim.Array a -> Data.Maybe.Maybe (Prim.Array a)
foreign import tail :: forall a. Prim.Array a -> Data.Maybe.Maybe (Prim.Array a)
foreign import last :: forall a. Prim.Array a -> Data.Maybe.Maybe a
foreign import head :: forall a. Prim.Array a -> Data.Maybe.Maybe a
foreign import insertBy :: forall a. (a -> a -> Prelude.Ordering) -> a -> Prim.Array a -> Prim.Array a
foreign import insert :: forall a. (Prelude.Ord a) => a -> Prim.Array a -> Prim.Array a
foreign import snoc :: forall a. Prim.Array a -> a -> Prim.Array a
foreign import cons :: forall a. a -> Prim.Array a -> Prim.Array a
foreign import (:) :: forall a. a -> Prim.Array a -> Prim.Array a
foreign import length :: forall a. Prim.Array a -> Prim.Int
foreign import null :: forall a. Prim.Array a -> Prim.Boolean
foreign import many :: forall f a. (Control.Alternative.Alternative f, Control.Lazy.Lazy (f (Prim.Array a))) => f a -> f (Prim.Array a)
foreign import some :: forall f a. (Control.Alternative.Alternative f, Control.Lazy.Lazy (f (Prim.Array a))) => f a -> f (Prim.Array a)
foreign import replicateM :: forall m a. (Prelude.Monad m) => Prim.Int -> m a -> m (Prim.Array a)
foreign import replicate :: forall a. Prim.Int -> a -> Prim.Array a
foreign import range :: Prim.Int -> Prim.Int -> Prim.Array Prim.Int
foreign import (..) :: Prim.Int -> Prim.Int -> Prim.Array Prim.Int
foreign import singleton :: forall a. a -> Prim.Array a