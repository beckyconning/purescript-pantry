module Control.Monad.Rec.Class (MonadRec, forever, tailRecM3, tailRecM2, tailRecM, tailRec) where
import Control.Monad.Rec.Class ()
import Prelude ()
import Data.Identity ()
import Control.Monad.Eff.Unsafe ()
import Control.Monad.ST ()
import Control.Monad.Eff ()
import Data.Functor ()
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
import Control.Monad.ST ()
import Data.Either ()
import Data.Functor ()
import Data.Identity ()
import Control.Monad.Eff.Unsafe ()
--  | This type class captures those monads which support tail recursion in constant stack space.
--  |
--  | The `tailRecM` function takes a step function, and applies that step function recursively
--  | until a return value of type `b` is found.
--  |
--  | Instances are provided for standard monad transformers.
--  |
--  | For example:
--  |
--  | ```purescript
--  | loopWriter :: Number -> WriterT Sum (Eff (trace :: Trace)) Unit
--  | loopWriter n = tailRecM go n
--  |   where
--  |   go 0 = do
--  |     lift $ trace "Done!"
--  |     return (Right unit)
--  |   go n = do
--  |     tell $ Sum n
--  |     return (Left (n - 1))
--  | ```
--  | This type class captures those monads which support tail recursion in constant stack space.
--  |
--  | The `tailRecM` function takes a step function, and applies that step function recursively
--  | until a return value of type `b` is found.
--  |
--  | Instances are provided for standard monad transformers.
--  |
--  | For example:
--  |
--  | ```purescript
--  | loopWriter :: Number -> WriterT Sum (Eff (trace :: Trace)) Unit
--  | loopWriter n = tailRecM go n
--  |   where
--  |   go 0 = do
--  |     lift $ trace "Done!"
--  |     return (Right unit)
--  |   go n = do
--  |     tell $ Sum n
--  |     return (Left (n - 1))
--  | ```
--  | This type class captures those monads which support tail recursion in constant stack space.
--  |
--  | The `tailRecM` function takes a step function, and applies that step function recursively
--  | until a return value of type `b` is found.
--  |
--  | Instances are provided for standard monad transformers.
--  |
--  | For example:
--  |
--  | ```purescript
--  | loopWriter :: Number -> WriterT Sum (Eff (trace :: Trace)) Unit
--  | loopWriter n = tailRecM go n
--  |   where
--  |   go 0 = do
--  |     lift $ trace "Done!"
--  |     return (Right unit)
--  |   go n = do
--  |     tell $ Sum n
--  |     return (Left (n - 1))
--  | ```
--  | Create a tail-recursive function of two arguments which uses constant stack space.
--  | Create a tail-recursive function of three arguments which uses constant stack space.
--  | Create a pure tail-recursive function of one argument
--  |
--  | For example:
--  |
--  | ```purescript
--  | pow :: Number -> Number -> Number
--  | pow n p = tailRec go { accum: 1, power: p }
--  |   where
--  |   go :: _ -> Either _ Number
--  |   go { accum: acc, power: 0 } = Right acc
--  |   go { accum: acc, power: p } = Left { accum: acc * n, power: p - 1 }
--  | ```
--  | `forever` runs an action indefinitely, using the `MonadRec` instance to
--  | ensure constant stack usage.
--  |
--  | For example:
--  |
--  | ```purescript
--  | main = forever $ trace "Hello, World!"
--  | ```
class (Prelude.Monad m) <= MonadRec m where
  tailRecM :: forall a b. (a -> m (Data.Either.Either a b)) -> a -> m b
foreign import forever :: forall m a b. (Control.Monad.Rec.Class.MonadRec m) => m a -> m b
foreign import tailRecM3 :: forall m a b c d. (Control.Monad.Rec.Class.MonadRec m) => (a -> b -> c -> m (Data.Either.Either { c :: c, b :: b, a :: a } d)) -> a -> b -> c -> m d
foreign import tailRecM2 :: forall m a b c. (Control.Monad.Rec.Class.MonadRec m) => (a -> b -> m (Data.Either.Either { b :: b, a :: a } c)) -> a -> b -> m c
foreign import tailRec :: forall a b. (a -> Data.Either.Either a b) -> a -> b
foreign import instance monadRecIdentity :: Control.Monad.Rec.Class.MonadRec Data.Identity.Identity
foreign import instance monadRecEff :: Control.Monad.Rec.Class.MonadRec (Control.Monad.Eff.Eff eff)