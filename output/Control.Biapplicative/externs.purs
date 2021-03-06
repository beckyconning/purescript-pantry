module Control.Biapplicative (Biapplicative, bipure) where
import Prim ()
import Prelude ()
import Control.Biapply ()
--  | `Biapplicative` captures type constructors of two arguments which support lifting of
--  | functions of zero or more arguments, in the sense of `Applicative`.
--  | `Biapplicative` captures type constructors of two arguments which support lifting of
--  | functions of zero or more arguments, in the sense of `Applicative`.
--  | `Biapplicative` captures type constructors of two arguments which support lifting of
--  | functions of zero or more arguments, in the sense of `Applicative`.
class (Control.Biapply.Biapply w) <= Biapplicative w where
  bipure :: forall a b. a -> b -> w a b