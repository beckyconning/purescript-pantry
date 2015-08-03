module Data.Distributive (Distributive, cotraverse, collect, distribute) where
import Prelude ()
import Data.Distributive ()
import Data.Identity ()
import Prim ()
import Prelude ()
import Data.Identity ()
--  | Categorical dual of `Traversable`:
--  |
--  | - `distribute` is the dual of `sequence` - it zips an
--  |   arbitrary collection of containers
--  | - `collect` is the dual of `traverse` - it traverses
--  |   an arbitrary collection of values
--  | Categorical dual of `Traversable`:
--  |
--  | - `distribute` is the dual of `sequence` - it zips an
--  |   arbitrary collection of containers
--  | - `collect` is the dual of `traverse` - it traverses
--  |   an arbitrary collection of values
--  | Categorical dual of `Traversable`:
--  |
--  | - `distribute` is the dual of `sequence` - it zips an
--  |   arbitrary collection of containers
--  | - `collect` is the dual of `traverse` - it traverses
--  |   an arbitrary collection of values
--  | Default implementation: `distribute = collect id`
--  | Zip an arbitrary collection of containers and summarize the results
--  | Categorical dual of `Traversable`:
--  |
--  | - `distribute` is the dual of `sequence` - it zips an
--  |   arbitrary collection of containers
--  | - `collect` is the dual of `traverse` - it traverses
--  |   an arbitrary collection of values
--  | Default implementation: `collect f = distribute <<< map f`
class (Prelude.Functor f) <= Distributive f where
  distribute :: forall a g. (Prelude.Functor g) => g (f a) -> f (g a)
  collect :: forall a b g. (Prelude.Functor g) => (a -> f b) -> g a -> f (g b)
foreign import cotraverse :: forall a b f g. (Data.Distributive.Distributive f, Prelude.Functor g) => (g a -> b) -> g (f a) -> f b
foreign import instance distributiveIdentity :: Data.Distributive.Distributive Data.Identity.Identity
foreign import instance distributiveFunction :: Data.Distributive.Distributive (Prim.Function e)