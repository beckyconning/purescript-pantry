// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var Extend = function (__superclass_Prelude$dotFunctor_0, extend) {
    this["__superclass_Prelude.Functor_0"] = __superclass_Prelude$dotFunctor_0;
    this.extend = extend;
};
var extendFn = function (__dict_Semigroup_0) {
    return new Extend(function () {
        return Prelude.functorFn;
    }, function (f) {
        return function (g) {
            return function (w) {
                return f(function (w$prime) {
                    return g(Prelude["<>"](__dict_Semigroup_0)(w)(w$prime));
                });
            };
        };
    });
};
var extend = function (dict) {
    return dict.extend;
};
var $less$less$eq = function (__dict_Extend_1) {
    return extend(__dict_Extend_1);
};
var $eq$less$eq = function (__dict_Extend_2) {
    return function (f) {
        return function (g) {
            return function (w) {
                return f($less$less$eq(__dict_Extend_2)(g)(w));
            };
        };
    };
};
var $eq$greater$eq = function (__dict_Extend_3) {
    return function (f) {
        return function (g) {
            return function (w) {
                return g($less$less$eq(__dict_Extend_3)(f)(w));
            };
        };
    };
};
var $eq$greater$greater = function (__dict_Extend_4) {
    return function (w) {
        return function (f) {
            return $less$less$eq(__dict_Extend_4)(f)(w);
        };
    };
};
var duplicate = function (__dict_Extend_5) {
    return extend(__dict_Extend_5)(Prelude.id(Prelude.categoryFn));
};
module.exports = {
    Extend: Extend, 
    duplicate: duplicate, 
    "=<=": $eq$less$eq, 
    "=>=": $eq$greater$eq, 
    "=>>": $eq$greater$greater, 
    "<<=": $less$less$eq, 
    extend: extend, 
    extendFn: extendFn
};
