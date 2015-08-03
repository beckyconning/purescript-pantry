module Control.Monad.Aff.AVar (AVAR(), AVar(), AffAVar(), takeVar, putVar, modifyVar, makeVar', makeVar, killVar) where
import Control.Monad.Aff.AVar ()
import Control.Monad.Aff ()
import Prelude ()
import Data.Function ()
import Prim ()
import Prelude ()
import Data.Function ()
import Control.Monad.Aff ()
import Control.Monad.Eff.Exception ()
--  | Takes the next value from the asynchronous avar.
--  | Puts a new value into the asynchronous avar. If the avar has
--  | been killed, this will result in an error.
--  | Modifies the value at the head of the avar (will suspend until one is available).
--  | Makes a new asynchronous avar.
--  | Makes a avar and sets it to some value.
--  | Kills an asynchronous avar.
foreign import data AVAR :: !
foreign import data AVar :: * -> *
type AffAVar (e :: # !) (a :: *) = Control.Monad.Aff.Aff (avar :: Control.Monad.Aff.AVar.AVAR | e) a
foreign import takeVar :: forall e a. Control.Monad.Aff.AVar.AVar a -> Control.Monad.Aff.AVar.AffAVar e a
foreign import putVar :: forall e a. Control.Monad.Aff.AVar.AVar a -> a -> Control.Monad.Aff.AVar.AffAVar e Prelude.Unit
foreign import modifyVar :: forall e a. (a -> a) -> Control.Monad.Aff.AVar.AVar a -> Control.Monad.Aff.AVar.AffAVar e Prelude.Unit
foreign import makeVar' :: forall e a. a -> Control.Monad.Aff.AVar.AffAVar e (Control.Monad.Aff.AVar.AVar a)
foreign import makeVar :: forall e a. Control.Monad.Aff.AVar.AffAVar e (Control.Monad.Aff.AVar.AVar a)
foreign import killVar :: forall e a. Control.Monad.Aff.AVar.AVar a -> Control.Monad.Eff.Exception.Error -> Control.Monad.Aff.AVar.AffAVar e Prelude.Unit