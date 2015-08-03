module Control.Alt (Alt, (<|>), alt) where
import Control.Alt ()
import Prelude ()
import Prim ()
import Prelude ()
--  | The `Alt` type class identifies an associative operation on a type
--  | constructor.  It is similar to `Semigroup`, except that it applies to
--  | types of kind `* -> *`, like `Array` or `List`, rather than concrete types
--  | `String` or `Number`.
--  |
--  | `Alt` instances are required to satisfy the following laws:
--  |
--  | - Associativity: `(x <|> y) <|> z == x <|> (y <|> z)`
--  | - Distributivity: `f <$> (x <|> y) == (f <$> x) <|> (f <$> y)`
--  |
--  | For example, the `Array` (`[]`) type is an instance of `Alt`, where
--  | `(<|>)` is defined to be concatenation.
--  | The `Alt` type class identifies an associative operation on a type
--  | constructor.  It is similar to `Semigroup`, except that it applies to
--  | types of kind `* -> *`, like `Array` or `List`, rather than concrete types
--  | `String` or `Number`.
--  |
--  | `Alt` instances are required to satisfy the following laws:
--  |
--  | - Associativity: `(x <|> y) <|> z == x <|> (y <|> z)`
--  | - Distributivity: `f <$> (x <|> y) == (f <$> x) <|> (f <$> y)`
--  |
--  | For example, the `Array` (`[]`) type is an instance of `Alt`, where
--  | `(<|>)` is defined to be concatenation.
infixl 3 <|>
--  | The `Alt` type class identifies an associative operation on a type
--  | constructor.  It is similar to `Semigroup`, except that it applies to
--  | types of kind `* -> *`, like `Array` or `List`, rather than concrete types
--  | `String` or `Number`.
--  |
--  | `Alt` instances are required to satisfy the following laws:
--  |
--  | - Associativity: `(x <|> y) <|> z == x <|> (y <|> z)`
--  | - Distributivity: `f <$> (x <|> y) == (f <$> x) <|> (f <$> y)`
--  |
--  | For example, the `Array` (`[]`) type is an instance of `Alt`, where
--  | `(<|>)` is defined to be concatenation.
--  | An infix version of `alt`.
class (Prelude.Functor f) <= Alt f where
  alt :: forall a. f a -> f a -> f a
foreign import (<|>) :: forall f a. (Control.Alt.Alt f) => f a -> f a -> f a
foreign import instance altArray :: Control.Alt.Alt Prim.Array