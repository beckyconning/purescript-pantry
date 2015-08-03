module Data.Bitraversable (Bitraversable, bifor, bisequence, bitraverse) where
import Data.Bitraversable ()
import Prim ()
import Prelude ()
import Data.Bifoldable ()
import Data.Bifunctor ()
--  | `Bitraversable` represents data structures with two type arguments which can be
--  | traversed.
--  |
--  | A traversal for such a structure requires two functions, one for each type
--  | argument. Type class instances should choose the appropriate function based
--  | on the type of the element encountered at each point of the traversal.
--  |
--  | `Bitraversable` represents data structures with two type arguments which can be
--  | traversed.
--  |
--  | A traversal for such a structure requires two functions, one for each type
--  | argument. Type class instances should choose the appropriate function based
--  | on the type of the element encountered at each point of the traversal.
--  |
--  | `Bitraversable` represents data structures with two type arguments which can be
--  | traversed.
--  |
--  | A traversal for such a structure requires two functions, one for each type
--  | argument. Type class instances should choose the appropriate function based
--  | on the type of the element encountered at each point of the traversal.
--  |
--  | `Bitraversable` represents data structures with two type arguments which can be
--  | traversed.
--  |
--  | A traversal for such a structure requires two functions, one for each type
--  | argument. Type class instances should choose the appropriate function based
--  | on the type of the element encountered at each point of the traversal.
--  |
--  | Traverse a data structure, accumulating effects and results using an `Applicative` functor.
class (Data.Bifunctor.Bifunctor t, Data.Bifoldable.Bifoldable t) <= Bitraversable t where
  bitraverse :: forall f a b c d. (Prelude.Applicative f) => (a -> f c) -> (b -> f d) -> t a b -> f (t c d)
  bisequence :: forall f a b. (Prelude.Applicative f) => t (f a) (f b) -> f (t a b)
foreign import bifor :: forall t f a b c d. (Data.Bitraversable.Bitraversable t, Prelude.Applicative f) => t a b -> (a -> f c) -> (b -> f d) -> f (t c d)