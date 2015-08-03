module Control.Monad.Aff.Console (print, log) where
import Prelude ()
import Control.Monad.Eff.Class ()
import Control.Monad.Eff.Console ()
import Prim ()
import Prelude ()
import Control.Monad.Eff.Console ()
import Control.Monad.Aff ()
import Control.Monad.Eff.Class ()
--  | Prints any `Show`-able value to the console. This basically saves you 
--  | from writing `liftEff $ print x` everywhere.
--  | Logs any string to the console. This basically saves you
--  | from writing `liftEff $ log x` everywhere.
foreign import print :: forall e a. (Prelude.Show a) => a -> Control.Monad.Aff.Aff (console :: Control.Monad.Eff.Console.CONSOLE | e) a
foreign import log :: forall e. Prim.String -> Control.Monad.Aff.Aff (console :: Control.Monad.Eff.Console.CONSOLE | e) Prim.String