module Math (Radians(), sqrt2, sqrt1_2, pi, log10e, log2e, ln10, ln2, e, (%), tan, sqrt, sin, round, pow, min, max, log, floor, exp, cos, ceil, atan2, atan, asin, acos, abs) where
import Prim ()
--  | An alias to make types in this module more explicit.
infixl 7 %
--  | Returns the absolute value of the argument.
--  | Returns the inverse cosine of the argument.
--  | Returns the inverse sine of the argument.
--  | Returns the inverse tangent of the argument.
--  | Four-quadrant tangent inverse. Given the arguments `y` and `x`, returns
--  | the inverse tangent of `y / x`, where the signs of both arguments are used
--  | to determine the sign of the result.
--  | If the first argument is negative, the result will be negative.
--  | The result is the angle between the positive x axis and  a point `(x, y)`.
--  | Returns the smallest integer not smaller than the argument.
--  | Returns the cosine of the argument.
--  | Returns `e` exponentiated to the power of the argument.
--  | Returns the largest integer not larger than the argument.
--  | Returns the natural logarithm of a number.
--  | Returns the largest of two numbers.
--  | Returns the smallest of two numbers.
--  | Return  the first argument exponentiated to the power of the second argument.
--  | Returns the integer closest to the argument.
--  | Returns the sine of the argument.
--  | Returns the square root of the argument.
--  | Returns the tangent of the argument.
--  | Computes the remainder after division, wrapping Javascript's `%` operator.
--  | The base of natural logarithms, *e*, around 2.71828.
--  | The natural logarithm of 2, around 0.6931.
--  | The natural logarithm of 10, around 2.3025.
--  | The base 2 logarithm of `e`, around 1.4426.
--  | Base 10 logarithm of `e`, around 0.43429.
--  | The ratio of the circumference of a circle to its diameter, around 3.14159.
--  | The Square root of one half, around 0.707107.
--  | The square root of two, around 1.41421.
type Radians = Prim.Number
foreign import sqrt2 :: Prim.Number
foreign import sqrt1_2 :: Prim.Number
foreign import pi :: Prim.Number
foreign import log10e :: Prim.Number
foreign import log2e :: Prim.Number
foreign import ln10 :: Prim.Number
foreign import ln2 :: Prim.Number
foreign import e :: Prim.Number
foreign import (%) :: Prim.Number -> Prim.Number -> Prim.Number
foreign import tan :: Math.Radians -> Prim.Number
foreign import sqrt :: Prim.Number -> Prim.Number
foreign import sin :: Math.Radians -> Prim.Number
foreign import round :: Prim.Number -> Prim.Number
foreign import pow :: Prim.Number -> Prim.Number -> Prim.Number
foreign import min :: Prim.Number -> Prim.Number -> Prim.Number
foreign import max :: Prim.Number -> Prim.Number -> Prim.Number
foreign import log :: Prim.Number -> Prim.Number
foreign import floor :: Prim.Number -> Prim.Number
foreign import exp :: Prim.Number -> Prim.Number
foreign import cos :: Math.Radians -> Prim.Number
foreign import ceil :: Prim.Number -> Prim.Number
foreign import atan2 :: Prim.Number -> Prim.Number -> Math.Radians
foreign import atan :: Prim.Number -> Math.Radians
foreign import asin :: Prim.Number -> Math.Radians
foreign import acos :: Prim.Number -> Math.Radians
foreign import abs :: Prim.Number -> Prim.Number