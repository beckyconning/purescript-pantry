module Control.Monad.Eff.Exception (Error(), EXCEPTION(), catchException, throwException, message, error) where
import Control.Monad.Eff.Exception ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
--  | This effect is used to annotate code which possibly throws exceptions
--  | The type of Javascript errors
--  | Create a Javascript error, specifying a message
--  | Get the error message from a Javascript error
--  | Throw an exception
--  |
--  | For example:
--  |
--  | ```purescript
--  | main = do
--  |   x <- readNumber
--  |   when (x < 0) $ throwException $
--  |     error "Expected a non-negative number"
--  | ```
--  | Catch an exception by providing an exception handler.
--  |
--  | This handler removes the `EXCEPTION` effect.
--  |
--  | For example:
--  |
--  | ```purescript
--  | main = catchException print do
--  |   trace "Exceptions thrown in this block will be logged to the console"
--  | ```
foreign import data Error :: *
foreign import data EXCEPTION :: !
foreign import catchException :: forall a eff. (Control.Monad.Eff.Exception.Error -> Control.Monad.Eff.Eff eff a) -> Control.Monad.Eff.Eff (err :: Control.Monad.Eff.Exception.EXCEPTION | eff) a -> Control.Monad.Eff.Eff eff a
foreign import throwException :: forall a eff. Control.Monad.Eff.Exception.Error -> Control.Monad.Eff.Eff (err :: Control.Monad.Eff.Exception.EXCEPTION | eff) a
foreign import message :: Control.Monad.Eff.Exception.Error -> Prim.String
foreign import error :: Prim.String -> Control.Monad.Eff.Exception.Error
foreign import instance showError :: Prelude.Show Control.Monad.Eff.Exception.Error