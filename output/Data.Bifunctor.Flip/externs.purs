module Data.Bifunctor.Flip (Flip(Flip), runFlip) where
import Prelude ()
import Data.Bifunctor ()
import Data.Bifunctor.Flip ()
import Control.Biapply ()
import Control.Biapplicative ()
import Prim ()
import Prelude ()
import Control.Biapplicative ()
import Control.Biapply ()
import Data.Bifunctor ()
--  | Flips the order of the type arguments of a `Bifunctor`.
--  | Remove the `Flip` constructor.
data Flip (p :: * -> * -> *) (a :: *) (b :: *) = Flip (p b a)
foreign import runFlip :: forall p a b. Data.Bifunctor.Flip.Flip p a b -> p b a
foreign import instance flipBifunctor :: (Data.Bifunctor.Bifunctor p) => Data.Bifunctor.Bifunctor (Data.Bifunctor.Flip.Flip p)
foreign import instance flipFunctor :: (Data.Bifunctor.Bifunctor p) => Prelude.Functor (Data.Bifunctor.Flip.Flip p a)
foreign import instance flipBiapply :: (Control.Biapply.Biapply p) => Control.Biapply.Biapply (Data.Bifunctor.Flip.Flip p)
foreign import instance flipBiapplicative :: (Control.Biapplicative.Biapplicative p) => Control.Biapplicative.Biapplicative (Data.Bifunctor.Flip.Flip p)