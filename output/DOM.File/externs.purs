module DOM.File (Blob(), FileReader(), FileList(), File()) where
import Prim ()
--  | A `File` object instance.
--  | A `FileList` object instance.
--  | A `FileReader` object instance.
--  | A `Blob` object instance.
foreign import data Blob :: *
foreign import data FileReader :: *
foreign import data FileList :: *
foreign import data File :: *