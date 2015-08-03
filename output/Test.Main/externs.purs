module Test.Main (ChangeNotification(ChangeNotification), ChangeNotificationResult(ChangeNotificationResult), EmptyDoc(EmptyDoc), Doc(Doc), main, f, runEmptyDoc) where
import Test.QuickCheck.Arbitrary ()
import Test.Signal ()
import Prelude ()
import Signal ()
import Test.QuickCheck.Gen ()
import Control.Monad.Eff ()
import Test.Unit ()
import Test.Main ()
import Prim ()
import Prelude ()
import Control.Apply ()
import Control.Monad.Eff ()
import Control.Monad.Eff.Console ()
import Data.Identity ()
import Data.Traversable ()
import Signal ()
import Signal.Channel ()
import Test.QuickCheck.Gen ()
import Test.QuickCheck.Arbitrary ()
import Test.Signal ()
import Test.Unit ()
newtype ChangeNotification = ChangeNotification { results :: Prim.Array Test.Main.ChangeNotificationResult, last_seq :: Prim.Int }
newtype ChangeNotificationResult = ChangeNotificationResult { changes :: Prim.Array Prim.String, id :: Prim.String }
newtype EmptyDoc = EmptyDoc (Test.Main.Doc ())
newtype Doc (a :: # *) = Doc { _rev :: Prim.String, _id :: Prim.String | a }
foreign import main :: forall t57. Control.Monad.Eff.Eff (testOutput :: Test.Unit.Console.TestOutput, random :: Control.Monad.Eff.Random.RANDOM | t57) Prelude.Unit
foreign import f :: forall a. Prim.Array Test.Main.EmptyDoc -> Signal.Signal (Prim.Array Test.Main.EmptyDoc)
foreign import runEmptyDoc :: Test.Main.EmptyDoc -> Test.Main.Doc ()
foreign import instance arbDoc :: Test.QuickCheck.Arbitrary.Arbitrary Test.Main.EmptyDoc
foreign import instance eqbDoc :: Prelude.Eq Test.Main.EmptyDoc
foreign import instance arbChangeNotificationResult :: Test.QuickCheck.Arbitrary.Arbitrary Test.Main.ChangeNotificationResult
foreign import instance arbChangeNotification :: Test.QuickCheck.Arbitrary.Arbitrary Test.Main.ChangeNotification
foreign import instance arbSignal :: (Test.QuickCheck.Arbitrary.Arbitrary a) => Test.QuickCheck.Arbitrary.Arbitrary (Signal.Signal a)
foreign import instance arbIdentity :: (Test.QuickCheck.Arbitrary.Arbitrary a) => Test.QuickCheck.Arbitrary.Arbitrary (Data.Identity.Identity a)