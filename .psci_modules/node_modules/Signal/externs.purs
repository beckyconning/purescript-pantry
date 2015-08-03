module Signal (Signal(), (~), (~>), (<~), filterMap, filter, unwrap, runSignal, dropRepeats', dropRepeats, sampleOn, foldp, mergeMany, merge, constant) where
import Signal ()
import Data.Foldable ()
import Prelude ()
import Data.Maybe ()
import Prim ()
import Control.Monad.Eff ()
import Prelude ()
import Data.Foldable ()
import Data.Maybe ()
infixl 4 <~
infixl 4 ~>
infixl 4 ~
--  |Creates a signal with a constant value.
--  |Given a signal of effects with no return value, run each effect as it
--  |comes in.
--  |Takes a signal of effects of `a`, and produces an effect which returns a
--  |signal which will take each effect produced by the input signal, run it,
--  |and yield its returned value.
--  |Creates a signal which yields the current value of the second signal every
--  |time the first signal yields.
--  |Merge two signals, returning a new signal which will yield a value
--  |whenever either of the input signals yield. Its initial value will be
--  |that of the first signal.
--  |Merge all signals inside a `Foldable`, returning a `Maybe` which will
--  |either contain the resulting signal, or `Nothing` if the `Foldable`
--  |was empty.
--  |Creates a past dependent signal. The function argument takes the value of
--  |the input signal, and the previous value of the output signal, to produce
--  |the new value of the output signal.
--  |Takes a signal and filters out yielded values for which the provided
--  |predicate function returns `false`.
--  |Map a signal over a function which returns a `Maybe`, yielding only the
--  |values inside `Just`s, dropping the `Nothing`s.
--  |Create a signal which only yields values which aren't equal to the previous
--  |value of the input signal, using JavaScript's `!==` operator to determine
--  |disequality.
--  |Create a signal which only yields values which aren't equal to the previous
--  |value of the input signal.
foreign import data Signal :: * -> *
foreign import (~) :: forall f a b. (Prelude.Apply f) => f (a -> b) -> f a -> f b
foreign import (~>) :: forall f a b. (Prelude.Functor f) => f a -> (a -> b) -> f b
foreign import (<~) :: forall f a b. (Prelude.Functor f) => (a -> b) -> f a -> f b
foreign import filterMap :: forall a b. (a -> Data.Maybe.Maybe b) -> b -> Signal.Signal a -> Signal.Signal b
foreign import filter :: forall a. (a -> Prim.Boolean) -> a -> Signal.Signal a -> Signal.Signal a
foreign import unwrap :: forall a e. Signal.Signal (Control.Monad.Eff.Eff e a) -> Control.Monad.Eff.Eff e (Signal.Signal a)
foreign import runSignal :: forall e. Signal.Signal (Control.Monad.Eff.Eff e Prelude.Unit) -> Control.Monad.Eff.Eff e Prelude.Unit
foreign import dropRepeats' :: forall a. Signal.Signal a -> Signal.Signal a
foreign import dropRepeats :: forall a. (Prelude.Eq a) => Signal.Signal a -> Signal.Signal a
foreign import sampleOn :: forall a b. Signal.Signal a -> Signal.Signal b -> Signal.Signal b
foreign import foldp :: forall a b. (a -> b -> b) -> b -> Signal.Signal a -> Signal.Signal b
foreign import mergeMany :: forall f a. (Prelude.Functor f, Data.Foldable.Foldable f) => f (Signal.Signal a) -> Data.Maybe.Maybe (Signal.Signal a)
foreign import merge :: forall a. Signal.Signal a -> Signal.Signal a -> Signal.Signal a
foreign import constant :: forall a. a -> Signal.Signal a
foreign import instance functorSignal :: Prelude.Functor Signal.Signal
foreign import instance applySignal :: Prelude.Apply Signal.Signal
foreign import instance applicativeSignal :: Prelude.Applicative Signal.Signal
foreign import instance semigroupSignal :: Prelude.Semigroup (Signal.Signal a)