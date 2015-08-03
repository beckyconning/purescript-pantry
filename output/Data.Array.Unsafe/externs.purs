module Data.Array.Unsafe (init, last, tail, head, unsafeIndex) where
import Data.Array.Unsafe ()
import Data.Array ()
import Prelude ()
import Prim ()
import Prelude ()
import Data.Array ()
--  | Find the element of an array at the specified index.
--  |
--  | Note: this function can cause unpredictable failure at runtime if the index is out-of-bounds.
--  | Get all but the first element of a non-empty array.
--  |
--  | Running time: `O(n)`, where `n` is the length of the array.
--  | Get the last element of a non-empty array.
--  |
--  | Running time: `O(1)`.
--  | Get all but the last element of a non-empty array.
--  |
--  | Running time: `O(n)`, where `n` is the length of the array.
--  | Get the first element of a non-empty array.
--  |
--  | Running time: `O(1)`.
foreign import init :: forall a. Prim.Array a -> Prim.Array a
foreign import last :: forall a. Prim.Array a -> a
foreign import tail :: forall a. Prim.Array a -> Prim.Array a
foreign import head :: forall a. Prim.Array a -> a
foreign import unsafeIndex :: forall a. Prim.Array a -> Prim.Int -> a