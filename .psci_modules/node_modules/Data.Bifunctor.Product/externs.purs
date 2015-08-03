module Data.Bifunctor.Product (Product(Pair)) where
import Data.Bifunctor ()
import Control.Biapply ()
import Control.Biapplicative ()
import Prim ()
import Prelude ()
import Control.Biapplicative ()
import Control.Biapply ()
import Data.Bifunctor ()
--  | The product of two `Bifunctor`s.
data Product (f :: * -> * -> *) (g :: * -> * -> *) (a :: *) (b :: *) = Pair (f a b) (g a b)
foreign import instance productBifunctor :: (Data.Bifunctor.Bifunctor f, Data.Bifunctor.Bifunctor g) => Data.Bifunctor.Bifunctor (Data.Bifunctor.Product.Product f g)
foreign import instance productBiapply :: (Control.Biapply.Biapply f, Control.Biapply.Biapply g) => Control.Biapply.Biapply (Data.Bifunctor.Product.Product f g)
foreign import instance productBiapplicative :: (Control.Biapplicative.Biapplicative f, Control.Biapplicative.Biapplicative g) => Control.Biapplicative.Biapplicative (Data.Bifunctor.Product.Product f g)