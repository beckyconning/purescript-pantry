module Signal.Time (Time(), second, now, millisecond, since, delay, every) where
import Signal.Time ()
import Signal ()
import Prim ()
import Control.Monad.Eff ()
import Control.Timer ()
import Signal ()
--  |Returns the number of milliseconds since an arbitrary, but constant, time
--  |in the past.
--  |Takes a signal and a time value, and creates a signal which yields `True`
--  |when the input signal yields, then goes back to `False` after the given
--  |number of milliseconds have elapsed, unless the input signal yields again
--  |in the interim.
--  |Creates a signal which yields the current time (according to `now`) every
--  |given number of milliseconds.
--  |Takes a signal and delays its yielded values by a given number of
--  |milliseconds.
type Time = Prim.Number
foreign import second :: Signal.Time.Time
foreign import now :: forall e. Control.Monad.Eff.Eff (timer :: Control.Timer.Timer | e) Signal.Time.Time
foreign import millisecond :: Signal.Time.Time
foreign import since :: forall a. Signal.Time.Time -> Signal.Signal a -> Signal.Signal Prim.Boolean
foreign import delay :: forall a. Signal.Time.Time -> Signal.Signal a -> Signal.Signal a
foreign import every :: Signal.Time.Time -> Signal.Signal Signal.Time.Time