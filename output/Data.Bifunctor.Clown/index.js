// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var Control_Biapplicative = require("Control.Biapplicative");
var Control_Biapply = require("Control.Biapply");
var Data_Bifunctor = require("Data.Bifunctor");
var Clown = (function () {
    function Clown(value0) {
        this.value0 = value0;
    };
    Clown.create = function (value0) {
        return new Clown(value0);
    };
    return Clown;
})();
var runClown = function (_182) {
    return _182.value0;
};
var clownFunctor = new Prelude.Functor(function (_184) {
    return Prelude["<<<"](Prelude.semigroupoidFn)(Clown.create)(runClown);
});
var clownBifunctor = function (__dict_Functor_0) {
    return new Data_Bifunctor.Bifunctor(function (f) {
        return function (_183) {
            return Prelude["<<<"](Prelude.semigroupoidFn)(Clown.create)(Prelude["<<<"](Prelude.semigroupoidFn)(Prelude.map(__dict_Functor_0)(f))(runClown));
        };
    });
};
var clownBiapply = function (__dict_Apply_1) {
    return new Control_Biapply.Biapply(function () {
        return clownBifunctor(__dict_Apply_1["__superclass_Prelude.Functor_0"]());
    }, function (_185) {
        return function (_186) {
            return new Clown(Prelude["<*>"](__dict_Apply_1)(_185.value0)(_186.value0));
        };
    });
};
var clownBiapplicative = function (__dict_Applicative_2) {
    return new Control_Biapplicative.Biapplicative(function () {
        return clownBiapply(__dict_Applicative_2["__superclass_Prelude.Apply_0"]());
    }, function (a) {
        return function (_187) {
            return new Clown(Prelude.pure(__dict_Applicative_2)(a));
        };
    });
};
module.exports = {
    Clown: Clown, 
    runClown: runClown, 
    clownBifunctor: clownBifunctor, 
    clownFunctor: clownFunctor, 
    clownBiapply: clownBiapply, 
    clownBiapplicative: clownBiapplicative
};
