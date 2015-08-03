module Control.Comonad.Traced.Class (ComonadTraced, censor, listens, listen, tracks, track) where
import Control.Comonad.Traced.Class ()
import Prelude ()
import Control.Comonad ()
import Control.Comonad.Traced.Trans ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Comonad.Traced.Trans ()
import Data.Monoid ()
import Data.Tuple ()
--  | The `ComonadTraced` type class represents those monads which support relative (monoidal)
--  | position information via `track`.
--  |
--  | - `track` extracts a value at the specified relative position.
--  |
--  | An implementation is provided for `TracedT`.
--  |
--  | Laws:
--  |
--  | - `track mempty = extract`
--  | - `track s <<= track t x = track (s <> t) x`
--  |
--  | For example:
--  |
--  | ```purescript
--  | blur :: forall w. (ComonadTraced (Additive Number) w) -> w Number -> w Number
--  | blur = extend \r -> (track (Additive (-1)) r + track (Additive 1) r) / 2
--  | ```
--  | The `ComonadTraced` type class represents those monads which support relative (monoidal)
--  | position information via `track`.
--  |
--  | - `track` extracts a value at the specified relative position.
--  |
--  | An implementation is provided for `TracedT`.
--  |
--  | Laws:
--  |
--  | - `track mempty = extract`
--  | - `track s <<= track t x = track (s <> t) x`
--  |
--  | For example:
--  |
--  | ```purescript
--  | blur :: forall w. (ComonadTraced (Additive Number) w) -> w Number -> w Number
--  | blur = extend \r -> (track (Additive (-1)) r + track (Additive 1) r) / 2
--  | ```
--  | The `ComonadTraced` type class represents those monads which support relative (monoidal)
--  | position information via `track`.
--  |
--  | - `track` extracts a value at the specified relative position.
--  |
--  | An implementation is provided for `TracedT`.
--  |
--  | Laws:
--  |
--  | - `track mempty = extract`
--  | - `track s <<= track t x = track (s <> t) x`
--  |
--  | For example:
--  |
--  | ```purescript
--  | blur :: forall w. (ComonadTraced (Additive Number) w) -> w Number -> w Number
--  | blur = extend \r -> (track (Additive (-1)) r + track (Additive 1) r) / 2
--  | ```
--  | Extracts a value at a relative position which depends on the current value.
--  | Get a value which depends on the current position.
--  | Get the current position.
--  | Apply a function to the current position.
class (Control.Comonad.Comonad w) <= ComonadTraced t w where
  track :: forall a. t -> w a -> a
foreign import censor :: forall w a t b. (Prelude.Functor w) => (t -> t) -> Control.Comonad.Traced.Trans.TracedT t w a -> Control.Comonad.Traced.Trans.TracedT t w a
foreign import listens :: forall w a t b. (Prelude.Functor w) => (t -> b) -> Control.Comonad.Traced.Trans.TracedT t w a -> Control.Comonad.Traced.Trans.TracedT t w (Data.Tuple.Tuple a b)
foreign import listen :: forall w a t. (Prelude.Functor w) => Control.Comonad.Traced.Trans.TracedT t w a -> Control.Comonad.Traced.Trans.TracedT t w (Data.Tuple.Tuple a t)
foreign import tracks :: forall w a t. (Control.Comonad.Comonad w, Control.Comonad.Traced.Class.ComonadTraced t w) => (a -> t) -> w a -> a
foreign import instance comonadTracedTracedT :: (Control.Comonad.Comonad w, Data.Monoid.Monoid t) => Control.Comonad.Traced.Class.ComonadTraced t (Control.Comonad.Traced.Trans.TracedT t w)