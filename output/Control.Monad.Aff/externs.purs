module Control.Monad.Aff (PureAff(), Canceler(Canceler), Aff(), runAff, nonCanceler, makeAff', makeAff, liftEff', launchAff, later', later, forkAff, finally, cancelWith, cancel, attempt, apathize) where
import Data.Function ()
import Control.Monad.Aff ()
import Prelude ()
import Data.Either ()
import Control.Monad.Error.Class ()
import Data.Monoid ()
import Control.Monad.Eff.Exception ()
import Control.Monad.Rec.Class ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Alternative ()
import Control.Monad.Cont.Class ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Class ()
import Control.Monad.Eff.Exception ()
import Control.Monad.Eff.Unsafe ()
import Control.Monad.Error.Class ()
import Control.Monad.Rec.Class ()
import Control.MonadPlus ()
import Control.Plus ()
import Data.Either ()
import Data.Function ()
import Data.Monoid ()
--  | An asynchronous computation with effects `e`. The computation either
--  | errors or produces a value of type `a`.
--  |
--  | This is moral equivalent of `ErrorT (ContT Unit (Eff e)) a`.
--  | A pure asynchronous computation, having no effects other than
--  | asynchronous computation.
--  | A canceler is asynchronous function that can be used to attempt the
--  | cancelation of a computation. Returns a boolean flag indicating whether
--  | or not the cancellation was successful. Many computations may be composite,
--  | in such cases the flag indicates whether any part of the computation was
--  | successfully canceled. The flag should not be used for communication.
--  | Allows users to catch and throw errors on the error channel of the
--  | asynchronous computation. See documentation in `purescript-transformers`.
--  | Runs the asynchronous computation. You must supply an error callback and a
--  | success callback.
--  | Creates an asynchronous effect from a function that accepts error and
--  | success callbacks, and returns a canceler for the computation. This
--  | function can be used for asynchronous computations that can be canceled.
--  | Converts the asynchronous computation into a synchronous one. All values
--  | and errors are ignored.
--  | Unwraps the canceler function from the newtype that wraps it.
--  | Promotes any error to the value level of the asynchronous monad.
--  | Ignores any errors.
--  | This function allows you to attach a custom canceler to an asynchronous
--  | computation. If the computation is canceled, then the custom canceler
--  | will be run along side the computation's own canceler.
--  | Forks the specified asynchronous computation so subsequent computations
--  | will not block on the result of the computation.
--  |
--  | Returns a canceler that can be used to attempt cancellation of the
--  | forked computation.
--  | Runs the specified asynchronous computation later, by the specified
--  | number of milliseconds.
--  | Runs the asynchronous computation off the current execution context.
--  | Lifts a synchronous computation and makes explicit any failure from exceptions.
--  | Creates an asynchronous effect from a function that accepts error and
--  | success callbacks. This function can be used for asynchronous computations
--  | that cannot be canceled.
--  | Allows users to catch and throw errors on the error channel of the
--  | asynchronous computation. See documentation in `purescript-transformers`.
--  | Compute `aff1`, followed by `aff2` regardless of whether `aff1` terminated successfully.
type PureAff (a :: *) = forall e. Control.Monad.Aff.Aff e a
newtype Canceler (e :: # !) = Canceler (Control.Monad.Eff.Exception.Error -> Control.Monad.Aff.Aff e Prim.Boolean)
foreign import data Aff :: # ! -> * -> *
foreign import runAff :: forall e a. (Control.Monad.Eff.Exception.Error -> Control.Monad.Eff.Eff e Prelude.Unit) -> (a -> Control.Monad.Eff.Eff e Prelude.Unit) -> Control.Monad.Aff.Aff e a -> Control.Monad.Eff.Eff e Prelude.Unit
foreign import nonCanceler :: forall e. Control.Monad.Aff.Canceler e
foreign import makeAff' :: forall e a. ((Control.Monad.Eff.Exception.Error -> Control.Monad.Eff.Eff e Prelude.Unit) -> (a -> Control.Monad.Eff.Eff e Prelude.Unit) -> Control.Monad.Eff.Eff e (Control.Monad.Aff.Canceler e)) -> Control.Monad.Aff.Aff e a
foreign import makeAff :: forall e a. ((Control.Monad.Eff.Exception.Error -> Control.Monad.Eff.Eff e Prelude.Unit) -> (a -> Control.Monad.Eff.Eff e Prelude.Unit) -> Control.Monad.Eff.Eff e Prelude.Unit) -> Control.Monad.Aff.Aff e a
foreign import liftEff' :: forall e a. Control.Monad.Eff.Eff (err :: Control.Monad.Eff.Exception.EXCEPTION | e) a -> Control.Monad.Aff.Aff e (Data.Either.Either Control.Monad.Eff.Exception.Error a)
foreign import launchAff :: forall e a. Control.Monad.Aff.Aff e a -> Control.Monad.Eff.Eff e Prelude.Unit
foreign import later' :: forall e a. Prim.Int -> Control.Monad.Aff.Aff e a -> Control.Monad.Aff.Aff e a
foreign import later :: forall e a. Control.Monad.Aff.Aff e a -> Control.Monad.Aff.Aff e a
foreign import forkAff :: forall e a. Control.Monad.Aff.Aff e a -> Control.Monad.Aff.Aff e (Control.Monad.Aff.Canceler e)
foreign import finally :: forall e a b. Control.Monad.Aff.Aff e a -> Control.Monad.Aff.Aff e b -> Control.Monad.Aff.Aff e a
foreign import cancelWith :: forall e a. Control.Monad.Aff.Aff e a -> Control.Monad.Aff.Canceler e -> Control.Monad.Aff.Aff e a
foreign import cancel :: forall e. Control.Monad.Aff.Canceler e -> Control.Monad.Eff.Exception.Error -> Control.Monad.Aff.Aff e Prim.Boolean
foreign import attempt :: forall e a. Control.Monad.Aff.Aff e a -> Control.Monad.Aff.Aff e (Data.Either.Either Control.Monad.Eff.Exception.Error a)
foreign import apathize :: forall e a. Control.Monad.Aff.Aff e a -> Control.Monad.Aff.Aff e Prelude.Unit
foreign import instance semigroupAff :: (Prelude.Semigroup a) => Prelude.Semigroup (Control.Monad.Aff.Aff e a)
foreign import instance monoidAff :: (Data.Monoid.Monoid a) => Data.Monoid.Monoid (Control.Monad.Aff.Aff e a)
foreign import instance functorAff :: Prelude.Functor (Control.Monad.Aff.Aff e)
foreign import instance applyAff :: Prelude.Apply (Control.Monad.Aff.Aff e)
foreign import instance applicativeAff :: Prelude.Applicative (Control.Monad.Aff.Aff e)
foreign import instance bindAff :: Prelude.Bind (Control.Monad.Aff.Aff e)
foreign import instance monadAff :: Prelude.Monad (Control.Monad.Aff.Aff e)
foreign import instance monadEffAff :: Control.Monad.Eff.Class.MonadEff e (Control.Monad.Aff.Aff e)
foreign import instance monadErrorAff :: Control.Monad.Error.Class.MonadError Control.Monad.Eff.Exception.Error (Control.Monad.Aff.Aff e)
foreign import instance altAff :: Control.Alt.Alt (Control.Monad.Aff.Aff e)
foreign import instance plusAff :: Control.Plus.Plus (Control.Monad.Aff.Aff e)
foreign import instance alternativeAff :: Control.Alternative.Alternative (Control.Monad.Aff.Aff e)
foreign import instance monadPlusAff :: Control.MonadPlus.MonadPlus (Control.Monad.Aff.Aff e)
foreign import instance monadRecAff :: Control.Monad.Rec.Class.MonadRec (Control.Monad.Aff.Aff e)
foreign import instance monadContAff :: Control.Monad.Cont.Class.MonadCont (Control.Monad.Aff.Aff e)
foreign import instance semigroupCanceler :: Prelude.Semigroup (Control.Monad.Aff.Canceler e)
foreign import instance monoidCanceler :: Data.Monoid.Monoid (Control.Monad.Aff.Canceler e)