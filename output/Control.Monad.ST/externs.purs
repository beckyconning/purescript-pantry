module Control.Monad.ST (STRef(), ST(), pureST, runST, writeSTRef, modifySTRef, readSTRef, newSTRef) where
import Control.Monad.Eff ()
import Control.Monad.ST ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
--  | The `ST` effect represents _local mutation_, i.e. mutation which does not "escape" into the surrounding computation.
--  |
--  | An `ST` computation is parameterized by a phantom type which is used to restrict the set of reference cells it is allowed to access.
--  |
--  | The `runST` function can be used to handle the `ST` effect.
--  | The type `STRef s a` represents a mutable reference holding a value of type `a`, which can be used with the `ST s` effect.
--  | Create a new mutable reference.
--  | Read the current value of a mutable reference.
--  | Modify the value of a mutable reference by applying a function to the current value.
--  | Set the value of a mutable reference.
--  | Run an `ST` computation.
--  |
--  | Note: the type of `runST` uses a rank-2 type to constrain the phantom type `s`, such that the computation must not leak any mutable references
--  | to the surrounding computation.
--  |
--  | It may cause problems to apply this function using the `$` operator. The recommended approach is to use parentheses instead.
--  | A convenience function which combines `runST` with `runPure`, which can be used when the only required effect is `ST`.
--  |
--  | Note: since this function has a rank-2 type, it may cause problems to apply this function using the `$` operator. The recommended approach
--  | is to use parentheses instead.
foreign import data STRef :: * -> * -> *
foreign import data ST :: * -> !
foreign import pureST :: forall a. (forall h r. Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) a) -> a
foreign import runST :: forall a r. (forall h. Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) a) -> Control.Monad.Eff.Eff r a
foreign import writeSTRef :: forall a h r. Control.Monad.ST.STRef h a -> a -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) a
foreign import modifySTRef :: forall a h r. Control.Monad.ST.STRef h a -> (a -> a) -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) a
foreign import readSTRef :: forall a h r. Control.Monad.ST.STRef h a -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) a
foreign import newSTRef :: forall a h r. a -> Control.Monad.Eff.Eff (st :: Control.Monad.ST.ST h | r) (Control.Monad.ST.STRef h a)