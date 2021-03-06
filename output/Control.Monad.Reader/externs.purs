module Control.Monad.Reader (Reader(), mapReader, withReader, runReader) where
import Prelude ()
import Data.Identity ()
import Control.Monad.Reader.Trans ()
import Prim ()
import Prelude ()
import Control.Monad.Reader.Trans ()
import Data.Identity ()
--  | The `Reader` monad is a synonym for the `ReaderT` monad transformer, applied
--  | to the `Identity` monad.
--  | Change the type of the context in a `Reader` monad action.
--  | Run a computation in the `Reader` monad.
--  | Change the type of the result in a `Reader` monad action.
type Reader (r :: *) = Control.Monad.Reader.Trans.ReaderT r Data.Identity.Identity
foreign import mapReader :: forall r a b. (a -> b) -> Control.Monad.Reader.Reader r a -> Control.Monad.Reader.Reader r b
foreign import withReader :: forall r1 r2 a b. (r2 -> r1) -> Control.Monad.Reader.Reader r1 a -> Control.Monad.Reader.Reader r2 a
foreign import runReader :: forall r a. Control.Monad.Reader.Reader r a -> r -> a