module Data.Tuple.Nested (Tuple10(), Tuple9(), Tuple8(), Tuple7(), Tuple6(), Tuple5(), Tuple4(), Tuple3(), Tuple2(), (/\), curry10, uncurry10, curry9, uncurry9, curry8, uncurry8, curry7, uncurry7, curry6, uncurry6, curry5, uncurry5, curry4, uncurry4, curry3, uncurry3, curry2, uncurry2, tuple10, tuple9, tuple8, tuple7, tuple6, tuple5, tuple4, tuple3, tuple2) where
import Prim ()
import Prelude ()
import Data.Tuple ()
infixl 6 /\
--  | Shorthand for constructing n-tuples as nested pairs.
--  | `a /\ b /\ c /\ d` becomes `Tuple (Tuple (Tuple a b) c ) d`
--  | Given a function of 9 arguments, return a function that accepts a 9-tuple.
--  | Given a function of 8 arguments, return a function that accepts a 8-tuple.
--  | Given a function of 7 arguments, return a function that accepts a 7-tuple.
--  | Given a function of 6 arguments, return a function that accepts a 6-tuple.
--  | Given a function of 5 arguments, return a function that accepts a 5-tuple.
--  | Given a function of 4 arguments, return a function that accepts a 4-tuple.
--  | Given a function of 3 arguments, return a function that accepts a 3-tuple.
--  | Given a function of 2 arguments, return a function that accepts a 2-tuple.
--  | Given a function of 10 arguments, return a function that accepts a 10-tuple.
--  | Given 9 values, creates a nested 9-tuple.
--  | Given 8 values, creates a nested 8-tuple.
--  | Given 7 values, creates a nested 7-tuple.
--  | Given 6 values, creates a nested 6-tuple.
--  | Given 5 values, creates a nested 5-tuple.
--  | Given 4 values, creates a nested 4-tuple.
--  | Given 3 values, creates a nested 3-tuple.
--  | Given 2 values, creates a nested 2-tuple.
--  | Given 10 values, creates a nested 10-tuple.
--  | Given a function that accepts a 9-tuple, return a function of 9 arguments.
--  | Given a function that accepts a 8-tuple, return a function of 8 arguments.
--  | Given a function that accepts a 7-tuple, return a function of 7 arguments.
--  | Given a function that accepts a 6-tuple, return a function of 6 arguments.
--  | Given a function that accepts a 5-tuple, return a function of 5 arguments.
--  | Given a function that accepts a 4-tuple, return a function of 4 arguments.
--  | Given a function that accepts a 3-tuple, return a function of 3 arguments.
--  | Given a function that accepts a 2-tuple, return a function of 2 arguments.
--  | Given a function that accepts a 10-tuple, return a function of 10 arguments.
type Tuple10 (a :: *) (b :: *) (c :: *) (d :: *) (e :: *) (f :: *) (g :: *) (h :: *) (i :: *) (z :: *) = Data.Tuple.Tuple (Data.Tuple.Nested.Tuple9 a b c d e f g h i) z
type Tuple9 (a :: *) (b :: *) (c :: *) (d :: *) (e :: *) (f :: *) (g :: *) (h :: *) (z :: *) = Data.Tuple.Tuple (Data.Tuple.Nested.Tuple8 a b c d e f g h) z
type Tuple8 (a :: *) (b :: *) (c :: *) (d :: *) (e :: *) (f :: *) (g :: *) (z :: *) = Data.Tuple.Tuple (Data.Tuple.Nested.Tuple7 a b c d e f g) z
type Tuple7 (a :: *) (b :: *) (c :: *) (d :: *) (e :: *) (f :: *) (z :: *) = Data.Tuple.Tuple (Data.Tuple.Nested.Tuple6 a b c d e f) z
type Tuple6 (a :: *) (b :: *) (c :: *) (d :: *) (e :: *) (z :: *) = Data.Tuple.Tuple (Data.Tuple.Nested.Tuple5 a b c d e) z
type Tuple5 (a :: *) (b :: *) (c :: *) (d :: *) (z :: *) = Data.Tuple.Tuple (Data.Tuple.Nested.Tuple4 a b c d) z
type Tuple4 (a :: *) (b :: *) (c :: *) (z :: *) = Data.Tuple.Tuple (Data.Tuple.Nested.Tuple3 a b c) z
type Tuple3 (a :: *) (b :: *) (z :: *) = Data.Tuple.Tuple (Data.Tuple.Nested.Tuple2 a b) z
type Tuple2 (a :: *) (z :: *) = Data.Tuple.Tuple a z
foreign import (/\) :: forall a b. a -> b -> Data.Tuple.Tuple a b
foreign import curry10 :: forall a b c d e f g h i j z. (Data.Tuple.Nested.Tuple10 a b c d e f g h i j -> z) -> a -> b -> c -> d -> e -> f -> g -> h -> i -> j -> z
foreign import uncurry10 :: forall a b c d e f g h i j z. (a -> b -> c -> d -> e -> f -> g -> h -> i -> j -> z) -> Data.Tuple.Nested.Tuple10 a b c d e f g h i j -> z
foreign import curry9 :: forall a b c d e f g h i z. (Data.Tuple.Nested.Tuple9 a b c d e f g h i -> z) -> a -> b -> c -> d -> e -> f -> g -> h -> i -> z
foreign import uncurry9 :: forall a b c d e f g h i z. (a -> b -> c -> d -> e -> f -> g -> h -> i -> z) -> Data.Tuple.Nested.Tuple9 a b c d e f g h i -> z
foreign import curry8 :: forall a b c d e f g h z. (Data.Tuple.Nested.Tuple8 a b c d e f g h -> z) -> a -> b -> c -> d -> e -> f -> g -> h -> z
foreign import uncurry8 :: forall a b c d e f g h z. (a -> b -> c -> d -> e -> f -> g -> h -> z) -> Data.Tuple.Nested.Tuple8 a b c d e f g h -> z
foreign import curry7 :: forall a b c d e f g z. (Data.Tuple.Nested.Tuple7 a b c d e f g -> z) -> a -> b -> c -> d -> e -> f -> g -> z
foreign import uncurry7 :: forall a b c d e f g z. (a -> b -> c -> d -> e -> f -> g -> z) -> Data.Tuple.Nested.Tuple7 a b c d e f g -> z
foreign import curry6 :: forall a b c d e f z. (Data.Tuple.Nested.Tuple6 a b c d e f -> z) -> a -> b -> c -> d -> e -> f -> z
foreign import uncurry6 :: forall a b c d e f z. (a -> b -> c -> d -> e -> f -> z) -> Data.Tuple.Nested.Tuple6 a b c d e f -> z
foreign import curry5 :: forall a b c d e z. (Data.Tuple.Nested.Tuple5 a b c d e -> z) -> a -> b -> c -> d -> e -> z
foreign import uncurry5 :: forall a b c d e z. (a -> b -> c -> d -> e -> z) -> Data.Tuple.Nested.Tuple5 a b c d e -> z
foreign import curry4 :: forall a b c d z. (Data.Tuple.Nested.Tuple4 a b c d -> z) -> a -> b -> c -> d -> z
foreign import uncurry4 :: forall a b c d z. (a -> b -> c -> d -> z) -> Data.Tuple.Nested.Tuple4 a b c d -> z
foreign import curry3 :: forall a b c z. (Data.Tuple.Nested.Tuple3 a b c -> z) -> a -> b -> c -> z
foreign import uncurry3 :: forall a b c z. (a -> b -> c -> z) -> Data.Tuple.Nested.Tuple3 a b c -> z
foreign import curry2 :: forall a b z. (Data.Tuple.Nested.Tuple2 a b -> z) -> a -> b -> z
foreign import uncurry2 :: forall a b z. (a -> b -> z) -> Data.Tuple.Nested.Tuple2 a b -> z
foreign import tuple10 :: forall a b c d e f g h i j. a -> b -> c -> d -> e -> f -> g -> h -> i -> j -> Data.Tuple.Nested.Tuple10 a b c d e f g h i j
foreign import tuple9 :: forall a b c d e f g h i. a -> b -> c -> d -> e -> f -> g -> h -> i -> Data.Tuple.Nested.Tuple9 a b c d e f g h i
foreign import tuple8 :: forall a b c d e f g h. a -> b -> c -> d -> e -> f -> g -> h -> Data.Tuple.Nested.Tuple8 a b c d e f g h
foreign import tuple7 :: forall a b c d e f g. a -> b -> c -> d -> e -> f -> g -> Data.Tuple.Nested.Tuple7 a b c d e f g
foreign import tuple6 :: forall a b c d e f. a -> b -> c -> d -> e -> f -> Data.Tuple.Nested.Tuple6 a b c d e f
foreign import tuple5 :: forall a b c d e. a -> b -> c -> d -> e -> Data.Tuple.Nested.Tuple5 a b c d e
foreign import tuple4 :: forall a b c d. a -> b -> c -> d -> Data.Tuple.Nested.Tuple4 a b c d
foreign import tuple3 :: forall a b c. a -> b -> c -> Data.Tuple.Nested.Tuple3 a b c
foreign import tuple2 :: forall a b. a -> b -> Data.Tuple.Nested.Tuple2 a b