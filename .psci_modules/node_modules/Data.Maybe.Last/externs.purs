module Data.Maybe.Last (Last(Last), runLast) where
import Prelude ()
import Data.Maybe.Last ()
import Control.Extend ()
import Data.Functor.Invariant ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Extend ()
import Data.Functor.Invariant ()
import Data.Maybe ()
import Data.Monoid ()
--  | Monoid returning the last (right-most) non-`Nothing` value.
--  |
--  | ``` purescript
--  | Last (Just x) <> Last (Just y) == Last (Just y)
--  | Last (Just x) <> Nothing == Last (Just x)
--  | Last Nothing <> Nothing == Last Nothing
--  | mempty :: Last _ == Last Nothing
--  | ```
newtype Last (a :: *) = Last (Data.Maybe.Maybe a)
foreign import runLast :: forall a. Data.Maybe.Last.Last a -> Data.Maybe.Maybe a
foreign import instance eqLast :: (Prelude.Eq a) => Prelude.Eq (Data.Maybe.Last.Last a)
foreign import instance ordLast :: (Prelude.Ord a) => Prelude.Ord (Data.Maybe.Last.Last a)
foreign import instance boundedLast :: (Prelude.Bounded a) => Prelude.Bounded (Data.Maybe.Last.Last a)
foreign import instance functorLast :: Prelude.Functor Data.Maybe.Last.Last
foreign import instance applyLast :: Prelude.Apply Data.Maybe.Last.Last
foreign import instance applicativeLast :: Prelude.Applicative Data.Maybe.Last.Last
foreign import instance bindLast :: Prelude.Bind Data.Maybe.Last.Last
foreign import instance monadLast :: Prelude.Monad Data.Maybe.Last.Last
foreign import instance extendLast :: Control.Extend.Extend Data.Maybe.Last.Last
foreign import instance invariantLast :: Data.Functor.Invariant.Invariant Data.Maybe.Last.Last
foreign import instance showLast :: (Prelude.Show a) => Prelude.Show (Data.Maybe.Last.Last a)
foreign import instance semigroupLast :: Prelude.Semigroup (Data.Maybe.Last.Last a)
foreign import instance monoidLast :: Data.Monoid.Monoid (Data.Maybe.Last.Last a)