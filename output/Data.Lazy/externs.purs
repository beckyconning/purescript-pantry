module Data.Lazy (Lazy(), force, defer) where
import Data.Lazy ()
import Prelude ()
import Data.Monoid ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Extend ()
import Data.Monoid ()
import Control.Lazy ()
--  | `Lazy a` represents lazily-computed values of type `a`.
--  |
--  | A lazy value is computed at most once - the result is saved
--  | after the first computation, and subsequent attempts to read
--  | the value simply return the saved value.
--  |
--  | `Lazy` values can be created with `defer`, or by using the provided
--  | type class instances.
--  |
--  | `Lazy` values can be evaluated by using the `force` function.
--  | Defer a computation, creating a `Lazy` value.
--  | Force evaluation of a `Lazy` value.
foreign import data Lazy :: * -> *
foreign import force :: forall a. Data.Lazy.Lazy a -> a
foreign import defer :: forall a. (Prelude.Unit -> a) -> Data.Lazy.Lazy a
foreign import instance semiringLazy :: (Prelude.Semiring a) => Prelude.Semiring (Data.Lazy.Lazy a)
foreign import instance ringLazy :: (Prelude.Ring a) => Prelude.Ring (Data.Lazy.Lazy a)
foreign import instance moduloSemiringLazy :: (Prelude.ModuloSemiring a) => Prelude.ModuloSemiring (Data.Lazy.Lazy a)
foreign import instance divisionRingLazy :: (Prelude.DivisionRing a) => Prelude.DivisionRing (Data.Lazy.Lazy a)
foreign import instance numLazy :: (Prelude.Num a) => Prelude.Num (Data.Lazy.Lazy a)
foreign import instance eqLazy :: (Prelude.Eq a) => Prelude.Eq (Data.Lazy.Lazy a)
foreign import instance ordLazy :: (Prelude.Ord a) => Prelude.Ord (Data.Lazy.Lazy a)
foreign import instance boundedLazy :: (Prelude.Bounded a) => Prelude.Bounded (Data.Lazy.Lazy a)
foreign import instance boundedOrdLazy :: (Prelude.BoundedOrd a) => Prelude.BoundedOrd (Data.Lazy.Lazy a)
foreign import instance semigroupLazy :: (Prelude.Semigroup a) => Prelude.Semigroup (Data.Lazy.Lazy a)
foreign import instance monoidLazy :: (Data.Monoid.Monoid a) => Data.Monoid.Monoid (Data.Lazy.Lazy a)
foreign import instance booleanAlgebraLazy :: (Prelude.BooleanAlgebra a) => Prelude.BooleanAlgebra (Data.Lazy.Lazy a)
foreign import instance functorLazy :: Prelude.Functor Data.Lazy.Lazy
foreign import instance applyLazy :: Prelude.Apply Data.Lazy.Lazy
foreign import instance applicativeLazy :: Prelude.Applicative Data.Lazy.Lazy
foreign import instance bindLazy :: Prelude.Bind Data.Lazy.Lazy
foreign import instance monadLazy :: Prelude.Monad Data.Lazy.Lazy
foreign import instance extendLazy :: Control.Extend.Extend Data.Lazy.Lazy
foreign import instance comonadLazy :: Control.Comonad.Comonad Data.Lazy.Lazy
foreign import instance showLazy :: (Prelude.Show a) => Prelude.Show (Data.Lazy.Lazy a)
foreign import instance lazyLazy :: Control.Lazy.Lazy (Data.Lazy.Lazy a)