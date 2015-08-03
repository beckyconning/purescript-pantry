module Main where

import Control.Monad.Eff.Console

--preserves :: Signal (Array Preserve)
--preserves = do
--  view <- getView couchDbUri dbName docLabel
--  return $ Pantry.contents (map decodePreserve (map _.doc view.rows))
--                           (getChangeNotificationResults couchDbUri dbName docLabel view.update_seq)
--                           (readJSON <<< getDoc couchDbUri dbName)

--contents :: forall a b m f g. (Functor f, Monad m) => Array (Doc a)
--                                                   -> f (Array (ChangeNotificationResult))
--                                                   -> (String -> String -> m (Either b (Doc a)))
--                                                   -> f (Either b (Array (Doc a)))

main = do
  log "Hello sailor!"
