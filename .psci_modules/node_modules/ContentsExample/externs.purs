module ContentsExample (Preserve(Preserve), Doc(Doc)) where
import Prelude ()
import Data.JSON ()
import Prim ()
import Prelude ()
import Data.JSON ()
import Data.Maybe ()
import Data.Tuple ()
import Control.Monad.Eff.Console ()
-- import Signal
-- import Signal.Loop
-- import Signal.Channel
-- import qualified Signal.Pantry  as P
-- import qualified Data.Pantry    as P
-- import qualified Signal.CouchDB as C
-- import qualified Data.CouchDB   as C
--  Represents CouchDB document
newtype Preserve = Preserve (ContentsExample.Doc (sodium :: Prim.Number, name :: Prim.String))
data Doc (a :: # *) = Doc { _deleted :: Data.Maybe.Maybe Prim.Boolean, _rev :: Prim.String, _id :: Prim.String | a }
foreign import instance preserveFromJSON :: Data.JSON.FromJSON ContentsExample.Preserve
foreign import instance preserveToJSON :: Data.JSON.ToJSON ContentsExample.Preserve
foreign import instance showPreserve :: Prelude.Show ContentsExample.Preserve