module Data.StrMap.ST.Unsafe (unsafeGet) where
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Control.Monad.ST ()
import Data.StrMap ()
import Data.StrMap.ST ()
--  | Unsafely get the value for a key in a map.
--  |
--  | This function does not check whether the key exists in the map.
foreign import unsafeGet :: forall a h r. Data.StrMap.ST.STStrMap h a -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) (Data.StrMap.StrMap a)