module Data.Maybe.Unsafe (fromJust) where
import Prim ()
import Prelude ()
import Data.Maybe ()
--  | A partial function that extracts the value from the `Just` data
--  | constructor. Passing `Nothing` to `fromJust` will throw an error at
--  | runtime.
foreign import fromJust :: forall a. Data.Maybe.Maybe a -> a