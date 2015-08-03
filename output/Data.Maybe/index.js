// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var Data_Functor_Invariant = require("Data.Functor.Invariant");
var Control_Alt = require("Control.Alt");
var Control_Alternative = require("Control.Alternative");
var Control_Extend = require("Control.Extend");
var Control_MonadPlus = require("Control.MonadPlus");
var Control_Plus = require("Control.Plus");
var Data_Monoid = require("Data.Monoid");
var Nothing = (function () {
    function Nothing() {

    };
    Nothing.value = new Nothing();
    return Nothing;
})();
var Just = (function () {
    function Just(value0) {
        this.value0 = value0;
    };
    Just.create = function (value0) {
        return new Just(value0);
    };
    return Just;
})();
var showMaybe = function (__dict_Show_0) {
    return new Prelude.Show(function (_218) {
        if (_218 instanceof Just) {
            return "Just (" + (Prelude.show(__dict_Show_0)(_218.value0) + ")");
        };
        if (_218 instanceof Nothing) {
            return "Nothing";
        };
        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-maybe/src/Data/Maybe.purs line 264, column 1 - line 266, column 19: " + [ _218.constructor.name ]);
    });
};
var semigroupMaybe = function (__dict_Semigroup_2) {
    return new Prelude.Semigroup(function (_212) {
        return function (_213) {
            if (_212 instanceof Nothing) {
                return _213;
            };
            if (_213 instanceof Nothing) {
                return _212;
            };
            if (_212 instanceof Just && _213 instanceof Just) {
                return new Just(Prelude["<>"](__dict_Semigroup_2)(_212.value0)(_213.value0));
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-maybe/src/Data/Maybe.purs line 206, column 1 - line 211, column 1: " + [ _212.constructor.name, _213.constructor.name ]);
        };
    });
};
var monoidMaybe = function (__dict_Semigroup_6) {
    return new Data_Monoid.Monoid(function () {
        return semigroupMaybe(__dict_Semigroup_6);
    }, Nothing.value);
};
var maybe = function (b) {
    return function (f) {
        return function (_206) {
            if (_206 instanceof Nothing) {
                return b;
            };
            if (_206 instanceof Just) {
                return f(_206.value0);
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-maybe/src/Data/Maybe.purs line 26, column 1 - line 27, column 1: " + [ b.constructor.name, f.constructor.name, _206.constructor.name ]);
        };
    };
};
var isNothing = maybe(true)(Prelude["const"](false));
var isJust = maybe(false)(Prelude["const"](true));
var functorMaybe = new Prelude.Functor(function (fn) {
    return function (_207) {
        if (_207 instanceof Just) {
            return new Just(fn(_207.value0));
        };
        return Nothing.value;
    };
});
var invariantMaybe = new Data_Functor_Invariant.Invariant(Data_Functor_Invariant.imapF(functorMaybe));
var fromMaybe = function (a) {
    return maybe(a)(Prelude.id(Prelude.categoryFn));
};
var extendMaybe = new Control_Extend.Extend(function () {
    return functorMaybe;
}, function (f) {
    return function (_211) {
        if (_211 instanceof Nothing) {
            return Nothing.value;
        };
        return new Just(f(_211));
    };
});
var eqMaybe = function (__dict_Eq_8) {
    return new Prelude.Eq(function (_214) {
        return function (_215) {
            if (_214 instanceof Nothing && _215 instanceof Nothing) {
                return true;
            };
            if (_214 instanceof Just && _215 instanceof Just) {
                return Prelude["=="](__dict_Eq_8)(_214.value0)(_215.value0);
            };
            return false;
        };
    });
};
var ordMaybe = function (__dict_Ord_4) {
    return new Prelude.Ord(function () {
        return eqMaybe(__dict_Ord_4["__superclass_Prelude.Eq_0"]());
    }, function (_216) {
        return function (_217) {
            if (_216 instanceof Just && _217 instanceof Just) {
                return Prelude.compare(__dict_Ord_4)(_216.value0)(_217.value0);
            };
            if (_216 instanceof Nothing && _217 instanceof Nothing) {
                return Prelude.EQ.value;
            };
            if (_216 instanceof Nothing) {
                return Prelude.LT.value;
            };
            if (_217 instanceof Nothing) {
                return Prelude.GT.value;
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-maybe/src/Data/Maybe.purs line 244, column 1 - line 250, column 1: " + [ _216.constructor.name, _217.constructor.name ]);
        };
    });
};
var boundedMaybe = function (__dict_Bounded_11) {
    return new Prelude.Bounded(Nothing.value, new Just(Prelude.top(__dict_Bounded_11)));
};
var boundedOrdMaybe = function (__dict_BoundedOrd_10) {
    return new Prelude.BoundedOrd(function () {
        return boundedMaybe(__dict_BoundedOrd_10["__superclass_Prelude.Bounded_0"]());
    }, function () {
        return ordMaybe(__dict_BoundedOrd_10["__superclass_Prelude.Ord_1"]());
    });
};
var applyMaybe = new Prelude.Apply(function () {
    return functorMaybe;
}, function (_208) {
    return function (x) {
        if (_208 instanceof Just) {
            return Prelude["<$>"](functorMaybe)(_208.value0)(x);
        };
        if (_208 instanceof Nothing) {
            return Nothing.value;
        };
        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-maybe/src/Data/Maybe.purs line 96, column 1 - line 120, column 1: " + [ _208.constructor.name, x.constructor.name ]);
    };
});
var bindMaybe = new Prelude.Bind(function () {
    return applyMaybe;
}, function (_210) {
    return function (k) {
        if (_210 instanceof Just) {
            return k(_210.value0);
        };
        if (_210 instanceof Nothing) {
            return Nothing.value;
        };
        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-maybe/src/Data/Maybe.purs line 155, column 1 - line 174, column 1: " + [ _210.constructor.name, k.constructor.name ]);
    };
});
var booleanAlgebraMaybe = function (__dict_BooleanAlgebra_12) {
    return new Prelude.BooleanAlgebra(function () {
        return boundedMaybe(__dict_BooleanAlgebra_12["__superclass_Prelude.Bounded_0"]());
    }, function (x) {
        return function (y) {
            return Prelude["<*>"](applyMaybe)(Prelude["<$>"](functorMaybe)(Prelude.conj(__dict_BooleanAlgebra_12))(x))(y);
        };
    }, function (x) {
        return function (y) {
            return Prelude["<*>"](applyMaybe)(Prelude["<$>"](functorMaybe)(Prelude.disj(__dict_BooleanAlgebra_12))(x))(y);
        };
    }, Prelude.map(functorMaybe)(Prelude.not(__dict_BooleanAlgebra_12)));
};
var semiringMaybe = function (__dict_Semiring_1) {
    return new Prelude.Semiring(function (x) {
        return function (y) {
            return Prelude["<*>"](applyMaybe)(Prelude["<$>"](functorMaybe)(Prelude.add(__dict_Semiring_1))(x))(y);
        };
    }, function (x) {
        return function (y) {
            return Prelude["<*>"](applyMaybe)(Prelude["<$>"](functorMaybe)(Prelude.mul(__dict_Semiring_1))(x))(y);
        };
    }, new Just(Prelude.one(__dict_Semiring_1)), new Just(Prelude.zero(__dict_Semiring_1)));
};
var moduloSemiringMaybe = function (__dict_ModuloSemiring_7) {
    return new Prelude.ModuloSemiring(function () {
        return semiringMaybe(__dict_ModuloSemiring_7["__superclass_Prelude.Semiring_0"]());
    }, function (x) {
        return function (y) {
            return Prelude["<*>"](applyMaybe)(Prelude["<$>"](functorMaybe)(Prelude.div(__dict_ModuloSemiring_7))(x))(y);
        };
    }, function (x) {
        return function (y) {
            return Prelude["<*>"](applyMaybe)(Prelude["<$>"](functorMaybe)(Prelude.mod(__dict_ModuloSemiring_7))(x))(y);
        };
    });
};
var ringMaybe = function (__dict_Ring_3) {
    return new Prelude.Ring(function () {
        return semiringMaybe(__dict_Ring_3["__superclass_Prelude.Semiring_0"]());
    }, function (x) {
        return function (y) {
            return Prelude["<*>"](applyMaybe)(Prelude["<$>"](functorMaybe)(Prelude.sub(__dict_Ring_3))(x))(y);
        };
    });
};
var divisionRingMaybe = function (__dict_DivisionRing_9) {
    return new Prelude.DivisionRing(function () {
        return moduloSemiringMaybe(__dict_DivisionRing_9["__superclass_Prelude.ModuloSemiring_1"]());
    }, function () {
        return ringMaybe(__dict_DivisionRing_9["__superclass_Prelude.Ring_0"]());
    });
};
var numMaybe = function (__dict_Num_5) {
    return new Prelude.Num(function () {
        return divisionRingMaybe(__dict_Num_5["__superclass_Prelude.DivisionRing_0"]());
    });
};
var applicativeMaybe = new Prelude.Applicative(function () {
    return applyMaybe;
}, Just.create);
var monadMaybe = new Prelude.Monad(function () {
    return applicativeMaybe;
}, function () {
    return bindMaybe;
});
var altMaybe = new Control_Alt.Alt(function () {
    return functorMaybe;
}, function (_209) {
    return function (r) {
        if (_209 instanceof Nothing) {
            return r;
        };
        return _209;
    };
});
var plusMaybe = new Control_Plus.Plus(function () {
    return altMaybe;
}, Nothing.value);
var alternativeMaybe = new Control_Alternative.Alternative(function () {
    return plusMaybe;
}, function () {
    return applicativeMaybe;
});
var monadPlusMaybe = new Control_MonadPlus.MonadPlus(function () {
    return alternativeMaybe;
}, function () {
    return monadMaybe;
});
module.exports = {
    Nothing: Nothing, 
    Just: Just, 
    isNothing: isNothing, 
    isJust: isJust, 
    fromMaybe: fromMaybe, 
    maybe: maybe, 
    functorMaybe: functorMaybe, 
    applyMaybe: applyMaybe, 
    applicativeMaybe: applicativeMaybe, 
    altMaybe: altMaybe, 
    plusMaybe: plusMaybe, 
    alternativeMaybe: alternativeMaybe, 
    bindMaybe: bindMaybe, 
    monadMaybe: monadMaybe, 
    monadPlusMaybe: monadPlusMaybe, 
    extendMaybe: extendMaybe, 
    invariantMaybe: invariantMaybe, 
    semigroupMaybe: semigroupMaybe, 
    monoidMaybe: monoidMaybe, 
    semiringMaybe: semiringMaybe, 
    moduloSemiringMaybe: moduloSemiringMaybe, 
    ringMaybe: ringMaybe, 
    divisionRingMaybe: divisionRingMaybe, 
    numMaybe: numMaybe, 
    eqMaybe: eqMaybe, 
    ordMaybe: ordMaybe, 
    boundedMaybe: boundedMaybe, 
    boundedOrdMaybe: boundedOrdMaybe, 
    booleanAlgebraMaybe: booleanAlgebraMaybe, 
    showMaybe: showMaybe
};