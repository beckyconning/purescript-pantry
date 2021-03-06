module Control.Extend (Extend, duplicate, (=<=), (=>=), (=>>), (<<=), extend) where
import Prelude ()
import Control.Extend ()
import Prim ()
import Prelude ()
--  | The `Extend` class defines the extension operator `(<<=)`
--  | which extends a local context-dependent computation to
--  | a global computation.
--  |
--  | `Extend` is the dual of `Bind`, and `(<<=)` is the dual of
--  | `(>>=)`.
--  |
--  | Laws:
--  |
--  | - Associativity: `extend f <<< extend g = extend (f <<< extend g)`
--  | The `Extend` class defines the extension operator `(<<=)`
--  | which extends a local context-dependent computation to
--  | a global computation.
--  |
--  | `Extend` is the dual of `Bind`, and `(<<=)` is the dual of
--  | `(>>=)`.
--  |
--  | Laws:
--  |
--  | - Associativity: `extend f <<< extend g = extend (f <<< extend g)`
infixl 1 =>>
infixr 1 <<=
infixr 1 =>=
infixr 1 =<=
--  | The `Extend` class defines the extension operator `(<<=)`
--  | which extends a local context-dependent computation to
--  | a global computation.
--  |
--  | `Extend` is the dual of `Bind`, and `(<<=)` is the dual of
--  | `(>>=)`.
--  |
--  | Laws:
--  |
--  | - Associativity: `extend f <<< extend g = extend (f <<< extend g)`
--  | An infix version of `extend`
--  | Backwards co-Kleisli composition.
--  | Forwards co-Kleisli composition.
--  | A version of `(<<=)` with its arguments flipped.
--  | Duplicate a comonadic context.
--  |
--  | `duplicate` is dual to `Control.Bind.join`.
class (Prelude.Functor w) <= Extend w where
  extend :: forall b a. (w a -> b) -> w a -> w b
foreign import duplicate :: forall a w. (Control.Extend.Extend w) => w a -> w (w a)
foreign import (=<=) :: forall b a w c. (Control.Extend.Extend w) => (w b -> c) -> (w a -> b) -> w a -> c
foreign import (=>=) :: forall b a w c. (Control.Extend.Extend w) => (w a -> b) -> (w b -> c) -> w a -> c
foreign import (=>>) :: forall b a w. (Control.Extend.Extend w) => w a -> (w a -> b) -> w b
foreign import (<<=) :: forall w a b. (Control.Extend.Extend w) => (w a -> b) -> w a -> w b
foreign import instance extendFn :: (Prelude.Semigroup w) => Control.Extend.Extend (Prim.Function w)