module DOM.XHR (ProgressEvent(), FormData(), XMLHttpRequest()) where
import Prim ()
--  | An `XMLHttpRequest` object instance.
--  | A `FormData` object instance.
--  | A `ProgressEvent` object instance.
foreign import data ProgressEvent :: *
foreign import data FormData :: *
foreign import data XMLHttpRequest :: *