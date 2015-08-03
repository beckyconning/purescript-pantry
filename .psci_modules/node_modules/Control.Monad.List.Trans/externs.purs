module Control.Monad.List.Trans (ListT(), zipWith', zipWith, wrapLazy, wrapEffect, unfold, uncons, takeWhile, take, tail, singleton, scanl, repeat, prepend', prepend, nil, mapMaybe, iterate, head, fromEffect, foldl', foldl, filter, dropWhile, drop, cons, catMaybes) where
import Prelude ()
import Data.Lazy ()
import Control.Monad.List.Trans ()
import Data.Maybe ()
import Data.Tuple ()
import Control.Monad.Trans ()
import Control.Monad.Eff.Class ()
import Prim ()
import Prelude ()
import Control.Alt ()
import Control.Alternative ()
import Control.Monad.Trans ()
import Control.MonadPlus ()
import Control.Monad.Eff.Class ()
import Control.Plus ()
import Data.Lazy ()
import Data.Maybe ()
import Data.Monoid ()
import Data.Tuple ()
import Data.Unfoldable ()
--  | The result of a single step in a `ListT` computation. Either:
--  |
--  | - Computation has finished (`Done`), or
--  | - A result has been returned, along with the next part of the computation (`Yield`).
--  |
--  | The `Skip` constructor allows us to avoid traversing lists during certain operations.
--  | The list monad transformer.
--  |
--  | This monad transformer extends the base monad with _non-determinism_.
--  | That is, the transformed monad supports the same effects as the base monad
--  | but with multiple return values.
--  | Defer evaluation of a list.
--  | Lift a computation from the base monad.
--  | Run a computation in the `ListT` monad.
--  | Fold a list from the left, accumulating the list of results using the specified function.
--  | Lift a computation on list steps to a computation on whole lists.
--  | Extract all but the first element of a list.
--  | Prepend an element to a lazily-evaluated list.
--  | Prepend an element to a list.
--  | The empty list.
--  | Create a list with one element.
--  | Zip the elements of two lists, combining elements at the same position from each list.
--  | Generate an infinite list by iterating a function.
--  | Generate an infinite list by repeating a value.
--  | Extract the first element of a list.
--  | Lift a computation from the base functor.
--  | Fold a list from the left, accumulating the result (effectfully) using the specified function.
--  | Fold a list from the left, accumulating the result using the specified function.
--  | Attach an element to the front of a list.
--  | Remove elements from a list which do not contain a value.
data ListT (f :: * -> *) (a :: *)
foreign import zipWith' :: forall f a b c. (Prelude.Monad f) => (a -> b -> f c) -> Control.Monad.List.Trans.ListT f a -> Control.Monad.List.Trans.ListT f b -> Control.Monad.List.Trans.ListT f c
foreign import zipWith :: forall f a b c. (Prelude.Monad f) => (a -> b -> c) -> Control.Monad.List.Trans.ListT f a -> Control.Monad.List.Trans.ListT f b -> Control.Monad.List.Trans.ListT f c
foreign import wrapLazy :: forall f a. (Prelude.Applicative f) => Data.Lazy.Lazy (Control.Monad.List.Trans.ListT f a) -> Control.Monad.List.Trans.ListT f a
foreign import wrapEffect :: forall f a. (Prelude.Functor f) => f (Control.Monad.List.Trans.ListT f a) -> Control.Monad.List.Trans.ListT f a
foreign import unfold :: forall f a z. (Prelude.Monad f) => (z -> f (Data.Maybe.Maybe (Data.Tuple.Tuple z a))) -> z -> Control.Monad.List.Trans.ListT f a
foreign import uncons :: forall f a. (Prelude.Monad f) => Control.Monad.List.Trans.ListT f a -> f (Data.Maybe.Maybe (Data.Tuple.Tuple a (Control.Monad.List.Trans.ListT f a)))
foreign import takeWhile :: forall f a. (Prelude.Applicative f) => (a -> Prim.Boolean) -> Control.Monad.List.Trans.ListT f a -> Control.Monad.List.Trans.ListT f a
foreign import take :: forall f a. (Prelude.Applicative f) => Prim.Int -> Control.Monad.List.Trans.ListT f a -> Control.Monad.List.Trans.ListT f a
foreign import tail :: forall f a. (Prelude.Monad f) => Control.Monad.List.Trans.ListT f a -> f (Data.Maybe.Maybe (Control.Monad.List.Trans.ListT f a))
foreign import singleton :: forall f a. (Prelude.Applicative f) => a -> Control.Monad.List.Trans.ListT f a
foreign import scanl :: forall f a b. (Prelude.Monad f) => (b -> a -> b) -> b -> Control.Monad.List.Trans.ListT f a -> Control.Monad.List.Trans.ListT f b
foreign import repeat :: forall f a. (Prelude.Monad f) => a -> Control.Monad.List.Trans.ListT f a
foreign import prepend' :: forall f a. (Prelude.Applicative f) => a -> Data.Lazy.Lazy (Control.Monad.List.Trans.ListT f a) -> Control.Monad.List.Trans.ListT f a
foreign import prepend :: forall f a. (Prelude.Applicative f) => a -> Control.Monad.List.Trans.ListT f a -> Control.Monad.List.Trans.ListT f a
foreign import nil :: forall f a. (Prelude.Applicative f) => Control.Monad.List.Trans.ListT f a
foreign import mapMaybe :: forall f a b. (Prelude.Functor f) => (a -> Data.Maybe.Maybe b) -> Control.Monad.List.Trans.ListT f a -> Control.Monad.List.Trans.ListT f b
foreign import iterate :: forall f a. (Prelude.Monad f) => (a -> a) -> a -> Control.Monad.List.Trans.ListT f a
foreign import head :: forall f a. (Prelude.Monad f) => Control.Monad.List.Trans.ListT f a -> f (Data.Maybe.Maybe a)
foreign import fromEffect :: forall f a. (Prelude.Applicative f) => f a -> Control.Monad.List.Trans.ListT f a
foreign import foldl' :: forall f a b. (Prelude.Monad f) => (b -> a -> f b) -> b -> Control.Monad.List.Trans.ListT f a -> f b
foreign import foldl :: forall f a b. (Prelude.Monad f) => (b -> a -> b) -> b -> Control.Monad.List.Trans.ListT f a -> f b
foreign import filter :: forall f a. (Prelude.Functor f) => (a -> Prim.Boolean) -> Control.Monad.List.Trans.ListT f a -> Control.Monad.List.Trans.ListT f a
foreign import dropWhile :: forall f a. (Prelude.Applicative f) => (a -> Prim.Boolean) -> Control.Monad.List.Trans.ListT f a -> Control.Monad.List.Trans.ListT f a
foreign import drop :: forall f a. (Prelude.Applicative f) => Prim.Int -> Control.Monad.List.Trans.ListT f a -> Control.Monad.List.Trans.ListT f a
foreign import cons :: forall f a. (Prelude.Applicative f) => Data.Lazy.Lazy a -> Data.Lazy.Lazy (Control.Monad.List.Trans.ListT f a) -> Control.Monad.List.Trans.ListT f a
foreign import catMaybes :: forall f a. (Prelude.Functor f) => Control.Monad.List.Trans.ListT f (Data.Maybe.Maybe a) -> Control.Monad.List.Trans.ListT f a
foreign import instance semigroupListT :: (Prelude.Applicative f) => Prelude.Semigroup (Control.Monad.List.Trans.ListT f a)
foreign import instance monoidListT :: (Prelude.Applicative f) => Data.Monoid.Monoid (Control.Monad.List.Trans.ListT f a)
foreign import instance functorListT :: (Prelude.Functor f) => Prelude.Functor (Control.Monad.List.Trans.ListT f)
foreign import instance unfoldableListT :: (Prelude.Monad f) => Data.Unfoldable.Unfoldable (Control.Monad.List.Trans.ListT f)
foreign import instance applyListT :: (Prelude.Monad f) => Prelude.Apply (Control.Monad.List.Trans.ListT f)
foreign import instance applicativeListT :: (Prelude.Monad f) => Prelude.Applicative (Control.Monad.List.Trans.ListT f)
foreign import instance bindListT :: (Prelude.Monad f) => Prelude.Bind (Control.Monad.List.Trans.ListT f)
foreign import instance monadListT :: (Prelude.Monad f) => Prelude.Monad (Control.Monad.List.Trans.ListT f)
foreign import instance monadTransListT :: Control.Monad.Trans.MonadTrans Control.Monad.List.Trans.ListT
foreign import instance altListT :: (Prelude.Applicative f) => Control.Alt.Alt (Control.Monad.List.Trans.ListT f)
foreign import instance plusListT :: (Prelude.Monad f) => Control.Plus.Plus (Control.Monad.List.Trans.ListT f)
foreign import instance alternativeListT :: (Prelude.Monad f) => Control.Alternative.Alternative (Control.Monad.List.Trans.ListT f)
foreign import instance monadPlusListT :: (Prelude.Monad f) => Control.MonadPlus.MonadPlus (Control.Monad.List.Trans.ListT f)
foreign import instance monadEffListT :: (Prelude.Monad m, Control.Monad.Eff.Class.MonadEff eff m) => Control.Monad.Eff.Class.MonadEff eff (Control.Monad.List.Trans.ListT m)