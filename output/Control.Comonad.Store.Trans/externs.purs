module Control.Comonad.Store.Trans (StoreT(StoreT), runStoreT) where
import Prelude ()
import Control.Extend ()
import Control.Comonad ()
import Prim ()
import Prelude ()
import Control.Extend ()
import Control.Comonad ()
import Control.Comonad.Trans ()
import Data.Tuple ()
--  | The store comonad transformer.
--  |
--  | This comonad transformer extends the context of a value in the base comonad so that the value
--  | depends on a position of type `s`.
--  |
--  | The `ComonadStore` type class describes the operations supported by this comonad.
--  | Unwrap a value in the `StoreT` comonad.
newtype StoreT (s :: *) (w :: * -> *) (a :: *) = StoreT (Data.Tuple.Tuple (w (s -> a)) s)
foreign import runStoreT :: forall s w a. Control.Comonad.Store.Trans.StoreT s w a -> Data.Tuple.Tuple (w (s -> a)) s
foreign import instance functorStoreT :: (Prelude.Functor w) => Prelude.Functor (Control.Comonad.Store.Trans.StoreT s w)
foreign import instance extendStoreT :: (Control.Extend.Extend w) => Control.Extend.Extend (Control.Comonad.Store.Trans.StoreT s w)
foreign import instance comonadStoreT :: (Control.Comonad.Comonad w) => Control.Comonad.Comonad (Control.Comonad.Store.Trans.StoreT s w)
foreign import instance comonadTransStoreT :: Control.Comonad.Trans.ComonadTrans (Control.Comonad.Store.Trans.StoreT s)