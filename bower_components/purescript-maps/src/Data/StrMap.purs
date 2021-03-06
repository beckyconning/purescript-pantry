-- | This module defines a type of native Javascript maps which
-- | require the keys to be strings.
-- |
-- | To maximize performance, Javascript objects are not wrapped,
-- | and some native code is used even when it's not necessary.

module Data.StrMap
  ( StrMap()
  , empty
  , isEmpty
  , size
  , singleton
  , insert
  , lookup
  , toList
  , fromList
  , fromListWith
  , delete
  , member
  , alter
  , update
  , keys
  , values
  , union
  , unions
  , isSubmap
  , fold
  , foldMap
  , foldM
  , foldMaybe
  , all
  , thawST
  , freezeST
  , runST
  ) where

import Prelude

import Control.Monad.Eff (Eff(), runPure)
import Data.Foldable (Foldable, foldl, foldr, for_)
import Data.Function (Fn2(), runFn2, Fn4(), runFn4)
import Data.Maybe (Maybe(..), maybe, fromMaybe)
import Data.Monoid (Monoid, mempty)
import Data.Traversable (Traversable, traverse)
import Data.Tuple (Tuple(..), uncurry)

import qualified Data.List as L
import qualified Control.Monad.ST as ST
import qualified Data.StrMap.ST as SM

-- | `StrMap a` represents a map from `String`s to values of type `a`.
foreign import data StrMap :: * -> *

foreign import _copy :: forall a. StrMap a -> StrMap a

foreign import _copyEff :: forall a b h r. a -> Eff (st :: ST.ST h | r) b

-- | Convert an immutable map into a mutable map
thawST :: forall a h r. StrMap a -> Eff (st :: ST.ST h | r) (SM.STStrMap h a)
thawST = _copyEff

-- | Convert a mutable map into an immutable map
freezeST :: forall a h r. SM.STStrMap h a -> Eff (st :: ST.ST h | r) (StrMap a)
freezeST = _copyEff

-- | Freeze a mutable map, creating an immutable map. Use this function as you would use
-- | `Prelude.runST` to freeze a mutable reference.
-- |
-- | The rank-2 type prevents the map from escaping the scope of `runST`.
foreign import runST :: forall a r. (forall h. Eff (st :: ST.ST h | r) (SM.STStrMap h a)) -> Eff r (StrMap a)

pureST :: forall a b. (forall h e. Eff (st :: ST.ST h | e) (SM.STStrMap h a)) -> StrMap a
pureST f = runPure (runST f)

mutate :: forall a b. (forall h e. SM.STStrMap h a -> Eff (st :: ST.ST h | e) b) -> StrMap a -> StrMap a
mutate f m = pureST (do
  s <- thawST m
  f s
  return s)

foreign import _fmapStrMap :: forall a b. Fn2 (StrMap a) (a -> b) (StrMap b)

instance functorStrMap :: Functor StrMap where
  map f m = runFn2 _fmapStrMap m f

foreign import _foldM :: forall a m z. (m -> (z -> m) -> m) -> (z -> String -> a -> m) -> m -> StrMap a -> m

-- | Fold the keys and values of a map
fold :: forall a z. (z -> String -> a -> z) -> z -> StrMap a -> z
fold = _foldM ((#))

-- | Fold the keys and values of a map, accumulating values using
-- | some `Monoid`.
foldMap :: forall a m. (Monoid m) => (String -> a -> m) -> StrMap a -> m
foldMap f = fold (\acc k v -> acc <> f k v) mempty

-- | Fold the keys and values of a map, accumulating values and effects in
-- | some `Monad`.
foldM :: forall a m z. (Monad m) => (z -> String -> a -> m z) -> z -> StrMap a -> m z
foldM f z = _foldM (>>=) f (pure z)

instance foldableStrMap :: Foldable StrMap where
  foldl f = fold (\z _ -> f z)
  foldr f z m = foldr f z (values m)
  foldMap f = foldMap (const f)

instance traversableStrMap :: Traversable StrMap where
  traverse f ms = foldr (\x acc -> union <$> x <*> acc) (pure empty) ((map (uncurry singleton)) <$> (traverse f <$> toList ms))
  sequence = traverse id

-- Unfortunately the above are not short-circuitable (consider using purescript-machines)
-- so we need special cases:

foreign import _foldSCStrMap :: forall a z. Fn4 (StrMap a) z (z -> String -> a -> Maybe z) (forall a. a -> Maybe a -> a) z

-- | Fold the keys and values of a map.
-- |
-- | This function allows the folding function to terminate the fold early,
-- | using `Maybe`.
foldMaybe :: forall a z. (z -> String -> a -> Maybe z) -> z -> StrMap a -> z
foldMaybe f z m = runFn4 _foldSCStrMap m z f fromMaybe

-- | Test whether all key/value pairs in a `StrMap` satisfy a predicate.
foreign import all :: forall a. (String -> a -> Boolean) -> StrMap a -> Boolean

instance eqStrMap :: (Eq a) => Eq (StrMap a) where
  eq m1 m2 = (isSubmap m1 m2) && (isSubmap m2 m1)

instance showStrMap :: (Show a) => Show (StrMap a) where
  show m = "fromList " ++ show (toList m)

-- | An empty map
foreign import empty :: forall a. StrMap a

-- | Test whether one map contains all of the keys and values contained in another map
isSubmap :: forall a. (Eq a) => StrMap a -> StrMap a -> Boolean
isSubmap m1 m2 = all f m1 where
  f k v = runFn4 _lookup false ((==) v) k m2

-- | Test whether a map is empty
isEmpty :: forall a. StrMap a -> Boolean
isEmpty = all (\_ _ -> false)

-- | Calculate the number of key/value pairs in a map
foreign import size :: forall a. StrMap a -> Number

-- | Create a map with one key/value pair
singleton :: forall a. String -> a -> StrMap a
singleton k v = pureST (do
  s <- SM.new
  SM.poke s k v
  return s)

foreign import _lookup :: forall a z. Fn4 z (a -> z) String (StrMap a) z

-- | Lookup the value for a key in a map
lookup :: forall a. String -> StrMap a -> Maybe a
lookup = runFn4 _lookup Nothing Just

-- | Test whether a `String` appears as a key in a map
member :: forall a. String -> StrMap a -> Boolean
member = runFn4 _lookup false (const true)

-- | Insert a key and value into a map
insert :: forall a. String -> a -> StrMap a -> StrMap a
insert k v = mutate (\s -> SM.poke s k v)

foreign import _unsafeDeleteStrMap :: forall a. Fn2 (StrMap a) String (StrMap a)

-- | Delete a key and value from a map
delete :: forall a. String -> StrMap a -> StrMap a
delete k = mutate (\s -> SM.delete s k)

-- | Insert, remove or update a value for a key in a map
alter :: forall a. (Maybe a -> Maybe a) -> String -> StrMap a -> StrMap a
alter f k m = case f (k `lookup` m) of
  Nothing -> delete k m
  Just v -> insert k v m

-- | Remove or update a value for a key in a map
update :: forall a. (a -> Maybe a) -> String -> StrMap a -> StrMap a
update f k m = alter (maybe Nothing f) k m

-- | Create a map from an array of key/value pairs
fromList :: forall a. L.List (Tuple String a) -> StrMap a
fromList l = pureST (do
  s <- SM.new
  for_ l (\(Tuple k v) -> SM.poke s k v)
  return s)

foreign import _lookupST :: forall a h r z. Fn4 z (a -> z) String (SM.STStrMap h a) (Eff (st :: ST.ST h | r) z)

-- | Create a map from an array of key/value pairs, using the specified function
-- | to combine values for duplicate keys.
fromListWith :: forall a. (a -> a -> a) -> L.List (Tuple String a) -> StrMap a
fromListWith f l = pureST (do
  s <- SM.new
  for_ l (\(Tuple k v) -> runFn4 _lookupST v (f v) k s >>= SM.poke s k)
  return s)

foreign import _collect :: forall a b . (String -> a -> b) -> StrMap a -> Array b

-- | Convert a map into an array of key/value pairs
toList :: forall a. StrMap a -> L.List (Tuple String a)
toList = L.toList <<< _collect Tuple

-- | Get an array of the keys in a map
foreign import keys :: forall a. StrMap a -> Array String

-- | Get an array of the values in a map
values :: forall a. StrMap a -> L.List a
values = L.toList <<< _collect (\_ v -> v)

-- | Compute the union of two maps, preferring the first map in the case of
-- | duplicate keys.
union :: forall a. StrMap a -> StrMap a -> StrMap a
union m = mutate (\s -> foldM SM.poke s m)

-- | Compute the union of a collection of maps
unions :: forall a. L.List (StrMap a) -> StrMap a
unions = foldl union empty

instance semigroupStrMap :: (Semigroup a) => Semigroup (StrMap a) where
  append m1 m2 = mutate (\s1 -> foldM (\s2 k v2 -> SM.poke s2 k (runFn4 _lookup v2 (\v1 -> v1 <> v2) k m2)) s1 m1) m2

instance monoidStrMap :: (Semigroup a) => Monoid (StrMap a) where
  mempty = empty
