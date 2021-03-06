module Control.Monad.Except (Except(), withExcept, mapExcept, runExcept, except) where
import Prelude ()
import Data.Identity ()
import Control.Monad.Except.Trans ()
import Prim ()
import Prelude ()
import Data.Either ()
import Data.Identity ()
import Control.Monad.Except.Trans ()
--  | A parametrizable exception monad; computations are either exceptions or
--  | pure values. If an exception is thrown (see `throwE`), the computation
--  | terminates with that value. Exceptions may also be caught with `catchE`,
--  | allowing the computation to resume and exit successfully.
--  |
--  | The type parameter `e` is the type of exceptions, and `a` is the type
--  | of successful results.
--  |
--  | A mechanism for trying many different computations until one succeeds is
--  | provided via the `Alt` instance, specifically the `(<|>)` function.
--  | The first computation to succeed is returned; if all fail, the exceptions
--  | are combined using their `Semigroup` instance. The `Plus` instance goes
--  | further and adds the possibility of a computation failing with an 'empty'
--  | exception; naturally, this requires the stronger constraint of a `Monoid`
--  | instance for the exception type.
--  | Transform any exceptions thrown by an `Except` computation using the given function.
--  | Run a computation in the `Except` monad. The inverse of `except`.
--  | Transform the unwrapped computation using the given function.
--  | Construct a computation in the `Except` monad from an `Either` value.
type Except (e :: *) (a :: *) = Control.Monad.Except.Trans.ExceptT e Data.Identity.Identity a
foreign import withExcept :: forall e e' a. (e -> e') -> Control.Monad.Except.Except e a -> Control.Monad.Except.Except e' a
foreign import mapExcept :: forall e e' a b. (Data.Either.Either e a -> Data.Either.Either e' b) -> Control.Monad.Except.Except e a -> Control.Monad.Except.Except e' b
foreign import runExcept :: forall e a. Control.Monad.Except.Except e a -> Data.Either.Either e a
foreign import except :: forall e a. Data.Either.Either e a -> Control.Monad.Except.Except e a