module Data.Functor.Invariant (Invariant, imapF, imap) where
import Prelude ()
import Data.Functor.Invariant ()
import Prim ()
import Prelude ()
--  | A type of functor that can be used to adapt the type of a wrapped function
--  | where the parameterised type occurs in both the positive and negative
--  | position, for example, `F (a -> a)`.
--  |
--  | An `Invariant` instance should satisfy the following laws:
--  |
--  | - Identity: `imap id id = id`
--  | - Composition: `imap g1 g2 <<< imap f1 f2 = imap (g1 <<< f1) (f2 <<< g2)`
--  |
--  | A type of functor that can be used to adapt the type of a wrapped function
--  | where the parameterised type occurs in both the positive and negative
--  | position, for example, `F (a -> a)`.
--  |
--  | An `Invariant` instance should satisfy the following laws:
--  |
--  | - Identity: `imap id id = id`
--  | - Composition: `imap g1 g2 <<< imap f1 f2 = imap (g1 <<< f1) (f2 <<< g2)`
--  |
--  | As all `Functor`s are also trivially `Invariant`, this function can be
--  | used as the `imap` implementation for all `Invariant` instances for
--  | `Functors`.
--  | A type of functor that can be used to adapt the type of a wrapped function
--  | where the parameterised type occurs in both the positive and negative
--  | position, for example, `F (a -> a)`.
--  |
--  | An `Invariant` instance should satisfy the following laws:
--  |
--  | - Identity: `imap id id = id`
--  | - Composition: `imap g1 g2 <<< imap f1 f2 = imap (g1 <<< f1) (f2 <<< g2)`
--  |
class Invariant f where
  imap :: forall a b. (a -> b) -> (b -> a) -> f a -> f b
foreign import imapF :: forall f a b. (Prelude.Functor f) => (a -> b) -> (b -> a) -> f a -> f b
foreign import instance invariantFn :: Data.Functor.Invariant.Invariant (Prim.Function a)
foreign import instance invariantArray :: Data.Functor.Invariant.Invariant Prim.Array