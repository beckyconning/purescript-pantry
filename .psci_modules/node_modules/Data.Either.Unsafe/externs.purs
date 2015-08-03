module Data.Either.Unsafe (fromRight, fromLeft) where
import Prim ()
import Prelude ()
import Data.Either ()
--  | A partial function that extracts the value from the `Right` data constructor.
--  | Passing a `Left` to `fromRight` will throw an error at runtime.
--  | A partial function that extracts the value from the `Left` data constructor.
--  | Passing a `Right` to `fromLeft` will throw an error at runtime.
foreign import fromRight :: forall a b. Data.Either.Either a b -> b
foreign import fromLeft :: forall a b. Data.Either.Either a b -> a