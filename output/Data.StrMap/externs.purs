module Data.StrMap (StrMap(), runST, freezeST, thawST, all, foldMaybe, foldM, foldMap, fold, isSubmap, unions, union, values, keys, update, alter, member, delete, fromListWith, fromList, toList, lookup, insert, singleton, size, isEmpty, empty) where
import Data.StrMap ()
import Control.Monad.Eff ()
import Prelude ()
import Data.Function ()
import Data.Monoid ()
import Data.Foldable ()
import Data.Tuple ()
import Data.Traversable ()
import Data.Maybe ()
import Data.StrMap.ST ()
import Data.List ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Data.Foldable ()
import Data.Function ()
import Data.Maybe ()
import Data.Monoid ()
import Data.Traversable ()
import Data.Tuple ()
import Data.List ()
import Control.Monad.ST ()
import Data.StrMap.ST ()
--  | `StrMap a` represents a map from `String`s to values of type `a`.
--  | Freeze a mutable map, creating an immutable map. Use this function as you would use
--  | `Prelude.runST` to freeze a mutable reference.
--  |
--  | The rank-2 type prevents the map from escaping the scope of `runST`.
--  Unfortunately the above are not short-circuitable (consider using purescript-machines)
--  so we need special cases:
--  | Test whether all key/value pairs in a `StrMap` satisfy a predicate.
--  | An empty map
--  | Calculate the number of key/value pairs in a map
--  | Get an array of the keys in a map
--  | Get an array of the values in a map
--  | Convert a map into an array of key/value pairs
--  | Convert an immutable map into a mutable map
--  | Create a map with one key/value pair
--  | Test whether a `String` appears as a key in a map
--  | Lookup the value for a key in a map
--  | Test whether one map contains all of the keys and values contained in another map
--  | Test whether a map is empty
--  | Insert a key and value into a map
--  | Create a map from an array of key/value pairs, using the specified function
--  | to combine values for duplicate keys.
--  | Create a map from an array of key/value pairs
--  | Convert a mutable map into an immutable map
--  | Fold the keys and values of a map.
--  |
--  | This function allows the folding function to terminate the fold early,
--  | using `Maybe`.
--  | Fold the keys and values of a map, accumulating values and effects in
--  | some `Monad`.
--  | Compute the union of two maps, preferring the first map in the case of
--  | duplicate keys.
--  | Compute the union of a collection of maps
--  | Fold the keys and values of a map
--  | Fold the keys and values of a map, accumulating values using
--  | some `Monoid`.
--  | Delete a key and value from a map
--  | Insert, remove or update a value for a key in a map
--  | Remove or update a value for a key in a map
foreign import data StrMap :: * -> *
foreign import runST :: forall a r. (forall h. Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) (Data.StrMap.ST.STStrMap h a)) -> Control.Monad.Eff.Eff r (Data.StrMap.StrMap a)
foreign import freezeST :: forall a h r. Data.StrMap.ST.STStrMap h a -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) (Data.StrMap.StrMap a)
foreign import thawST :: forall a h r. Data.StrMap.StrMap a -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) (Data.StrMap.ST.STStrMap h a)
foreign import all :: forall a. (Prim.String -> a -> Prim.Boolean) -> Data.StrMap.StrMap a -> Prim.Boolean
foreign import foldMaybe :: forall a z. (z -> Prim.String -> a -> Data.Maybe.Maybe z) -> z -> Data.StrMap.StrMap a -> z
foreign import foldM :: forall a m z. (Prelude.Monad m) => (z -> Prim.String -> a -> m z) -> z -> Data.StrMap.StrMap a -> m z
foreign import foldMap :: forall a m. (Data.Monoid.Monoid m) => (Prim.String -> a -> m) -> Data.StrMap.StrMap a -> m
foreign import fold :: forall a z. (z -> Prim.String -> a -> z) -> z -> Data.StrMap.StrMap a -> z
foreign import isSubmap :: forall a. (Prelude.Eq a) => Data.StrMap.StrMap a -> Data.StrMap.StrMap a -> Prim.Boolean
foreign import unions :: forall a. Data.List.List (Data.StrMap.StrMap a) -> Data.StrMap.StrMap a
foreign import union :: forall a. Data.StrMap.StrMap a -> Data.StrMap.StrMap a -> Data.StrMap.StrMap a
foreign import values :: forall a. Data.StrMap.StrMap a -> Data.List.List a
foreign import keys :: forall a. Data.StrMap.StrMap a -> Prim.Array Prim.String
foreign import update :: forall a. (a -> Data.Maybe.Maybe a) -> Prim.String -> Data.StrMap.StrMap a -> Data.StrMap.StrMap a
foreign import alter :: forall a. (Data.Maybe.Maybe a -> Data.Maybe.Maybe a) -> Prim.String -> Data.StrMap.StrMap a -> Data.StrMap.StrMap a
foreign import member :: forall a. Prim.String -> Data.StrMap.StrMap a -> Prim.Boolean
foreign import delete :: forall a. Prim.String -> Data.StrMap.StrMap a -> Data.StrMap.StrMap a
foreign import fromListWith :: forall a. (a -> a -> a) -> Data.List.List (Data.Tuple.Tuple Prim.String a) -> Data.StrMap.StrMap a
foreign import fromList :: forall a. Data.List.List (Data.Tuple.Tuple Prim.String a) -> Data.StrMap.StrMap a
foreign import toList :: forall a. Data.StrMap.StrMap a -> Data.List.List (Data.Tuple.Tuple Prim.String a)
foreign import lookup :: forall a. Prim.String -> Data.StrMap.StrMap a -> Data.Maybe.Maybe a
foreign import insert :: forall a. Prim.String -> a -> Data.StrMap.StrMap a -> Data.StrMap.StrMap a
foreign import singleton :: forall a. Prim.String -> a -> Data.StrMap.StrMap a
foreign import size :: forall a. Data.StrMap.StrMap a -> Prim.Number
foreign import isEmpty :: forall a. Data.StrMap.StrMap a -> Prim.Boolean
foreign import empty :: forall a. Data.StrMap.StrMap a
foreign import instance functorStrMap :: Prelude.Functor Data.StrMap.StrMap
foreign import instance foldableStrMap :: Data.Foldable.Foldable Data.StrMap.StrMap
foreign import instance traversableStrMap :: Data.Traversable.Traversable Data.StrMap.StrMap
foreign import instance eqStrMap :: (Prelude.Eq a) => Prelude.Eq (Data.StrMap.StrMap a)
foreign import instance showStrMap :: (Prelude.Show a) => Prelude.Show (Data.StrMap.StrMap a)
foreign import instance semigroupStrMap :: (Prelude.Semigroup a) => Prelude.Semigroup (Data.StrMap.StrMap a)
foreign import instance monoidStrMap :: (Prelude.Semigroup a) => Data.Monoid.Monoid (Data.StrMap.StrMap a)