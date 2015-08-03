module Signal.Channel (Chan(), Channel(), subscribe, send, channel) where
import Signal.Channel ()
import Signal ()
import Prim ()
import Control.Monad.Eff ()
import Prelude ()
import Signal ()
--  |Takes a channel and returns a signal of the values sent to it.
--  |Sends a value to a given channel.
--  |Creates a channel, which allows you to feed arbitrary values into a signal.
foreign import data Chan :: !
foreign import data Channel :: * -> *
foreign import subscribe :: forall a. Signal.Channel.Channel a -> Signal.Signal a
foreign import send :: forall a e. Signal.Channel.Channel a -> a -> Control.Monad.Eff.Eff (chan :: Signal.Channel.Chan | e) Prelude.Unit
foreign import channel :: forall a e. a -> Control.Monad.Eff.Eff (chan :: Signal.Channel.Chan | e) (Signal.Channel.Channel a)