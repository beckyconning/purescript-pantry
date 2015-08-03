module Test.Signal (unsafeFromArray) where

import Data.Function
import Signal

foreign import tickP :: forall a c. Fn4 (c -> Signal c) Int Int (Array a) (Signal a)

unsafeFromArray :: forall a. Array a -> Signal a
unsafeFromArray = runFn4 tickP constant 1 1
