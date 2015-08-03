module Data.Bifunctor.Join (Join(Join), runJoin) where
import Prelude ()
import Data.Bifunctor ()
import Data.Bifunctor.Join ()
import Control.Biapply ()
import Control.Biapplicative ()
import Prim ()
import Prelude ()
import Control.Biapplicative ()
import Control.Biapply ()
import Data.Bifunctor ()
--  | `Join` turns a `Bifunctor` into a `Functor` by equating the
--  | two type arguments.
--  | Remove the `Join` constructor.
data Join (p :: * -> * -> *) (a :: *) = Join (p a a)
foreign import runJoin :: forall p a. Data.Bifunctor.Join.Join p a -> p a a
foreign import instance joinFunctor :: (Data.Bifunctor.Bifunctor p) => Prelude.Functor (Data.Bifunctor.Join.Join p)
foreign import instance joinApply :: (Control.Biapply.Biapply p) => Prelude.Apply (Data.Bifunctor.Join.Join p)
foreign import instance joinApplicative :: (Control.Biapplicative.Biapplicative p) => Prelude.Applicative (Data.Bifunctor.Join.Join p)