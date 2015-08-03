module Data.List.Lazy (Step(Nil, Cons), List(List), zip, zipWith, intersectBy, intersect, (\\), deleteBy, delete, unionBy, union, nubBy, nub, groupBy, group, span, dropWhile, drop, takeWhile, take, catMaybes, mapMaybe, filter, concatMap, concat, reverse, alterAt, modifyAt, updateAt, deleteAt, insertAt, index, (!!), uncons, init, tail, last, head, insertBy, insert, cons, (:), length, null, cycle, iterate, repeat, range, (..), singleton, nil, step, toList, fromList, runList) where
import Data.Unfoldable ()
import Prelude ()
import Data.List.Lazy ()
import Data.Foldable ()
import Data.Lazy ()
import Control.Lazy ()
import Data.Maybe ()
import Data.Monoid ()
import Data.Traversable ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Alternative ()
import Control.MonadPlus ()
import Control.Plus ()
import Data.Foldable ()
import Data.Lazy ()
import Data.Maybe ()
import Data.Monoid ()
import Data.Traversable ()
import Data.Tuple ()
import Data.Unfoldable ()
import Control.Lazy ()
-- ------------------------------------------------------------------------------
--  Folding ---------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  Instances -------------------------------------------------------------------
-- ------------------------------------------------------------------------------
infixr 6 :
infixl 8 !!
infix 5 \\
--  | Unwrap a lazy linked list
--  | Unwrap a lazy linked list
-- ------------------------------------------------------------------------------
--  Folding ---------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  Instances -------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Break a list into its first element, and the remaining elements,
--  | or `Nothing` if the list is empty.
--  |
--  | Running time: `O(1)`
--  | Get all but the first element of a list, or `Nothing` if the list is empty.
--  |
--  | Running time: `O(1)`
--  | Collect pairs of elements at the same positions in two lists.
--  |
--  | Running time: `O(min(m, n))`
-- ------------------------------------------------------------------------------
--  List size -------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Test whether a list is empty.
--  |
--  | Running time: `O(1)`
--  | The empty list.
--  |
--  | Running time: `O(1)`
--  | Get the length of a list
--  |
--  | Running time: `O(n)`
--  | Get the last element in a list, or `Nothing` if the list is empty.
--  |
--  | Running time: `O(n)`.
-- ------------------------------------------------------------------------------
--  Indexed operations ----------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Get the element at the specified index, or `Nothing` if the index is out-of-bounds.
--  |
--  | Running time: `O(n)` where `n` is the required index.
--  | An infix synonym for `index`.
-- ------------------------------------------------------------------------------
--  Non-indexed reads -----------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Get the first element in a list, or `Nothing` if the list is empty.
--  |
--  | Running time: `O(1)`.
--  | Insert an element into a sorted list.
--  |
--  | Running time: `O(n)`
--  | Convert a list into any unfoldable structure.
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
--  | Drop those elements from the front of a list which match a predicate.
--  |
--  | Running time (worst case): `O(n)`
--  | Drop the specified number of elements from the front of a list.
--  |
--  | Running time: `O(n)` where `n` is the number of elements to drop.
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
--  | Create a list by repeating another list
-- ------------------------------------------------------------------------------
--  Extending arrays ------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Attach an element to the front of a lazy list.
--  |
--  | Running time: `O(1)`
--  | Get all but the last element of a list, or `Nothing` if the list is empty.
--  |
--  | Running time: `O(n)`
--  | Create a list by iterating a function
--  | Create a list by repeating an element
-- ------------------------------------------------------------------------------
--  Transformations -------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Reverse a list.
--  |
--  | Running time: `O(n)`
-- ------------------------------------------------------------------------------
--  List creation ---------------------------------------------------------------
-- ------------------------------------------------------------------------------
--  | Create a list with a single element.
--  |
--  | Running time: `O(1)`
--  | Create a list containing a range of integers, including both endpoints.
--  | An infix synonym for `range`.
--  | Group equal, consecutive elements of a list into lists.
--  |
--  | For example,
--  |
--  | ```purescript
--  | group (1 : 1 : 2 : 2 : 1 : Nil) == (1 : 1 : Nil) : (2 : 2 : Nil) : (1 : Nil) : Nil
--  | ```
--  |
--  | Running time: `O(n)`
--  | Construct a list from a foldable structure.
--  |
--  | Running time: `O(n)`
--  | An infix alias for `cons`; attaches an element to the front of
--  | a list.
--  |
--  | Running time: `O(1)`
--  | Filter a list of optional values, keeping only the elements which contain
--  | a value.
--  | Flatten a list of lists.
--  |
--  | Running time: `O(n)`, where `n` is the total number of elements.
--  | Update the element at the specified index by applying a function to
--  | the current value, returning a new list or `Nothing` if the index is
--  | out-of-bounds.
--  |
--  | This function differs from the strict equivalent in that out-of-bounds arguments
--  | result in the original list being returned unchanged.
--  |
--  | Running time: `O(n)`
data Step (a :: *) = Nil  | Cons a (Data.List.Lazy.List a)
newtype List (a :: *) = List (Data.Lazy.Lazy (Data.List.Lazy.Step a))
foreign import zip :: forall a b. Data.List.Lazy.List a -> Data.List.Lazy.List b -> Data.List.Lazy.List (Data.Tuple.Tuple a b)
foreign import zipWith :: forall a b c. (a -> b -> c) -> Data.List.Lazy.List a -> Data.List.Lazy.List b -> Data.List.Lazy.List c
foreign import intersectBy :: forall a. (a -> a -> Prim.Boolean) -> Data.List.Lazy.List a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import intersect :: forall a. (Prelude.Eq a) => Data.List.Lazy.List a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import (\\) :: forall a. (Prelude.Eq a) => Data.List.Lazy.List a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import deleteBy :: forall a. (a -> a -> Prim.Boolean) -> a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import delete :: forall a. (Prelude.Eq a) => a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import unionBy :: forall a. (a -> a -> Prim.Boolean) -> Data.List.Lazy.List a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import union :: forall a. (Prelude.Eq a) => Data.List.Lazy.List a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import nubBy :: forall a. (a -> a -> Prim.Boolean) -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import nub :: forall a. (Prelude.Eq a) => Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import groupBy :: forall a. (a -> a -> Prim.Boolean) -> Data.List.Lazy.List a -> Data.List.Lazy.List (Data.List.Lazy.List a)
foreign import group :: forall a. (Prelude.Eq a) => Data.List.Lazy.List a -> Data.List.Lazy.List (Data.List.Lazy.List a)
foreign import span :: forall a. (a -> Prim.Boolean) -> Data.List.Lazy.List a -> { rest :: Data.List.Lazy.List a, init :: Data.List.Lazy.List a }
foreign import dropWhile :: forall a. (a -> Prim.Boolean) -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import drop :: forall a. Prim.Int -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import takeWhile :: forall a. (a -> Prim.Boolean) -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import take :: forall a. Prim.Int -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import catMaybes :: forall a. Data.List.Lazy.List (Data.Maybe.Maybe a) -> Data.List.Lazy.List a
foreign import mapMaybe :: forall a b. (a -> Data.Maybe.Maybe b) -> Data.List.Lazy.List a -> Data.List.Lazy.List b
foreign import filter :: forall a. (a -> Prim.Boolean) -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import concatMap :: forall a b. (a -> Data.List.Lazy.List b) -> Data.List.Lazy.List a -> Data.List.Lazy.List b
foreign import concat :: forall a. Data.List.Lazy.List (Data.List.Lazy.List a) -> Data.List.Lazy.List a
foreign import reverse :: forall a. Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import alterAt :: forall a. Prim.Int -> (a -> Data.Maybe.Maybe a) -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import modifyAt :: forall a. Prim.Int -> (a -> a) -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import updateAt :: forall a. Prim.Int -> a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import deleteAt :: forall a. Prim.Int -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import insertAt :: forall a. Prim.Int -> a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import index :: forall a. Data.List.Lazy.List a -> Prim.Int -> Data.Maybe.Maybe a
foreign import (!!) :: forall a. Data.List.Lazy.List a -> Prim.Int -> Data.Maybe.Maybe a
foreign import uncons :: forall a. Data.List.Lazy.List a -> Data.Maybe.Maybe { tail :: Data.List.Lazy.List a, head :: a }
foreign import init :: forall a. Data.List.Lazy.List a -> Data.Maybe.Maybe (Data.List.Lazy.List a)
foreign import tail :: forall a. Data.List.Lazy.List a -> Data.Maybe.Maybe (Data.List.Lazy.List a)
foreign import last :: forall a. Data.List.Lazy.List a -> Data.Maybe.Maybe a
foreign import head :: forall a. Data.List.Lazy.List a -> Data.Maybe.Maybe a
foreign import insertBy :: forall a. (a -> a -> Prelude.Ordering) -> a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import insert :: forall a. (Prelude.Ord a) => a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import cons :: forall a. a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import (:) :: forall a. a -> Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import length :: forall a. Data.List.Lazy.List a -> Prim.Int
foreign import null :: forall a. Data.List.Lazy.List a -> Prim.Boolean
foreign import cycle :: forall a. Data.List.Lazy.List a -> Data.List.Lazy.List a
foreign import iterate :: forall a. (a -> a) -> a -> Data.List.Lazy.List a
foreign import repeat :: forall a. a -> Data.List.Lazy.List a
foreign import range :: Prim.Int -> Prim.Int -> Data.List.Lazy.List Prim.Int
foreign import (..) :: Prim.Int -> Prim.Int -> Data.List.Lazy.List Prim.Int
foreign import singleton :: forall a. a -> Data.List.Lazy.List a
foreign import nil :: forall a. Data.List.Lazy.List a
foreign import step :: forall a. Data.List.Lazy.List a -> Data.List.Lazy.Step a
foreign import toList :: forall f a. (Data.Foldable.Foldable f) => f a -> Data.List.Lazy.List a
foreign import fromList :: forall f a. (Data.Unfoldable.Unfoldable f) => Data.List.Lazy.List a -> f a
foreign import runList :: forall a. Data.List.Lazy.List a -> Data.Lazy.Lazy (Data.List.Lazy.Step a)
foreign import instance showList :: (Prelude.Show a) => Prelude.Show (Data.List.Lazy.List a)
foreign import instance eqList :: (Prelude.Eq a) => Prelude.Eq (Data.List.Lazy.List a)
foreign import instance ordList :: (Prelude.Ord a) => Prelude.Ord (Data.List.Lazy.List a)
foreign import instance lazyList :: Control.Lazy.Lazy (Data.List.Lazy.List a)
foreign import instance semigroupList :: Prelude.Semigroup (Data.List.Lazy.List a)
foreign import instance monoidList :: Data.Monoid.Monoid (Data.List.Lazy.List a)
foreign import instance functorList :: Prelude.Functor Data.List.Lazy.List
foreign import instance foldableList :: Data.Foldable.Foldable Data.List.Lazy.List
foreign import instance unfoldableList :: Data.Unfoldable.Unfoldable Data.List.Lazy.List
foreign import instance traversableList :: Data.Traversable.Traversable Data.List.Lazy.List
foreign import instance applyList :: Prelude.Apply Data.List.Lazy.List
foreign import instance applicativeList :: Prelude.Applicative Data.List.Lazy.List
foreign import instance bindList :: Prelude.Bind Data.List.Lazy.List
foreign import instance monadList :: Prelude.Monad Data.List.Lazy.List
foreign import instance altList :: Control.Alt.Alt Data.List.Lazy.List
foreign import instance plusList :: Control.Plus.Plus Data.List.Lazy.List
foreign import instance alternativeList :: Control.Alternative.Alternative Data.List.Lazy.List
foreign import instance monadPlusList :: Control.MonadPlus.MonadPlus Data.List.Lazy.List