module Control.Monad.Eff.Ref (Ref(), REF(), writeRef, modifyRef, modifyRef', readRef, newRef) where
import Control.Monad.Eff.Ref ()
import Prelude ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
--  | The effect associated with the use of global mutable variables.
--  | A value of type `Ref a` represents a mutable reference
--  | which holds a value of type `a`.
--  | Create a new mutable reference containing the specified value.
--  | Read the current value of a mutable reference
--  | Update the value of a mutable reference by applying a function
--  | to the current value.
--  | Update the value of a mutable reference to the specified value.
--  | Update the value of a mutable reference by applying a function
--  | to the current value.
foreign import data Ref :: * -> *
foreign import data REF :: !
foreign import writeRef :: forall s r. Control.Monad.Eff.Ref.Ref s -> s -> Control.Monad.Eff.Eff (ref :: Control.Monad.Eff.Ref.REF | r) Prelude.Unit
foreign import modifyRef :: forall s r. Control.Monad.Eff.Ref.Ref s -> (s -> s) -> Control.Monad.Eff.Eff (ref :: Control.Monad.Eff.Ref.REF | r) Prelude.Unit
foreign import modifyRef' :: forall s b r. Control.Monad.Eff.Ref.Ref s -> (s -> { value :: b, state :: s }) -> Control.Monad.Eff.Eff (ref :: Control.Monad.Eff.Ref.REF | r) b
foreign import readRef :: forall s r. Control.Monad.Eff.Ref.Ref s -> Control.Monad.Eff.Eff (ref :: Control.Monad.Eff.Ref.REF | r) s
foreign import newRef :: forall s r. s -> Control.Monad.Eff.Eff (ref :: Control.Monad.Eff.Ref.REF | r) (Control.Monad.Eff.Ref.Ref s)