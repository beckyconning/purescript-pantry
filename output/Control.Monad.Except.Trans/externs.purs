module Control.Monad.Except.Trans (ExceptT(ExceptT), catchE, throwE, mapExceptT, withExceptT, runExceptT) where
import Prelude ()
import Control.Monad.Except.Trans ()
import Data.Either ()
import Control.Monad.Rec.Class ()
import Data.Monoid ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Alternative ()
import Control.Monad.Rec.Class ()
import Control.Monad.Eff.Class ()
import Control.Monad.Trans ()
import Control.MonadPlus ()
import Control.Plus ()
import Data.Either ()
import Data.Monoid ()
--  | A monad transformer which adds exceptions to other monads, in the same way
--  | as `Except`. As before, `e` is the type of exceptions, and `a` is the type
--  | of successful results. The new type parameter `m` is the inner monad that
--  | computations run in.
--  | Throw an exception in an `ExceptT` computation.
--  | The inverse of `ExceptT`. Run a computation in the `ExceptT` monad.
--  | Transform any exceptions thrown by an `ExceptT` computation using the given function.
--  | Transform the unwrapped computation using the given function.
--  | Catch an exception in an `ExceptT` computation.
newtype ExceptT (e :: *) (m :: * -> *) (a :: *) = ExceptT (m (Data.Either.Either e a))
foreign import catchE :: forall e e' m a. (Prelude.Monad m) => Control.Monad.Except.Trans.ExceptT e m a -> (e -> Control.Monad.Except.Trans.ExceptT e' m a) -> Control.Monad.Except.Trans.ExceptT e' m a
foreign import throwE :: forall e m a. (Prelude.Applicative m) => e -> Control.Monad.Except.Trans.ExceptT e m a
foreign import mapExceptT :: forall e e' m n a b. (m (Data.Either.Either e a) -> n (Data.Either.Either e' b)) -> Control.Monad.Except.Trans.ExceptT e m a -> Control.Monad.Except.Trans.ExceptT e' n b
foreign import withExceptT :: forall e e' m a. (Prelude.Functor m) => (e -> e') -> Control.Monad.Except.Trans.ExceptT e m a -> Control.Monad.Except.Trans.ExceptT e' m a
foreign import runExceptT :: forall e m a. Control.Monad.Except.Trans.ExceptT e m a -> m (Data.Either.Either e a)
foreign import instance functorExceptT :: (Prelude.Functor m) => Prelude.Functor (Control.Monad.Except.Trans.ExceptT e m)
foreign import instance applyExceptT :: (Prelude.Apply m) => Prelude.Apply (Control.Monad.Except.Trans.ExceptT e m)
foreign import instance applicativeExceptT :: (Prelude.Applicative m) => Prelude.Applicative (Control.Monad.Except.Trans.ExceptT e m)
foreign import instance bindExceptT :: (Prelude.Monad m) => Prelude.Bind (Control.Monad.Except.Trans.ExceptT e m)
foreign import instance monadExceptT :: (Prelude.Monad m) => Prelude.Monad (Control.Monad.Except.Trans.ExceptT e m)
foreign import instance monadRecErrorT :: (Prelude.Semigroup e, Control.Monad.Rec.Class.MonadRec m) => Control.Monad.Rec.Class.MonadRec (Control.Monad.Except.Trans.ExceptT e m)
foreign import instance altExceptT :: (Prelude.Semigroup e, Prelude.Monad m) => Control.Alt.Alt (Control.Monad.Except.Trans.ExceptT e m)
foreign import instance plusExceptT :: (Data.Monoid.Monoid e, Prelude.Monad m) => Control.Plus.Plus (Control.Monad.Except.Trans.ExceptT e m)
foreign import instance alternativeExceptT :: (Data.Monoid.Monoid e, Prelude.Monad m) => Control.Alternative.Alternative (Control.Monad.Except.Trans.ExceptT e m)
foreign import instance monadPlusExceptT :: (Data.Monoid.Monoid e, Prelude.Monad m) => Control.MonadPlus.MonadPlus (Control.Monad.Except.Trans.ExceptT e m)
foreign import instance monadTransExceptT :: Control.Monad.Trans.MonadTrans (Control.Monad.Except.Trans.ExceptT e)
foreign import instance monadEffExceptT :: (Prelude.Monad m, Control.Monad.Eff.Class.MonadEff eff m) => Control.Monad.Eff.Class.MonadEff eff (Control.Monad.Except.Trans.ExceptT e m)