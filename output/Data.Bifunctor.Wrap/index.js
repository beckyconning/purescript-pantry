// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var Data_Bifunctor = require("Data.Bifunctor");
var Control_Biapply = require("Control.Biapply");
var Control_Biapplicative = require("Control.Biapplicative");
var Wrap = (function () {
    function Wrap(value0) {
        this.value0 = value0;
    };
    Wrap.create = function (value0) {
        return new Wrap(value0);
    };
    return Wrap;
})();
var unwrap = function (_202) {
    return _202.value0;
};
var wrapBifunctor = function (__dict_Bifunctor_2) {
    return new Data_Bifunctor.Bifunctor(function (f) {
        return function (g) {
            return Prelude["<<<"](Prelude.semigroupoidFn)(Wrap.create)(Prelude["<<<"](Prelude.semigroupoidFn)(Data_Bifunctor.bimap(__dict_Bifunctor_2)(f)(g))(unwrap));
        };
    });
};
var wrapBiapply = function (__dict_Biapply_0) {
    return new Control_Biapply.Biapply(function () {
        return wrapBifunctor(__dict_Biapply_0["__superclass_Data.Bifunctor.Bifunctor_0"]());
    }, function (_203) {
        return function (_204) {
            return new Wrap(Control_Biapply["<<*>>"](__dict_Biapply_0)(_203.value0)(_204.value0));
        };
    });
};
var wrapBiapplicative = function (__dict_Biapplicative_1) {
    return new Control_Biapplicative.Biapplicative(function () {
        return wrapBiapply(__dict_Biapplicative_1["__superclass_Control.Biapply.Biapply_0"]());
    }, function (a) {
        return function (b) {
            return new Wrap(Control_Biapplicative.bipure(__dict_Biapplicative_1)(a)(b));
        };
    });
};
var wrapFunctor = function (__dict_Bifunctor_3) {
    return new Prelude.Functor(function (f) {
        return Prelude["<<<"](Prelude.semigroupoidFn)(Wrap.create)(Prelude["<<<"](Prelude.semigroupoidFn)(Data_Bifunctor.rmap(__dict_Bifunctor_3)(f))(unwrap));
    });
};
module.exports = {
    Wrap: Wrap, 
    unwrap: unwrap, 
    wrapBifunctor: wrapBifunctor, 
    wrapFunctor: wrapFunctor, 
    wrapBiapply: wrapBiapply, 
    wrapBiapplicative: wrapBiapplicative
};
