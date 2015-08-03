module Control.Monad.Error (Error, strMsg, noMsg) where
import Prelude ()
import Prim ()
import Prelude ()
--  | The `Error` type class represents _error_ types, which can be 
--  | constructed from error message strings.
--  | The `Error` type class represents _error_ types, which can be 
--  | constructed from error message strings.
--  | The `Error` type class represents _error_ types, which can be 
--  | constructed from error message strings.
--  | The `Error` type class represents _error_ types, which can be 
--  | constructed from error message strings.
class Error a where
  noMsg :: a
  strMsg :: Prim.String -> a
foreign import instance errorString :: Control.Monad.Error.Error Prim.String