module Control.Monad.Writer (Writer(), mapWriter, execWriter, runWriter) where
import Prelude ()
import Data.Identity ()
import Control.Monad.Writer.Trans ()
import Data.Tuple ()
import Control.Monad.Writer ()
import Prim ()
import Prelude ()
import Control.Monad.Writer.Trans ()
import Data.Identity ()
import Data.Monoid ()
import Data.Tuple ()
--  | The `Writer` monad is a synonym for the `WriterT` monad transformer, applied
--  | to the `Identity` monad.
--  | Run a computation in the `Writer` monad
--  | Change the result and accumulator types in a `Writer` monad action
--  | Run a computation in the `Writer` monad, discarding the result
type Writer (w :: *) = Control.Monad.Writer.Trans.WriterT w Data.Identity.Identity
foreign import mapWriter :: forall w1 w2 a b. (Data.Tuple.Tuple a w1 -> Data.Tuple.Tuple b w2) -> Control.Monad.Writer.Writer w1 a -> Control.Monad.Writer.Writer w2 b
foreign import execWriter :: forall w a. Control.Monad.Writer.Writer w a -> w
foreign import runWriter :: forall w a. Control.Monad.Writer.Writer w a -> Data.Tuple.Tuple a w