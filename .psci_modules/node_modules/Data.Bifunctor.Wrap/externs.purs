module Data.Bifunctor.Wrap (Wrap(Wrap), unwrap) where
import Prelude ()
import Data.Bifunctor ()
import Data.Bifunctor.Wrap ()
import Control.Biapply ()
import Control.Biapplicative ()
import Prim ()
import Prelude ()
import Control.Biapplicative ()
import Control.Biapply ()
import Data.Bifunctor ()
--  | A `newtype` wrapper which provides a `Functor` over the second argument of
--  | a `Bifunctor`
--  | Remove the `Wrap` constructor.
data Wrap (p :: * -> * -> *) (a :: *) (b :: *) = Wrap (p a b)
foreign import unwrap :: forall p a b. Data.Bifunctor.Wrap.Wrap p a b -> p a b
foreign import instance wrapBifunctor :: (Data.Bifunctor.Bifunctor p) => Data.Bifunctor.Bifunctor (Data.Bifunctor.Wrap.Wrap p)
foreign import instance wrapFunctor :: (Data.Bifunctor.Bifunctor p) => Prelude.Functor (Data.Bifunctor.Wrap.Wrap p a)
foreign import instance wrapBiapply :: (Control.Biapply.Biapply p) => Control.Biapply.Biapply (Data.Bifunctor.Wrap.Wrap p)
foreign import instance wrapBiapplicative :: (Control.Biapplicative.Biapplicative p) => Control.Biapplicative.Biapplicative (Data.Bifunctor.Wrap.Wrap p)