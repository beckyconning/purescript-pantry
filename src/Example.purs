
-- Represents the contents and whether they are being updated in real time or not
-- type Contents = Tuple (Array JObject) Boolean

-- contents :: String -> String -> String -> Signal Contents

module ContentsExample where

import Prelude

import Data.JSON
import Data.Maybe
import Data.Tuple

import Control.Monad.Eff.Console

--import Signal
--import Signal.Loop
--import Signal.Channel

--import qualified Signal.Pantry  as P
--import qualified Data.Pantry    as P
--import qualified Signal.CouchDB as C
--import qualified Data.CouchDB   as C

-- Represents CouchDB document
data Doc a = Doc { _id :: String, _rev :: String, _deleted :: (Maybe Boolean) | a }

newtype Preserve = Preserve (Doc (name :: String, sodium :: Number))

instance preserveFromJSON :: FromJSON Preserve where
  parseJSON (JObject o) = do
    _id       <- o .:  "_id"
    _rev      <- o .:  "_rev"
    _deleted  <- o .:? "_deleted"
    name      <- o .:  "name"
    sodium    <- o .:  "sodium"
    let doc = Doc { _id: _id, _rev: _rev, _deleted: _deleted, name: name, sodium: sodium }
    pure $ Preserve doc
  parseJSON _ = fail "Couldn't parse Preserve"

instance preserveToJSON :: ToJSON Preserve where
  toJSON (Preserve (Doc o)) = object $ [ "_id"    .= o._id
                                         , "_rev"   .= o._rev
                                         , "name"   .= o.name
                                         , "sodium" .= o.sodium
                                         ] <> deleted o._deleted
    where
    deleted (Just true) = [ "_deleted" .= true ]
    deleted _           = []

instance showPreserve :: Show Preserve where
  show (Preserve (Doc doc)) = doc.name ++ "\n---\nSodium: " ++ (show doc.sodium) ++ "g"

--logPreserveDocuments :: forall eff. Array (Document Preserve) -> Eff (console :: CONSOLE | eff) Unit
--logPreserveDocuments = map (log <<< show)

--couchDbUri = "http://localhost:5984"
--dbName = "preserves"
--label = "preserve"

--main = do
--  let preserves' :: Signal Contents
--      preserves' P.contents couchDbUri dbName label
--
--  let preserves :: Signal (Array (Document Preserve))
--      preserves = preserves ~> (parsePreserveDocumentJSON <<< fst)
--
--  let online :: Signal (Array (Document Preserve))
--      online = preserves ~> snd
--
--  runSignal (preserves ~> logPreserveDocuments)
