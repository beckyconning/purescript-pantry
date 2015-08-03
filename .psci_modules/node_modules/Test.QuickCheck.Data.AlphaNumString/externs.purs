module Test.QuickCheck.Data.AlphaNumString (AlphaNumString(AlphaNumString), runAlphaNumString) where
import Data.String ()
import Test.QuickCheck.Gen ()
import Prelude ()
import Test.QuickCheck.Arbitrary ()
import Prim ()
import Prelude ()
import Data.Int ()
import Data.String ()
import Data.String.Unsafe ()
import Math ()
import Test.QuickCheck.Gen ()
import Test.QuickCheck.Arbitrary ()
--  | A newtype for `String` whose `Arbitrary` instance generated random
--  | alphanumeric strings.
newtype AlphaNumString = AlphaNumString Prim.String
foreign import runAlphaNumString :: Test.QuickCheck.Data.AlphaNumString.AlphaNumString -> Prim.String
foreign import instance arbAlphaNumString :: Test.QuickCheck.Arbitrary.Arbitrary Test.QuickCheck.Data.AlphaNumString.AlphaNumString
foreign import instance coarbAlphaNumString :: Test.QuickCheck.Arbitrary.Coarbitrary Test.QuickCheck.Data.AlphaNumString.AlphaNumString