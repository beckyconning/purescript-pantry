module Data.List.Unsafe (init, last, tail, head) where
import Data.List.Unsafe ()
import Prim ()
import Prelude ()
import Data.List ()
--  | Get all but the first element of a non-empty list.
--  |
--  | Running time: `O(1)`
--  | Get the first element of a non-empty list.
--  |
--  | Running time: `O(1)`.
foreign import init :: forall a. Data.List.List a -> Data.List.List a
foreign import last :: forall a. Data.List.List a -> a
foreign import tail :: forall a. Data.List.List a -> Data.List.List a
foreign import head :: forall a. Data.List.List a -> a