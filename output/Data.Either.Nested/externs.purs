module Data.Either.Nested (Either10(), Either9(), Either8(), Either7(), Either6(), Either5(), Either4(), Either3(), Either2(), either10, either9, either8, either7, either6, either5, either4, either3, either2, either10of10, either9of10, either8of10, either7of10, either6of10, either5of10, either4of10, either3of10, either2of10, either1of10, either9of9, either8of9, either7of9, either6of9, either5of9, either4of9, either3of9, either2of9, either1of9, either8of8, either7of8, either6of8, either5of8, either4of8, either3of8, either2of8, either1of8, either7of7, either6of7, either5of7, either4of7, either3of7, either2of7, either1of7, either6of6, either5of6, either4of6, either3of6, either2of6, either1of6, either5of5, either4of5, either3of5, either2of5, either1of5, either4of4, either3of4, either2of4, either1of4, either3of3, either2of3, either1of3, either2of2, either1of2) where
import Data.Either ()
import Data.Either.Nested ()
import Prim ()
import Prelude ()
import Data.Either ()
--  Either9
--  Either8
--  Either7
--  Either6
--  Either5
--  Either4
--  Either3
--  Either2
--  Either10
type Either10 (a :: *) (b :: *) (c :: *) (d :: *) (e :: *) (f :: *) (g :: *) (h :: *) (i :: *) (z :: *) = Data.Either.Either (Data.Either.Nested.Either9 a b c d e f g h i) z
type Either9 (a :: *) (b :: *) (c :: *) (d :: *) (e :: *) (f :: *) (g :: *) (h :: *) (z :: *) = Data.Either.Either (Data.Either.Nested.Either8 a b c d e f g h) z
type Either8 (a :: *) (b :: *) (c :: *) (d :: *) (e :: *) (f :: *) (g :: *) (z :: *) = Data.Either.Either (Data.Either.Nested.Either7 a b c d e f g) z
type Either7 (a :: *) (b :: *) (c :: *) (d :: *) (e :: *) (f :: *) (z :: *) = Data.Either.Either (Data.Either.Nested.Either6 a b c d e f) z
type Either6 (a :: *) (b :: *) (c :: *) (d :: *) (e :: *) (z :: *) = Data.Either.Either (Data.Either.Nested.Either5 a b c d e) z
type Either5 (a :: *) (b :: *) (c :: *) (d :: *) (z :: *) = Data.Either.Either (Data.Either.Nested.Either4 a b c d) z
type Either4 (a :: *) (b :: *) (c :: *) (z :: *) = Data.Either.Either (Data.Either.Nested.Either3 a b c) z
type Either3 (a :: *) (b :: *) (z :: *) = Data.Either.Either (Data.Either.Nested.Either2 a b) z
type Either2 (a :: *) (z :: *) = Data.Either.Either a z
foreign import either10 :: forall a b c d e f g h i j z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> (j -> z) -> Data.Either.Nested.Either10 a b c d e f g h i j -> z
foreign import either9 :: forall a b c d e f g h i z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> (i -> z) -> Data.Either.Nested.Either9 a b c d e f g h i -> z
foreign import either8 :: forall a b c d e f g h z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> (h -> z) -> Data.Either.Nested.Either8 a b c d e f g h -> z
foreign import either7 :: forall a b c d e f g z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> (g -> z) -> Data.Either.Nested.Either7 a b c d e f g -> z
foreign import either6 :: forall a b c d e f z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> (f -> z) -> Data.Either.Nested.Either6 a b c d e f -> z
foreign import either5 :: forall a b c d e z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> (e -> z) -> Data.Either.Nested.Either5 a b c d e -> z
foreign import either4 :: forall a b c d z. (a -> z) -> (b -> z) -> (c -> z) -> (d -> z) -> Data.Either.Nested.Either4 a b c d -> z
foreign import either3 :: forall a b c z. (a -> z) -> (b -> z) -> (c -> z) -> Data.Either.Nested.Either3 a b c -> z
foreign import either2 :: forall a b z. (a -> z) -> (b -> z) -> Data.Either.Nested.Either2 a b -> z
foreign import either10of10 :: forall a b c d e f g h i j. j -> Data.Either.Nested.Either10 a b c d e f g h i j
foreign import either9of10 :: forall a b c d e f g h i j. i -> Data.Either.Nested.Either10 a b c d e f g h i j
foreign import either8of10 :: forall a b c d e f g h i j. h -> Data.Either.Nested.Either10 a b c d e f g h i j
foreign import either7of10 :: forall a b c d e f g h i j. g -> Data.Either.Nested.Either10 a b c d e f g h i j
foreign import either6of10 :: forall a b c d e f g h i j. f -> Data.Either.Nested.Either10 a b c d e f g h i j
foreign import either5of10 :: forall a b c d e f g h i j. e -> Data.Either.Nested.Either10 a b c d e f g h i j
foreign import either4of10 :: forall a b c d e f g h i j. d -> Data.Either.Nested.Either10 a b c d e f g h i j
foreign import either3of10 :: forall a b c d e f g h i j. c -> Data.Either.Nested.Either10 a b c d e f g h i j
foreign import either2of10 :: forall a b c d e f g h i j. b -> Data.Either.Nested.Either10 a b c d e f g h i j
foreign import either1of10 :: forall a b c d e f g h i j. a -> Data.Either.Nested.Either10 a b c d e f g h i j
foreign import either9of9 :: forall a b c d e f g h i. i -> Data.Either.Nested.Either9 a b c d e f g h i
foreign import either8of9 :: forall a b c d e f g h i. h -> Data.Either.Nested.Either9 a b c d e f g h i
foreign import either7of9 :: forall a b c d e f g h i. g -> Data.Either.Nested.Either9 a b c d e f g h i
foreign import either6of9 :: forall a b c d e f g h i. f -> Data.Either.Nested.Either9 a b c d e f g h i
foreign import either5of9 :: forall a b c d e f g h i. e -> Data.Either.Nested.Either9 a b c d e f g h i
foreign import either4of9 :: forall a b c d e f g h i. d -> Data.Either.Nested.Either9 a b c d e f g h i
foreign import either3of9 :: forall a b c d e f g h i. c -> Data.Either.Nested.Either9 a b c d e f g h i
foreign import either2of9 :: forall a b c d e f g h i. b -> Data.Either.Nested.Either9 a b c d e f g h i
foreign import either1of9 :: forall a b c d e f g h i. a -> Data.Either.Nested.Either9 a b c d e f g h i
foreign import either8of8 :: forall a b c d e f g h. h -> Data.Either.Nested.Either8 a b c d e f g h
foreign import either7of8 :: forall a b c d e f g h. g -> Data.Either.Nested.Either8 a b c d e f g h
foreign import either6of8 :: forall a b c d e f g h. f -> Data.Either.Nested.Either8 a b c d e f g h
foreign import either5of8 :: forall a b c d e f g h. e -> Data.Either.Nested.Either8 a b c d e f g h
foreign import either4of8 :: forall a b c d e f g h. d -> Data.Either.Nested.Either8 a b c d e f g h
foreign import either3of8 :: forall a b c d e f g h. c -> Data.Either.Nested.Either8 a b c d e f g h
foreign import either2of8 :: forall a b c d e f g h. b -> Data.Either.Nested.Either8 a b c d e f g h
foreign import either1of8 :: forall a b c d e f g h. a -> Data.Either.Nested.Either8 a b c d e f g h
foreign import either7of7 :: forall a b c d e f g. g -> Data.Either.Nested.Either7 a b c d e f g
foreign import either6of7 :: forall a b c d e f g. f -> Data.Either.Nested.Either7 a b c d e f g
foreign import either5of7 :: forall a b c d e f g. e -> Data.Either.Nested.Either7 a b c d e f g
foreign import either4of7 :: forall a b c d e f g. d -> Data.Either.Nested.Either7 a b c d e f g
foreign import either3of7 :: forall a b c d e f g. c -> Data.Either.Nested.Either7 a b c d e f g
foreign import either2of7 :: forall a b c d e f g. b -> Data.Either.Nested.Either7 a b c d e f g
foreign import either1of7 :: forall a b c d e f g. a -> Data.Either.Nested.Either7 a b c d e f g
foreign import either6of6 :: forall a b c d e f. f -> Data.Either.Nested.Either6 a b c d e f
foreign import either5of6 :: forall a b c d e f. e -> Data.Either.Nested.Either6 a b c d e f
foreign import either4of6 :: forall a b c d e f. d -> Data.Either.Nested.Either6 a b c d e f
foreign import either3of6 :: forall a b c d e f. c -> Data.Either.Nested.Either6 a b c d e f
foreign import either2of6 :: forall a b c d e f. b -> Data.Either.Nested.Either6 a b c d e f
foreign import either1of6 :: forall a b c d e f. a -> Data.Either.Nested.Either6 a b c d e f
foreign import either5of5 :: forall a b c d e. e -> Data.Either.Nested.Either5 a b c d e
foreign import either4of5 :: forall a b c d e. d -> Data.Either.Nested.Either5 a b c d e
foreign import either3of5 :: forall a b c d e. c -> Data.Either.Nested.Either5 a b c d e
foreign import either2of5 :: forall a b c d e. b -> Data.Either.Nested.Either5 a b c d e
foreign import either1of5 :: forall a b c d e. a -> Data.Either.Nested.Either5 a b c d e
foreign import either4of4 :: forall a b c d. d -> Data.Either.Nested.Either4 a b c d
foreign import either3of4 :: forall a b c d. c -> Data.Either.Nested.Either4 a b c d
foreign import either2of4 :: forall a b c d. b -> Data.Either.Nested.Either4 a b c d
foreign import either1of4 :: forall a b c d. a -> Data.Either.Nested.Either4 a b c d
foreign import either3of3 :: forall a b c. c -> Data.Either.Nested.Either3 a b c
foreign import either2of3 :: forall a b c. b -> Data.Either.Nested.Either3 a b c
foreign import either1of3 :: forall a b c. a -> Data.Either.Nested.Either3 a b c
foreign import either2of2 :: forall a b. b -> Data.Either.Nested.Either2 a b
foreign import either1of2 :: forall a b. a -> Data.Either.Nested.Either2 a b