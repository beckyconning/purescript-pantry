module Data.StrMap.ST (STStrMap(), delete, poke, peek, new) where
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Control.Monad.ST ()
--  | A reference to a mutable map
--  |
--  | The first type parameter represents the memory region which the map belongs to. The second type parameter defines the type of elements of the mutable array.
--  |
--  | The runtime representation of a value of type `STStrMap h a` is the same as that of `StrMap a`, except that mutation is allowed.
--  | Create a new, empty mutable map
--  | Get the value for a key in a mutable map
--  | Update the value for a key in a mutable map
--  | Remove a key and the corresponding value from a mutable map
foreign import data STStrMap :: * -> * -> *
foreign import delete :: forall a h r. Data.StrMap.ST.STStrMap h a -> Prim.String -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) (Data.StrMap.ST.STStrMap h a)
foreign import poke :: forall a h r. Data.StrMap.ST.STStrMap h a -> Prim.String -> a -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) (Data.StrMap.ST.STStrMap h a)
foreign import peek :: forall a h r. Data.StrMap.ST.STStrMap h a -> Prim.String -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) a
foreign import new :: forall a h r. Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) (Data.StrMap.ST.STStrMap h a)