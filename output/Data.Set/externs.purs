module Data.Set (Set(), difference, unions, union, size, fromList, toList, delete, member, insert, checkValid, singleton, isEmpty, empty) where
import Prelude ()
import Data.Set ()
import Data.Foldable ()
import Data.Map ()
import Data.Tuple ()
import Prim ()
import Prelude ()
import Data.Map ()
import Data.Int ()
import Data.Maybe ()
import Data.Monoid ()
import Data.Tuple ()
import Data.Foldable ()
import Data.List ()
--  | `Set a` represents a set of values of type `a`
--  | Form the union of two sets
--  | 
--  | Running time: `O(n * log(m))`
--  | Convert a set to a list
--  | Find the size of a set
--  | Create a set with one element
--  | Test if a value is a member of a set
--  | Test if a set is empty
--  | Insert a value into a set
--  | An empty set
--  | Create a set from a list of elements
--  | Form the union of a collection of sets
--  | Delete a value from a set
--  | Form the set difference
--  | Check whether the underlying tree satisfies the 2-3 invariant
--  | 
--  | This function is provided for internal use.
data Set (a :: *)
foreign import difference :: forall a. (Prelude.Ord a) => Data.Set.Set a -> Data.Set.Set a -> Data.Set.Set a
foreign import unions :: forall a. (Prelude.Ord a) => Data.List.List (Data.Set.Set a) -> Data.Set.Set a
foreign import union :: forall a. (Prelude.Ord a) => Data.Set.Set a -> Data.Set.Set a -> Data.Set.Set a
foreign import size :: forall a. Data.Set.Set a -> Prim.Int
foreign import fromList :: forall a. (Prelude.Ord a) => Data.List.List a -> Data.Set.Set a
foreign import toList :: forall a. Data.Set.Set a -> Data.List.List a
foreign import delete :: forall a. (Prelude.Ord a) => a -> Data.Set.Set a -> Data.Set.Set a
foreign import member :: forall a. (Prelude.Ord a) => a -> Data.Set.Set a -> Prim.Boolean
foreign import insert :: forall a. (Prelude.Ord a) => a -> Data.Set.Set a -> Data.Set.Set a
foreign import checkValid :: forall a. Data.Set.Set a -> Prim.Boolean
foreign import singleton :: forall a. a -> Data.Set.Set a
foreign import isEmpty :: forall a. Data.Set.Set a -> Prim.Boolean
foreign import empty :: forall a. Data.Set.Set a
foreign import instance eqSet :: (Prelude.Eq a) => Prelude.Eq (Data.Set.Set a)
foreign import instance showSet :: (Prelude.Show a) => Prelude.Show (Data.Set.Set a)
foreign import instance ordSet :: (Prelude.Ord a) => Prelude.Ord (Data.Set.Set a)
foreign import instance monoidSet :: (Prelude.Ord a) => Data.Monoid.Monoid (Data.Set.Set a)
foreign import instance monoidSemigroup :: (Prelude.Ord a) => Prelude.Semigroup (Data.Set.Set a)
foreign import instance foldableSet :: Data.Foldable.Foldable Data.Set.Set