# purescript-either

[![Build Status](https://travis-ci.org/purescript/purescript-either.svg?branch=master)](https://travis-ci.org/purescript/purescript-either)

The `Either` type provides is used to represent values that can be one of two possibilities. For example, `Either Int Number` can be used in a place where either integers or floating point numbers are acceptable.

A common use for this type is error handling, where by convention the `Left` constructor carries error messages and the `Right` constructor carries expected values (“`Right` is right”). This convention is used as the `Functor`, `Applicative`, `Monad`, etc. instances all operate on the `Right` part of the `Either`.

## Installation

```
bower install purescript-either
```

## Module documentation

- [Data.Either](docs/Data.Either.md)
- [Data.Either.Nested](docs/Data.Either.Nested.md)
- [Data.Either.Unsafe](docs/Data.Either.Unsafe.md)
