// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var Control_Comonad = require("Control.Comonad");
var Control_Extend = require("Control.Extend");
var Data_Functor_Invariant = require("Data.Functor.Invariant");
var Data_Monoid = require("Data.Monoid");
var Multiplicative = function (x) {
    return x;
};
var showMultiplicative = function (__dict_Show_0) {
    return new Prelude.Show(function (_179) {
        return "Multiplicative (" + (Prelude.show(__dict_Show_0)(_179) + ")");
    });
};
var semigroupMultiplicative = function (__dict_Semiring_1) {
    return new Prelude.Semigroup(function (_180) {
        return function (_181) {
            return Prelude["*"](__dict_Semiring_1)(_180)(_181);
        };
    });
};
var runMultiplicative = function (_168) {
    return _168;
};
var monoidMultiplicative = function (__dict_Semiring_3) {
    return new Data_Monoid.Monoid(function () {
        return semigroupMultiplicative(__dict_Semiring_3);
    }, Prelude.one(__dict_Semiring_3));
};
var invariantMultiplicative = new Data_Functor_Invariant.Invariant(function (f) {
    return function (_177) {
        return function (_178) {
            return f(_178);
        };
    };
});
var functorMultiplicative = new Prelude.Functor(function (f) {
    return function (_173) {
        return f(_173);
    };
});
var extendMultiplicative = new Control_Extend.Extend(function () {
    return functorMultiplicative;
}, function (f) {
    return function (x) {
        return f(x);
    };
});
var eqMultiplicative = function (__dict_Eq_4) {
    return new Prelude.Eq(function (_169) {
        return function (_170) {
            return Prelude["=="](__dict_Eq_4)(_169)(_170);
        };
    });
};
var ordMultiplicative = function (__dict_Ord_2) {
    return new Prelude.Ord(function () {
        return eqMultiplicative(__dict_Ord_2["__superclass_Prelude.Eq_0"]());
    }, function (_171) {
        return function (_172) {
            return Prelude.compare(__dict_Ord_2)(_171)(_172);
        };
    });
};
var comonadMultiplicative = new Control_Comonad.Comonad(function () {
    return extendMultiplicative;
}, runMultiplicative);
var applyMultiplicative = new Prelude.Apply(function () {
    return functorMultiplicative;
}, function (_174) {
    return function (_175) {
        return _174(_175);
    };
});
var bindMultiplicative = new Prelude.Bind(function () {
    return applyMultiplicative;
}, function (_176) {
    return function (f) {
        return f(_176);
    };
});
var applicativeMultiplicative = new Prelude.Applicative(function () {
    return applyMultiplicative;
}, Multiplicative);
var monadMultiplicative = new Prelude.Monad(function () {
    return applicativeMultiplicative;
}, function () {
    return bindMultiplicative;
});
module.exports = {
    Multiplicative: Multiplicative, 
    runMultiplicative: runMultiplicative, 
    eqMultiplicative: eqMultiplicative, 
    ordMultiplicative: ordMultiplicative, 
    functorMultiplicative: functorMultiplicative, 
    applyMultiplicative: applyMultiplicative, 
    applicativeMultiplicative: applicativeMultiplicative, 
    bindMultiplicative: bindMultiplicative, 
    monadMultiplicative: monadMultiplicative, 
    extendMultiplicative: extendMultiplicative, 
    comonadMultiplicative: comonadMultiplicative, 
    invariantMultiplicative: invariantMultiplicative, 
    showMultiplicative: showMultiplicative, 
    semigroupMultiplicative: semigroupMultiplicative, 
    monoidMultiplicative: monoidMultiplicative
};
