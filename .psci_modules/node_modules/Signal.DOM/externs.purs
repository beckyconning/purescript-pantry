module Signal.DOM (Touch(), DimensionPair(), CoordinatePair(), windowDimensions, mousePos, tap, touch, mouseButton, keyPressed, animationFrame) where
import Signal.DOM ()
import Signal ()
import Prelude ()
import Signal.Time ()
import Prim ()
import Control.Monad.Eff ()
import Control.Timer ()
import DOM ()
import Prelude ()
import Signal ()
import Signal.Time ()
--  |A signal which contains the document window's current width and height.
--  |A signal containing the current state of the touch device, as described by
--  |the `Touch` record type.
--  |A signal which will be `true` when at least one finger is touching the
--  |touch device, and `false` otherwise.
--  |A signal containing the current mouse position.
--  |Creates a signal which will be `true` when the given mouse button is
--  |pressed, and `false` when it's released.
--  |Creates a signal which will be `true` when the key matching the given key
--  |code is pressed, and `false` when it's released.
--  |A signal which yields the current time, as determined by `now`, on every
--  |animation frame (see [https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame]).
type Touch = { force :: Prim.Number, rotationAngle :: Prim.Number, radiusY :: Prim.Int, radiusX :: Prim.Int, pageY :: Prim.Int, pageX :: Prim.Int, clientY :: Prim.Int, clientX :: Prim.Int, screenY :: Prim.Int, screenX :: Prim.Int, id :: Prim.String }
type DimensionPair = { h :: Prim.Int, w :: Prim.Int }
type CoordinatePair = { y :: Prim.Int, x :: Prim.Int }
foreign import windowDimensions :: forall e. Control.Monad.Eff.Eff (dom :: DOM.DOM | e) (Signal.Signal Signal.DOM.DimensionPair)
foreign import mousePos :: forall e. Control.Monad.Eff.Eff (dom :: DOM.DOM | e) (Signal.Signal Signal.DOM.CoordinatePair)
foreign import tap :: forall e. Control.Monad.Eff.Eff (dom :: DOM.DOM | e) (Signal.Signal Prim.Boolean)
foreign import touch :: forall e. Control.Monad.Eff.Eff (dom :: DOM.DOM | e) (Signal.Signal (Prim.Array Signal.DOM.Touch))
foreign import mouseButton :: forall e. Prim.Int -> Control.Monad.Eff.Eff (dom :: DOM.DOM | e) (Signal.Signal Prim.Boolean)
foreign import keyPressed :: forall e. Prim.Int -> Control.Monad.Eff.Eff (dom :: DOM.DOM | e) (Signal.Signal Prim.Boolean)
foreign import animationFrame :: forall e. Control.Monad.Eff.Eff (timer :: Control.Timer.Timer, dom :: DOM.DOM | e) (Signal.Signal Signal.Time.Time)