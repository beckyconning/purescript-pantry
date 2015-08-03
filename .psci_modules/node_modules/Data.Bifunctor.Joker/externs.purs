module Data.Bifunctor.Joker (Joker(Joker), runJoker) where
import Prelude ()
import Data.Bifunctor.Joker ()
import Prim ()
import Prelude ()
import Control.Biapplicative ()
import Control.Biapply ()
import Data.Bifunctor ()
--  | Make a `Functor` over the second argument of a `Bifunctor`
data Joker (g :: * -> *) (a :: *) (b :: *) = Joker (g b)
foreign import runJoker :: forall g a b. Data.Bifunctor.Joker.Joker g a b -> g b
foreign import instance jokerBifunctor :: (Prelude.Functor g) => Data.Bifunctor.Bifunctor (Data.Bifunctor.Joker.Joker g)
foreign import instance jokerFunctor :: (Prelude.Functor g) => Prelude.Functor (Data.Bifunctor.Joker.Joker g a)
foreign import instance jokerBiapply :: (Prelude.Apply g) => Control.Biapply.Biapply (Data.Bifunctor.Joker.Joker g)
foreign import instance jokerBiapplicative :: (Prelude.Applicative g) => Control.Biapplicative.Biapplicative (Data.Bifunctor.Joker.Joker g)