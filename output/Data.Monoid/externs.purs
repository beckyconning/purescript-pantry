module Data.Monoid (Monoid, mempty) where
import Prelude ()
import Data.Monoid ()
import Prim ()
import Prelude ()
--  | A `Monoid` is a `Semigroup` with a value `mempty`, which is both a
--  | left and right unit for the associative operation `<>`:
--  |
--  | ```text
--  | forall x. mempty <> x = x <> mempty = x
--  | ```
--  |
--  | `Monoid`s are commonly used as the result of fold operations, where
--  | `<>` is used to combine individual results, and `mempty` gives the result
--  | of folding an empty collection of elements.
--  | A `Monoid` is a `Semigroup` with a value `mempty`, which is both a
--  | left and right unit for the associative operation `<>`:
--  |
--  | ```text
--  | forall x. mempty <> x = x <> mempty = x
--  | ```
--  |
--  | `Monoid`s are commonly used as the result of fold operations, where
--  | `<>` is used to combine individual results, and `mempty` gives the result
--  | of folding an empty collection of elements.
--  | A `Monoid` is a `Semigroup` with a value `mempty`, which is both a
--  | left and right unit for the associative operation `<>`:
--  |
--  | ```text
--  | forall x. mempty <> x = x <> mempty = x
--  | ```
--  |
--  | `Monoid`s are commonly used as the result of fold operations, where
--  | `<>` is used to combine individual results, and `mempty` gives the result
--  | of folding an empty collection of elements.
class (Prelude.Semigroup m) <= Monoid m where
  mempty :: m
foreign import instance monoidUnit :: Data.Monoid.Monoid Prelude.Unit
foreign import instance monoidFn :: (Data.Monoid.Monoid b) => Data.Monoid.Monoid (a -> b)
foreign import instance monoidString :: Data.Monoid.Monoid Prim.String
foreign import instance monoidArray :: Data.Monoid.Monoid (Prim.Array a)