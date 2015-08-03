module Data.Bifunctor.Clown (Clown(Clown), runClown) where
import Prelude ()
import Data.Bifunctor.Clown ()
import Prim ()
import Prelude ()
import Control.Biapplicative ()
import Control.Biapply ()
import Data.Bifunctor ()
--  | Make a `Functor` over the first argument of a `Bifunctor`
data Clown (f :: * -> *) (a :: *) (b :: *) = Clown (f a)
foreign import runClown :: forall f a b. Data.Bifunctor.Clown.Clown f a b -> f a
foreign import instance clownBifunctor :: (Prelude.Functor f) => Data.Bifunctor.Bifunctor (Data.Bifunctor.Clown.Clown f)
foreign import instance clownFunctor :: Prelude.Functor (Data.Bifunctor.Clown.Clown f a)
foreign import instance clownBiapply :: (Prelude.Apply f) => Control.Biapply.Biapply (Data.Bifunctor.Clown.Clown f)
foreign import instance clownBiapplicative :: (Prelude.Applicative f) => Control.Biapplicative.Biapplicative (Data.Bifunctor.Clown.Clown f)