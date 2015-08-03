module Data.JSON (Pair(), JParser(), JArray(), JObject(), JValue(JObject, JArray, JString, JNumber, JInt, JBool, JNull), ToJSON, FromJSON, object, (.=), encode, toJSON, (.!=), (.:?), (.:), eitherDecode, decode, fail, parseJSON) where
import Prelude ()
import Data.JSON ()
import Data.Int ()
import Data.Maybe ()
import Data.Traversable ()
import Data.List ()
import Data.Map ()
import Data.Set ()
import Data.Function ()
import Data.Either ()
import Data.Tuple ()
import Prim ()
import Prelude ()
import Data.Map ()
import Data.Set ()
import Data.Either ()
import Data.Int ()
import Data.Maybe ()
import Data.Function ()
import Data.Tuple ()
import Data.Traversable ()
import Data.List ()
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
type Pair = Data.Tuple.Tuple Prim.String Data.JSON.JValue
type JParser = Data.Either.Either Prim.String
type JArray = Prim.Array Data.JSON.JValue
type JObject = Data.Map.Map Prim.String Data.JSON.JValue
data JValue = JObject Data.JSON.JObject | JArray Data.JSON.JArray | JString Prim.String | JNumber Prim.Number | JInt Prim.Int | JBool Prim.Boolean | JNull 
class ToJSON a where
  toJSON :: a -> Data.JSON.JValue
class FromJSON a where
  parseJSON :: Data.JSON.JValue -> Data.JSON.JParser a
foreign import object :: Prim.Array Data.JSON.Pair -> Data.JSON.JValue
foreign import (.=) :: forall a. (Data.JSON.ToJSON a) => Prim.String -> a -> Data.JSON.Pair
foreign import encode :: forall a. (Data.JSON.ToJSON a) => a -> Prim.String
foreign import (.!=) :: forall a. Data.JSON.JParser (Data.Maybe.Maybe a) -> a -> Data.JSON.JParser a
foreign import (.:?) :: forall a. (Data.JSON.FromJSON a) => Data.JSON.JObject -> Prim.String -> Data.JSON.JParser (Data.Maybe.Maybe a)
foreign import (.:) :: forall a. (Data.JSON.FromJSON a) => Data.JSON.JObject -> Prim.String -> Data.JSON.JParser a
foreign import eitherDecode :: forall a. (Data.JSON.FromJSON a) => Prim.String -> Data.Either.Either Prim.String a
foreign import decode :: forall a. (Data.JSON.FromJSON a) => Prim.String -> Data.Maybe.Maybe a
foreign import fail :: forall a. Prim.String -> Data.JSON.JParser a
foreign import instance showValue :: Prelude.Show Data.JSON.JValue
foreign import instance eqValue :: Prelude.Eq Data.JSON.JValue
foreign import instance valueFromJSON :: Data.JSON.FromJSON Data.JSON.JValue
foreign import instance boolFromJSON :: Data.JSON.FromJSON Prim.Boolean
foreign import instance numberFromJSON :: Data.JSON.FromJSON Prim.Number
foreign import instance intFromJSON :: Data.JSON.FromJSON Prim.Int
foreign import instance unitFromJSON :: Data.JSON.FromJSON Prelude.Unit
foreign import instance stringFromJSON :: Data.JSON.FromJSON Prim.String
foreign import instance arrayFromJSON :: (Data.JSON.FromJSON a) => Data.JSON.FromJSON (Prim.Array a)
foreign import instance tupleFromJSON :: (Data.JSON.FromJSON a, Data.JSON.FromJSON b) => Data.JSON.FromJSON (Data.Tuple.Tuple a b)
foreign import instance eitherFromJSON :: (Data.JSON.FromJSON a, Data.JSON.FromJSON b) => Data.JSON.FromJSON (Data.Either.Either a b)
foreign import instance maybeFromJSON :: (Data.JSON.FromJSON a) => Data.JSON.FromJSON (Data.Maybe.Maybe a)
foreign import instance setFromJSON :: (Prelude.Ord a, Data.JSON.FromJSON a) => Data.JSON.FromJSON (Data.Set.Set a)
foreign import instance mapFromJSON :: (Data.JSON.FromJSON a) => Data.JSON.FromJSON (Data.Map.Map Prim.String a)
foreign import instance boolToJSON :: Data.JSON.ToJSON Prim.Boolean
foreign import instance numberToJSON :: Data.JSON.ToJSON Prim.Number
foreign import instance intToJSON :: Data.JSON.ToJSON Prim.Int
foreign import instance stringToJSON :: Data.JSON.ToJSON Prim.String
foreign import instance unitToJSON :: Data.JSON.ToJSON Prelude.Unit
foreign import instance arrayToJSON :: (Data.JSON.ToJSON a) => Data.JSON.ToJSON (Prim.Array a)
foreign import instance eitherToJSON :: (Data.JSON.ToJSON a, Data.JSON.ToJSON b) => Data.JSON.ToJSON (Data.Either.Either a b)
foreign import instance mapToJSON :: (Data.JSON.ToJSON a) => Data.JSON.ToJSON (Data.Map.Map Prim.String a)
foreign import instance maybeToJSON :: (Data.JSON.ToJSON a) => Data.JSON.ToJSON (Data.Maybe.Maybe a)
foreign import instance setToJSON :: (Data.JSON.ToJSON a) => Data.JSON.ToJSON (Data.Set.Set a)
foreign import instance tupleToJSON :: (Data.JSON.ToJSON a, Data.JSON.ToJSON b) => Data.JSON.ToJSON (Data.Tuple.Tuple a b)
foreign import instance valueToJSON :: Data.JSON.ToJSON Data.JSON.JValue