module Data.Map (Map(), size, unions, unionWith, union, values, keys, update, alter, member, delete, fromListWith, fromList, toList, lookup, insert, checkValid, singleton, isEmpty, empty, showTree) where
import Prelude ()
import Data.Map ()
import Data.Foldable ()
import Data.Tuple ()
import Data.Traversable ()
import Data.List ()
import Data.Maybe ()
import Prim ()
import Prelude ()
import Data.Foldable ()
import Data.List ()
import Data.Maybe ()
import Data.Monoid ()
import Data.Traversable ()
import Data.Tuple ()
--  | `Map k v` represents maps from keys of type `k` to values of type `v`.
--  | Calculate the number of key/value pairs in a map
--  | Create a map with one key/value pair
--  | Test if a key is a member of a map
--  | Test if a map is empty
--  | Insert a key/value pair into a map
--  | An empty map
--  | Create a map from an array of key/value pairs
--  | Delete a key and its corresponding value from a map
--  | Check whether the underlying tree satisfies the 2-3 invariant
--  |
--  | This function is provided for internal use.
--  | Insert the value, delete a value, or update a value for a key in a map
--  | Create a map from an array of key/value pairs, using the specified function
--  | to combine values for duplicate keys.
--  | Compute the union of two maps, using the specified function
--  | to combine values for duplicate keys.
--  | Compute the union of two maps, preferring values from the first map in the case
--  | of duplicate keys
--  | Compute the union of a collection of maps
--  | Update or delete the value for a key in a map
data Map (k :: *) (v :: *)
foreign import size :: forall k v. Data.Map.Map k v -> Prim.Int
foreign import unions :: forall k v f. (Prelude.Ord k, Data.Foldable.Foldable f) => f (Data.Map.Map k v) -> Data.Map.Map k v
foreign import unionWith :: forall k v. (Prelude.Ord k) => (v -> v -> v) -> Data.Map.Map k v -> Data.Map.Map k v -> Data.Map.Map k v
foreign import union :: forall k v. (Prelude.Ord k) => Data.Map.Map k v -> Data.Map.Map k v -> Data.Map.Map k v
foreign import values :: forall k v. Data.Map.Map k v -> Data.List.List v
foreign import keys :: forall k v. Data.Map.Map k v -> Data.List.List k
foreign import update :: forall k v. (Prelude.Ord k) => (v -> Data.Maybe.Maybe v) -> k -> Data.Map.Map k v -> Data.Map.Map k v
foreign import alter :: forall k v. (Prelude.Ord k) => (Data.Maybe.Maybe v -> Data.Maybe.Maybe v) -> k -> Data.Map.Map k v -> Data.Map.Map k v
foreign import member :: forall k v. (Prelude.Ord k) => k -> Data.Map.Map k v -> Prim.Boolean
foreign import delete :: forall k v. (Prelude.Ord k) => k -> Data.Map.Map k v -> Data.Map.Map k v
foreign import fromListWith :: forall k v. (Prelude.Ord k) => (v -> v -> v) -> Data.List.List (Data.Tuple.Tuple k v) -> Data.Map.Map k v
foreign import fromList :: forall k v. (Prelude.Ord k) => Data.List.List (Data.Tuple.Tuple k v) -> Data.Map.Map k v
foreign import toList :: forall k v. Data.Map.Map k v -> Data.List.List (Data.Tuple.Tuple k v)
foreign import lookup :: forall k v. (Prelude.Ord k) => k -> Data.Map.Map k v -> Data.Maybe.Maybe v
foreign import insert :: forall k v. (Prelude.Ord k) => k -> v -> Data.Map.Map k v -> Data.Map.Map k v
foreign import checkValid :: forall k v. Data.Map.Map k v -> Prim.Boolean
foreign import singleton :: forall k v. k -> v -> Data.Map.Map k v
foreign import isEmpty :: forall k v. Data.Map.Map k v -> Prim.Boolean
foreign import empty :: forall k v. Data.Map.Map k v
foreign import showTree :: forall k v. (Prelude.Show k, Prelude.Show v) => Data.Map.Map k v -> Prim.String
foreign import instance eqMap :: (Prelude.Eq k, Prelude.Eq v) => Prelude.Eq (Data.Map.Map k v)
foreign import instance showMap :: (Prelude.Show k, Prelude.Show v) => Prelude.Show (Data.Map.Map k v)
foreign import instance ordMap :: (Prelude.Ord k, Prelude.Ord v) => Prelude.Ord (Data.Map.Map k v)
foreign import instance semigroupMap :: (Prelude.Ord k) => Prelude.Semigroup (Data.Map.Map k v)
foreign import instance monoidMap :: (Prelude.Ord k) => Data.Monoid.Monoid (Data.Map.Map k v)
foreign import instance functorMap :: Prelude.Functor (Data.Map.Map k)
foreign import instance foldableMap :: Data.Foldable.Foldable (Data.Map.Map k)
foreign import instance traversableMap :: (Prelude.Ord k) => Data.Traversable.Traversable (Data.Map.Map k)