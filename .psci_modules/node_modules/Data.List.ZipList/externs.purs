module Data.List.ZipList (ZipList(ZipList), runZipList) where
import Prelude ()
import Data.List.ZipList ()
import Data.Monoid ()
import Data.Foldable ()
import Data.Traversable ()
import Data.List.Lazy ()
import Prim ()
import Prelude ()
import Data.Monoid ()
import Data.List.Lazy ()
import Data.Foldable ()
import Data.Traversable ()
import Control.Alt ()
import Control.Plus ()
import Control.Alternative ()
--  | `ZipList` is a newtype around `List` which provides a zippy
--  | `Applicative` instance.
--  | Unpack a `ZipList` to obtain the underlying list.
newtype ZipList (a :: *) = ZipList (Data.List.Lazy.List a)
foreign import runZipList :: forall a. Data.List.ZipList.ZipList a -> Data.List.Lazy.List a
foreign import instance showZipList :: (Prelude.Show a) => Prelude.Show (Data.List.ZipList.ZipList a)
foreign import instance eqZipList :: (Prelude.Eq a) => Prelude.Eq (Data.List.ZipList.ZipList a)
foreign import instance ordZipList :: (Prelude.Ord a) => Prelude.Ord (Data.List.ZipList.ZipList a)
foreign import instance semigroupZipList :: Prelude.Semigroup (Data.List.ZipList.ZipList a)
foreign import instance monoidZipList :: Data.Monoid.Monoid (Data.List.ZipList.ZipList a)
foreign import instance foldableZipList :: Data.Foldable.Foldable Data.List.ZipList.ZipList
foreign import instance traversableZipList :: Data.Traversable.Traversable Data.List.ZipList.ZipList
foreign import instance functorZipList :: Prelude.Functor Data.List.ZipList.ZipList
foreign import instance applyZipList :: Prelude.Apply Data.List.ZipList.ZipList
foreign import instance applicativeZipList :: Prelude.Applicative Data.List.ZipList.ZipList
foreign import instance altZipList :: Control.Alt.Alt Data.List.ZipList.ZipList
foreign import instance plusZipList :: Control.Plus.Plus Data.List.ZipList.ZipList
foreign import instance alternativeZipList :: Control.Alternative.Alternative Data.List.ZipList.ZipList