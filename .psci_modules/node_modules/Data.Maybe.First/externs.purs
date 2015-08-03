module Data.Maybe.First (First(First), runFirst) where
import Prelude ()
import Data.Maybe.First ()
import Control.Extend ()
import Data.Functor.Invariant ()
import Prim ()
import Prelude ()
import Control.Comonad ()
import Control.Extend ()
import Data.Functor.Invariant ()
import Data.Maybe ()
import Data.Monoid ()
--  | Monoid returning the first (left-most) non-`Nothing` value.
--  |
--  | ``` purescript
--  | First (Just x) <> First (Just y) == First (Just x)
--  | First Nothing <> First (Just y) == First (Just y)
--  | First Nothing <> Nothing == First Nothing
--  | mempty :: First _ == First Nothing
--  | ```
newtype First (a :: *) = First (Data.Maybe.Maybe a)
foreign import runFirst :: forall a. Data.Maybe.First.First a -> Data.Maybe.Maybe a
foreign import instance eqFirst :: (Prelude.Eq a) => Prelude.Eq (Data.Maybe.First.First a)
foreign import instance ordFirst :: (Prelude.Ord a) => Prelude.Ord (Data.Maybe.First.First a)
foreign import instance boundedFirst :: (Prelude.Bounded a) => Prelude.Bounded (Data.Maybe.First.First a)
foreign import instance functorFirst :: Prelude.Functor Data.Maybe.First.First
foreign import instance applyFirst :: Prelude.Apply Data.Maybe.First.First
foreign import instance applicativeFirst :: Prelude.Applicative Data.Maybe.First.First
foreign import instance bindFirst :: Prelude.Bind Data.Maybe.First.First
foreign import instance monadFirst :: Prelude.Monad Data.Maybe.First.First
foreign import instance extendFirst :: Control.Extend.Extend Data.Maybe.First.First
foreign import instance invariantFirst :: Data.Functor.Invariant.Invariant Data.Maybe.First.First
foreign import instance showFirst :: (Prelude.Show a) => Prelude.Show (Data.Maybe.First.First a)
foreign import instance semigroupFirst :: Prelude.Semigroup (Data.Maybe.First.First a)
foreign import instance monoidFirst :: Data.Monoid.Monoid (Data.Maybe.First.First a)