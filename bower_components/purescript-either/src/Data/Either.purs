module Data.Either where

import Prelude

import Control.Alt (Alt)
import Control.Extend (Extend)
import Data.Bifoldable (Bifoldable)
import Data.Bifunctor (Bifunctor)
import Data.Bitraversable (Bitraversable)
import Data.Foldable (Foldable)
import Data.Monoid (mempty)
import Data.Traversable (Traversable)

-- | The `Either` type is used to represent a choice between two types of value.
-- |
-- | A common use case for `Either` is error handling, where `Left` is used to
-- | carry an error value and `Right` is used to carry a success value.
data Either a b = Left a | Right b

-- | Takes two functions and an `Either` value, if the value is a `Left` the
-- | inner value is applied to the first function, if the value is a `Right`
-- | the inner value is applied to the second function.
-- |
-- | ``` purescript
-- | either f g (Left x) == f x
-- | either f g (Right y) == g y
-- | ```
either :: forall a b c. (a -> c) -> (b -> c) -> Either a b -> c
either f _ (Left a) = f a
either _ g (Right b) = g b

-- | Returns `true` when the `Either` value was constructed with `Left`.
isLeft :: forall a b. Either a b -> Boolean
isLeft = either (const true) (const false)

-- | Returns `true` when the `Either` value was constructed with `Right`.
isRight :: forall a b. Either a b -> Boolean
isRight = either (const false) (const true)

-- | The `Functor` instance allows functions to transform the contents of a
-- | `Right` with the `<$>` operator:
-- |
-- | ``` purescript
-- | f <$> Right x == Right (f x)
-- | ```
-- |
-- | `Left` values are untouched:
-- |
-- | ``` purescript
-- | f <$> Left y == Left y
-- | ```
instance functorEither :: Functor (Either a) where
  map _ (Left x) = Left x
  map f (Right y) = Right (f y)

instance bifunctorEither :: Bifunctor Either where
  bimap f _ (Left l) = Left (f l)
  bimap _ g (Right r) = Right (g r)

-- | The `Apply` instance allows functions contained within a `Right` to
-- | transform a value contained within a `Right` using the `(<*>)` operator:
-- |
-- | ``` purescript
-- | Right f <*> Right x == Right (f x)
-- | ```
-- |
-- | `Left` values are left untouched:
-- |
-- | ``` purescript
-- | Left f <*> Right x == Left x
-- | Right f <*> Left y == Left y
-- | ```
-- |
-- | Combining `Functor`'s `<$>` with `Apply`'s `<*>` can be used transform a
-- | pure function to take `Either`-typed arguments so `f :: a -> b -> c`
-- | becomes `f :: Either l a -> Either l b -> Either l c`:
-- |
-- | ``` purescript
-- | f <$> Right x <*> Right y == Right (f x y)
-- | ```
-- |
-- | The `Left`-preserving behaviour of both operators means the result of
-- | an expression like the above but where any one of the values is `Left`
-- | means the whole result becomes `Left` also, taking the first `Left` value
-- | found:
-- |
-- | ``` purescript
-- | f <$> Left x <*> Right y == Left x
-- | f <$> Right x <*> Left y == Left y
-- | f <$> Left x <*> Left y == Left x
-- | ```
instance applyEither :: Apply (Either e) where
  apply (Left e) _ = Left e
  apply (Right f) r = f <$> r

-- | The `Applicative` instance enables lifting of values into `Either` with the
-- | `pure` or `return` function (`return` is an alias for `pure`):
-- |
-- | ``` purescript
-- | pure x :: Either _ _ == Right x
-- | return x :: Either _ _ == Right x
-- | ```
-- |
-- | Combining `Functor`'s `<$>` with `Apply`'s `<*>` and `Applicative`'s
-- | `pure` can be used to pass a mixture of `Either` and non-`Either` typed
-- | values to a function that does not usually expect them, by using `pure`
-- | for any value that is not already `Either` typed:
-- |
-- | ``` purescript
-- | f <$> Right x <*> pure y == Right (f x y)
-- | ```
-- |
-- | Even though `pure = Right` it is recommended to use `pure` in situations
-- | like this as it allows the choice of `Applicative` to be changed later
-- | without having to go through and replace `Right` with a new constructor.
instance applicativeEither :: Applicative (Either e) where
  pure = Right

-- | The `Alt` instance allows for a choice to be made between two `Either`
-- | values with the `<|>` operator, where the first `Right` encountered
-- | is taken.
-- |
-- | ``` purescript
-- | Right x <|> Right y == Right x
-- | Left x <|> Right y == Right y
-- | Left x <|> Left y == Left y
-- | ```
instance altEither :: Alt (Either e) where
  alt (Left _) r = r
  alt l        _ = l

-- | The `Bind` instance allows sequencing of `Either` values and functions that
-- | return an `Either` by using the `>>=` operator:
-- |
-- | ``` purescript
-- | Left x >>= f = Left x
-- | Right x >>= f = f x
-- | ```
instance bindEither :: Bind (Either e) where
  bind = either (\e _ -> Left e) (\a f -> f a)

-- | The `Monad` instance guarantees that there are both `Applicative` and
-- | `Bind` instances for `Either`. This also enables the `do` syntactic sugar:
-- |
-- | ``` purescript
-- | do
-- |   x' <- x
-- |   y' <- y
-- |   pure (f x' y')
-- | ```
-- |
-- | Which is equivalent to:
-- |
-- | ``` purescript
-- | x >>= (\x' -> y >>= (\y' -> pure (f x' y')))
-- | ```
instance monadEither :: Monad (Either e)

-- | The `Extend` instance allows sequencing of `Either` values and functions
-- | that accept an `Either` and return a non-`Either` result using the
-- | `<<=` operator.
-- |
-- | ``` purescript
-- | f <<= Left x = Left x
-- | f <<= Right x = Right (f x)
-- | ```
instance extendEither :: Extend (Either e) where
  extend _ (Left y)  = Left y
  extend f x         = Right (f x)

-- | The `Show` instance allows `Either` values to be rendered as a string with
-- | `show` whenever there is an `Show` instance for both type the `Either` can
-- | contain.
instance showEither :: (Show a, Show b) => Show (Either a b) where
  show (Left x) = "Left (" ++ show x ++ ")"
  show (Right y) = "Right (" ++ show y ++ ")"

-- | The `Eq` instance allows `Either` values to be checked for equality with
-- | `==` and inequality with `/=` whenever there is an `Eq` instance for both
-- | types the `Either` can contain.
instance eqEither :: (Eq a, Eq b) => Eq (Either a b) where
  eq (Left a1)  (Left a2)  = a1 == a2
  eq (Right b1) (Right b2) = b1 == b2
  eq _          _          = false

-- | The `Ord` instance allows `Either` values to be compared with
-- | `compare`, `>`, `>=`, `<` and `<=` whenever there is an `Ord` instance for
-- | both types the `Either` can contain.
-- |
-- | Any `Left` value is considered to be less than a `Right` value.
instance ordEither :: (Ord a, Ord b) => Ord (Either a b) where
  compare (Left a1)  (Left a2)  = compare a1 a2
  compare (Right b1) (Right b2) = compare b1 b2
  compare (Left a)   _          = LT
  compare _          (Left b)   = GT

instance boundedEither :: (Bounded a, Bounded b) => Bounded (Either a b) where
  top = Right top
  bottom = Left bottom

instance foldableEither :: Foldable (Either a) where
  foldr _ z (Left _)  = z
  foldr f z (Right x) = f x z
  foldl _ z (Left _)  = z
  foldl f z (Right x) = f z x
  foldMap f (Left _)  = mempty
  foldMap f (Right x) = f x

instance bifoldableEither :: Bifoldable Either where
  bifoldr f _ z (Left a) = f a z
  bifoldr _ g z (Right b) = g b z
  bifoldl f _ z (Left a) = f z a
  bifoldl _ g z (Right b) = g z b
  bifoldMap f _ (Left a) = f a
  bifoldMap _ g (Right b) = g b

instance traversableEither :: Traversable (Either a) where
  traverse _ (Left x)  = pure (Left x)
  traverse f (Right x) = Right <$> f x
  sequence (Left x) = pure (Left x)
  sequence (Right x)  = Right <$> x

instance bitraversableEither :: Bitraversable Either where
  bitraverse f _ (Left a) = Left <$> f a
  bitraverse _ g (Right b) = Right <$> g b
  bisequence (Left a) = Left <$> a
  bisequence (Right b) = Right <$> b
