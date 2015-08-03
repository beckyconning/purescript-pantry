module Test.Main where

import Prelude
import Control.Apply
import Control.Monad.Eff
import Control.Monad.Eff.Console
import Data.Identity
import Data.Traversable
import Signal
import Signal.Channel
import Test.QuickCheck.Gen
import Test.QuickCheck.Arbitrary
import Test.Signal
import Test.Unit

newtype Doc a = Doc { _id :: String, _rev :: String | a }

newtype EmptyDoc = EmptyDoc (Doc ())

runEmptyDoc :: EmptyDoc -> Doc ()
runEmptyDoc (EmptyDoc doc) = doc

newtype ChangeNotificationResult = ChangeNotificationResult { id :: String, changes :: Array String }

newtype ChangeNotification = ChangeNotification { last_seq :: Int, results :: Array ChangeNotificationResult }

instance arbDoc :: Arbitrary EmptyDoc where
  arbitrary = (EmptyDoc `compose` Doc) `map`
    ({ _id: _, _rev: _ } `map` arbitrary `apply` arbitrary)

instance eqbDoc :: Eq EmptyDoc where
  eq (EmptyDoc (Doc x)) (EmptyDoc (Doc y)) = (x._id `eq` y._id) `conj` (x._rev `eq` y._rev)

instance arbChangeNotificationResult :: Arbitrary ChangeNotificationResult where
  arbitrary = ChangeNotificationResult `map`
    ({ id: _, changes: _ } `map` arbitrary `apply` arbitrary)

instance arbChangeNotification :: Arbitrary ChangeNotification where
  arbitrary = ChangeNotification `map`
    ({ last_seq: _, results: _ } `map` arbitrary `apply` arbitrary)

instance arbSignal :: (Arbitrary a) => Arbitrary (Signal a) where
  arbitrary = unsafeFromArray `map` arbitrary

instance arbIdentity :: (Arbitrary a) => Arbitrary (Identity a) where
  arbitrary = Identity <$> arbitrary

f :: forall a. Array EmptyDoc -> Signal (Array EmptyDoc)
f xs = constant xs

main = do
  allDocArrays <- (randomSample' 100 (arbitrary :: Gen (Array EmptyDoc)))
  foreachE allDocArrays (\docArray -> runTest do
    test "contents" do
      assertFn "should have the value of the initially provided array" \done -> do
        runSignal $ f docArray ~> done `compose` (/= docArray))

--preserves :: Signal (Array Preserve)
--preserves = do
--  view <- getView couchDbUri dbName docLabel
--  return $ Pantry.contents (map decodePreserve (map _.doc view.rows))
--                           (getChangeNotificationResults couchDbUri dbName docLabel view.update_seq)
--                           (readJSON <<< getDoc couchDbUri dbName)

--contents :: forall a b m. (Monad m) => Array (Doc a)
--                                    -> Signal (Array (ChangeNotificationResult))
--                                    -> (String -> String -> m (Either b (Doc a)))
--                                    -> Signal (Either b (Array (Doc a)))
