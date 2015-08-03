module Data.StrMap.Unsafe (unsafeIndex) where
import Prim ()
import Prelude ()
import Data.StrMap ()
--  | Unsafely get the value for a key in a map.
--  |
--  | This function does not check whether the key exists in the map.
foreign import unsafeIndex :: forall a. Data.StrMap.StrMap a -> Prim.String -> a