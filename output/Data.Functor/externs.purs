module Data.Functor (($>), (<$)) where
import Prelude ()
import Prim ()
import Prelude ()
infixl 4 <$
infixl 4 $>
--  | Ignore the return value of a computation, using the specified return value instead.
--  | A version of `(<$)` with its arguments flipped.
foreign import ($>) :: forall f a b. (Prelude.Functor f) => f a -> b -> f b
foreign import (<$) :: forall f a b. (Prelude.Functor f) => a -> f b -> f a