module Data.Bifoldable (Bifoldable, biall, biany, bisequence_, bifor_, bitraverse_, bifold, bifoldMap, bifoldl, bifoldr) where
import Data.Bifoldable ()
import Prelude ()
import Control.Apply ()
import Data.Monoid.Disj ()
import Data.Monoid.Conj ()
import Prim ()
import Prelude ()
import Control.Apply ()
import Data.Monoid ()
import Data.Monoid.Disj ()
import Data.Monoid.Conj ()
--  | `Bifoldable` represents data structures with two type arguments which can be
--  | folded.
--  |
--  | A fold for such a structure requires two step functions, one for each type
--  | argument. Type class instances should choose the appropriate step function based
--  | on the type of the element encountered at each point of the fold.
--  |
--  | `Bifoldable` represents data structures with two type arguments which can be
--  | folded.
--  |
--  | A fold for such a structure requires two step functions, one for each type
--  | argument. Type class instances should choose the appropriate step function based
--  | on the type of the element encountered at each point of the fold.
--  |
--  | `Bifoldable` represents data structures with two type arguments which can be
--  | folded.
--  |
--  | A fold for such a structure requires two step functions, one for each type
--  | argument. Type class instances should choose the appropriate step function based
--  | on the type of the element encountered at each point of the fold.
--  |
--  | Traverse a data structure, accumulating effects using an `Applicative` functor,
--  | ignoring the final result.
--  | A version of `bitraverse_` with the data structure as the first argument.
--  | Collapse a data structure, collecting effects using an `Applicative` functor,
--  | ignoring the final result.
--  | `Bifoldable` represents data structures with two type arguments which can be
--  | folded.
--  |
--  | A fold for such a structure requires two step functions, one for each type
--  | argument. Type class instances should choose the appropriate step function based
--  | on the type of the element encountered at each point of the fold.
--  |
--  | `Bifoldable` represents data structures with two type arguments which can be
--  | folded.
--  |
--  | A fold for such a structure requires two step functions, one for each type
--  | argument. Type class instances should choose the appropriate step function based
--  | on the type of the element encountered at each point of the fold.
--  |
--  | Fold a data structure, accumulating values in a monoidal type.
--  | Test whether a predicate holds at any position in a data structure.
--  -- | Test whether a predicate holds at all positions in a data structure.
class Bifoldable p where
  bifoldr :: forall a b c. (a -> c -> c) -> (b -> c -> c) -> c -> p a b -> c
  bifoldl :: forall a b c. (c -> a -> c) -> (c -> b -> c) -> c -> p a b -> c
  bifoldMap :: forall m a b. (Data.Monoid.Monoid m) => (a -> m) -> (b -> m) -> p a b -> m
foreign import biall :: forall t a b c. (Data.Bifoldable.Bifoldable t, Prelude.BooleanAlgebra c) => (a -> c) -> (b -> c) -> t a b -> c
foreign import biany :: forall t a b c. (Data.Bifoldable.Bifoldable t, Prelude.BooleanAlgebra c) => (a -> c) -> (b -> c) -> t a b -> c
foreign import bisequence_ :: forall t f a b. (Data.Bifoldable.Bifoldable t, Prelude.Applicative f) => t (f a) (f b) -> f Prelude.Unit
foreign import bifor_ :: forall t f a b c d. (Data.Bifoldable.Bifoldable t, Prelude.Applicative f) => t a b -> (a -> f c) -> (b -> f d) -> f Prelude.Unit
foreign import bitraverse_ :: forall t f a b c d. (Data.Bifoldable.Bifoldable t, Prelude.Applicative f) => (a -> f c) -> (b -> f d) -> t a b -> f Prelude.Unit
foreign import bifold :: forall t m. (Data.Bifoldable.Bifoldable t, Data.Monoid.Monoid m) => t m m -> m