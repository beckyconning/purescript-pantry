module Test.Unit.Console (TestOutput(), printPass, printFail, printLabel, print, eraseLine, restorePos, savePos, consoleError, consoleLog, hasStderr) where
import Prim ()
import Prelude ()
import Control.Monad.Eff ()
foreign import data TestOutput :: !
foreign import printPass :: forall e. Prim.String -> Control.Monad.Eff.Eff (testOutput :: Test.Unit.Console.TestOutput | e) Prelude.Unit
foreign import printFail :: forall e. Prim.String -> Control.Monad.Eff.Eff (testOutput :: Test.Unit.Console.TestOutput | e) Prelude.Unit
foreign import printLabel :: forall e. Prim.String -> Control.Monad.Eff.Eff (testOutput :: Test.Unit.Console.TestOutput | e) Prelude.Unit
foreign import print :: forall e. Prim.String -> Control.Monad.Eff.Eff (testOutput :: Test.Unit.Console.TestOutput | e) Prelude.Unit
foreign import eraseLine :: forall e. Control.Monad.Eff.Eff (testOutput :: Test.Unit.Console.TestOutput | e) Prelude.Unit
foreign import restorePos :: forall e. Control.Monad.Eff.Eff (testOutput :: Test.Unit.Console.TestOutput | e) Prelude.Unit
foreign import savePos :: forall e. Control.Monad.Eff.Eff (testOutput :: Test.Unit.Console.TestOutput | e) Prelude.Unit
foreign import consoleError :: forall e. Prim.String -> Control.Monad.Eff.Eff (testOutput :: Test.Unit.Console.TestOutput | e) Prelude.Unit
foreign import consoleLog :: forall e. Prim.String -> Control.Monad.Eff.Eff (testOutput :: Test.Unit.Console.TestOutput | e) Prelude.Unit
foreign import hasStderr :: Prim.Boolean