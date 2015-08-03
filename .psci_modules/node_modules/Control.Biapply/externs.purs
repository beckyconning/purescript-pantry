module Control.Biapply (Biapply, bilift3, bilift2, (<<*), (*>>), (<<*>>), biapply, (<<$>>)) where
import Prelude ()
import Control.Biapply ()
import Data.Bifunctor ()
import Prim ()
import Prelude ()
import Data.Bifunctor ()
--  | `Biapply` captures type constructors of two arguments which support lifting of
--  | functions of one or more arguments, in the sense of `Apply`.
--  | `Biapply` captures type constructors of two arguments which support lifting of
--  | functions of one or more arguments, in the sense of `Apply`.
infixl 4 <<$>>
infixl 4 <<*>>
infixl 4 <<*
infixl 4 *>>
--  | A convenience function which can be used to apply the result of `bipure` in
--  | the style of `Applicative`:
--  |
--  | ```purescript
--  | bipure f g <<$>> x <<*>> y
--  | ```
--  | `Biapply` captures type constructors of two arguments which support lifting of
--  | functions of one or more arguments, in the sense of `Apply`.
--  | An infix version of `biapply`.
--  | Lift a function of two arguments.
--  | Lift a function of three arguments.
--  | Keep the results of the second computation
--  | Keep the results of the first computation
class (Data.Bifunctor.Bifunctor w) <= Biapply w where
  biapply :: forall a b c d. w (a -> b) (c -> d) -> w a c -> w b d
foreign import bilift3 :: forall w a b c d e f g h. (Control.Biapply.Biapply w) => (a -> b -> c -> d) -> (e -> f -> g -> h) -> w a e -> w b f -> w c g -> w d h
foreign import bilift2 :: forall w a b c d e f. (Control.Biapply.Biapply w) => (a -> b -> c) -> (d -> e -> f) -> w a d -> w b e -> w c f
foreign import (<<*) :: forall w a b c d. (Control.Biapply.Biapply w) => w a b -> w c d -> w a b
foreign import (*>>) :: forall w a b c d. (Control.Biapply.Biapply w) => w a b -> w c d -> w c d
foreign import (<<*>>) :: forall w a b c d. (Control.Biapply.Biapply w) => w (a -> b) (c -> d) -> w a c -> w b d
foreign import (<<$>>) :: forall a b. (a -> b) -> a -> b