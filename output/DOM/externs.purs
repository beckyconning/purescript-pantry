module DOM (NodeList(), Node(), Document(), DOM()) where
import Prim ()
--  | Effect type for DOM maniupulation
--  | General type for DOM documents.
--  | General type for DOM nodes.
--  | General type for DOM node lists.
foreign import data NodeList :: *
foreign import data Node :: *
foreign import data Document :: *
foreign import data DOM :: !