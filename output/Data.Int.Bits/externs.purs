module Data.Int.Bits (complement, zshr, shr, shl, (.^.), (.|.), (.&.)) where
import Data.Int.Bits ()
import Prim ()
infixl 10 .&.
infixl 10 .|.
infixl 10 .^.
--  | Bitwise shift left.
--  | Bitwise shift right.
--  | Bitwise zero-fill shift right.
--  | Bitwise NOT.
--  | Bitwise OR.
--  | Bitwise XOR.
--  | Bitwise AND.
foreign import complement :: Prim.Int -> Prim.Int
foreign import zshr :: Prim.Int -> Prim.Int -> Prim.Int
foreign import shr :: Prim.Int -> Prim.Int -> Prim.Int
foreign import shl :: Prim.Int -> Prim.Int -> Prim.Int
foreign import (.^.) :: Prim.Int -> Prim.Int -> Prim.Int
foreign import (.|.) :: Prim.Int -> Prim.Int -> Prim.Int
foreign import (.&.) :: Prim.Int -> Prim.Int -> Prim.Int