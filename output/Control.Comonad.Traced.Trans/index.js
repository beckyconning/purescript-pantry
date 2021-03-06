// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var Control_Extend = require("Control.Extend");
var Control_Comonad = require("Control.Comonad");
var Data_Monoid = require("Data.Monoid");
var Control_Comonad_Trans = require("Control.Comonad.Trans");
var Data_Tuple = require("Data.Tuple");
var TracedT = function (x) {
    return x;
};
var runTracedT = function (_124) {
    return _124;
};
var functorTracedT = function (__dict_Functor_0) {
    return new Prelude.Functor(function (f) {
        return function (_125) {
            return Prelude["<$>"](__dict_Functor_0)(function (g) {
                return function (t) {
                    return f(g(t));
                };
            })(_125);
        };
    });
};
var extendTracedT = function (__dict_Extend_1) {
    return function (__dict_Semigroup_2) {
        return new Control_Extend.Extend(function () {
            return functorTracedT(__dict_Extend_1["__superclass_Prelude.Functor_0"]());
        }, function (f) {
            return function (_126) {
                return Control_Extend["<<="](__dict_Extend_1)(function (w_1) {
                    return function (t) {
                        return f(Prelude["<$>"](__dict_Extend_1["__superclass_Prelude.Functor_0"]())(function (h) {
                            return function (t$prime) {
                                return h(Prelude["<>"](__dict_Semigroup_2)(t)(t$prime));
                            };
                        })(w_1));
                    };
                })(_126);
            };
        });
    };
};
var comonadTransTracedT = function (__dict_Monoid_3) {
    return new Control_Comonad_Trans.ComonadTrans(function (__dict_Comonad_4) {
        return function (_128) {
            return Prelude["<$>"]((__dict_Comonad_4["__superclass_Control.Extend.Extend_0"]())["__superclass_Prelude.Functor_0"]())(function (f) {
                return f(Data_Monoid.mempty(__dict_Monoid_3));
            })(_128);
        };
    });
};
var comonadTracedT = function (__dict_Comonad_5) {
    return function (__dict_Monoid_6) {
        return new Control_Comonad.Comonad(function () {
            return extendTracedT(__dict_Comonad_5["__superclass_Control.Extend.Extend_0"]())(__dict_Monoid_6["__superclass_Prelude.Semigroup_0"]());
        }, function (_127) {
            return Control_Comonad.extract(__dict_Comonad_5)(_127)(Data_Monoid.mempty(__dict_Monoid_6));
        });
    };
};
module.exports = {
    TracedT: TracedT, 
    runTracedT: runTracedT, 
    functorTracedT: functorTracedT, 
    extendTracedT: extendTracedT, 
    comonadTracedT: comonadTracedT, 
    comonadTransTracedT: comonadTransTracedT
};
