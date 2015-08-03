// Generated by psc version 0.7.1.0
"use strict";
var $foreign = require("./foreign");
var Prelude = require("Prelude");
var Data_Foldable = require("Data.Foldable");
var Data_Maybe = require("Data.Maybe");
var Data_Maybe_First = require("Data.Maybe.First");
var Data_Maybe_Last = require("Data.Maybe.Last");
var Data_Monoid_Additive = require("Data.Monoid.Additive");
var Data_Monoid_Dual = require("Data.Monoid.Dual");
var Data_Monoid_Multiplicative = require("Data.Monoid.Multiplicative");
var Data_Monoid_Disj = require("Data.Monoid.Disj");
var Data_Monoid_Conj = require("Data.Monoid.Conj");
var StateL = function (x) {
    return x;
};
var StateR = function (x) {
    return x;
};
var Traversable = function (__superclass_Data$dotFoldable$dotFoldable_1, __superclass_Prelude$dotFunctor_0, sequence, traverse) {
    this["__superclass_Data.Foldable.Foldable_1"] = __superclass_Data$dotFoldable$dotFoldable_1;
    this["__superclass_Prelude.Functor_0"] = __superclass_Prelude$dotFunctor_0;
    this.sequence = sequence;
    this.traverse = traverse;
};
var traverse = function (dict) {
    return dict.traverse;
};
var traversableMultiplicative = new Traversable(function () {
    return Data_Foldable.foldableMultiplicative;
}, function () {
    return Data_Monoid_Multiplicative.functorMultiplicative;
}, function (__dict_Applicative_1) {
    return function (_287) {
        return Prelude["<$>"]((__dict_Applicative_1["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Monoid_Multiplicative.Multiplicative)(_287);
    };
}, function (__dict_Applicative_0) {
    return function (f) {
        return function (_286) {
            return Prelude["<$>"]((__dict_Applicative_0["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Monoid_Multiplicative.Multiplicative)(f(_286));
        };
    };
});
var traversableMaybe = new Traversable(function () {
    return Data_Foldable.foldableMaybe;
}, function () {
    return Data_Maybe.functorMaybe;
}, function (__dict_Applicative_3) {
    return function (_273) {
        if (_273 instanceof Data_Maybe.Nothing) {
            return Prelude.pure(__dict_Applicative_3)(Data_Maybe.Nothing.value);
        };
        if (_273 instanceof Data_Maybe.Just) {
            return Prelude["<$>"]((__dict_Applicative_3["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Maybe.Just.create)(_273.value0);
        };
        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-foldable-traversable/src/Data/Traversable.purs line 59, column 1 - line 65, column 1: " + [ _273.constructor.name ]);
    };
}, function (__dict_Applicative_2) {
    return function (f) {
        return function (_272) {
            if (_272 instanceof Data_Maybe.Nothing) {
                return Prelude.pure(__dict_Applicative_2)(Data_Maybe.Nothing.value);
            };
            if (_272 instanceof Data_Maybe.Just) {
                return Prelude["<$>"]((__dict_Applicative_2["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Maybe.Just.create)(f(_272.value0));
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-foldable-traversable/src/Data/Traversable.purs line 59, column 1 - line 65, column 1: " + [ f.constructor.name, _272.constructor.name ]);
        };
    };
});
var traversableDual = new Traversable(function () {
    return Data_Foldable.foldableDual;
}, function () {
    return Data_Monoid_Dual.functorDual;
}, function (__dict_Applicative_5) {
    return function (_281) {
        return Prelude["<$>"]((__dict_Applicative_5["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Monoid_Dual.Dual)(_281);
    };
}, function (__dict_Applicative_4) {
    return function (f) {
        return function (_280) {
            return Prelude["<$>"]((__dict_Applicative_4["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Monoid_Dual.Dual)(f(_280));
        };
    };
});
var traversableDisj = new Traversable(function () {
    return Data_Foldable.foldableDisj;
}, function () {
    return Data_Monoid_Disj.functorDisj;
}, function (__dict_Applicative_7) {
    return function (_285) {
        return Prelude["<$>"]((__dict_Applicative_7["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Monoid_Disj.Disj)(_285);
    };
}, function (__dict_Applicative_6) {
    return function (f) {
        return function (_284) {
            return Prelude["<$>"]((__dict_Applicative_6["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Monoid_Disj.Disj)(f(_284));
        };
    };
});
var traversableConj = new Traversable(function () {
    return Data_Foldable.foldableConj;
}, function () {
    return Data_Monoid_Conj.functorConj;
}, function (__dict_Applicative_9) {
    return function (_283) {
        return Prelude["<$>"]((__dict_Applicative_9["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Monoid_Conj.Conj)(_283);
    };
}, function (__dict_Applicative_8) {
    return function (f) {
        return function (_282) {
            return Prelude["<$>"]((__dict_Applicative_8["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Monoid_Conj.Conj)(f(_282));
        };
    };
});
var traversableArray = new Traversable(function () {
    return Data_Foldable.foldableArray;
}, function () {
    return Prelude.functorArray;
}, function (__dict_Applicative_11) {
    return traverse(traversableArray)(__dict_Applicative_11)(Prelude.id(Prelude.categoryFn));
}, function (__dict_Applicative_10) {
    return $foreign.traverseArrayImpl(Prelude.apply(__dict_Applicative_10["__superclass_Prelude.Apply_0"]()))(Prelude.map((__dict_Applicative_10["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]()))(Prelude.pure(__dict_Applicative_10));
});
var traversableAdditive = new Traversable(function () {
    return Data_Foldable.foldableAdditive;
}, function () {
    return Data_Monoid_Additive.functorAdditive;
}, function (__dict_Applicative_13) {
    return function (_279) {
        return Prelude["<$>"]((__dict_Applicative_13["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Monoid_Additive.Additive)(_279);
    };
}, function (__dict_Applicative_12) {
    return function (f) {
        return function (_278) {
            return Prelude["<$>"]((__dict_Applicative_12["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Monoid_Additive.Additive)(f(_278));
        };
    };
});
var stateR = function (_271) {
    return _271;
};
var stateL = function (_270) {
    return _270;
};
var sequence = function (dict) {
    return dict.sequence;
};
var traversableFirst = new Traversable(function () {
    return Data_Foldable.foldableFirst;
}, function () {
    return Data_Maybe_First.functorFirst;
}, function (__dict_Applicative_15) {
    return function (_275) {
        return Prelude["<$>"]((__dict_Applicative_15["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Maybe_First.First)(sequence(traversableMaybe)(__dict_Applicative_15)(_275));
    };
}, function (__dict_Applicative_14) {
    return function (f) {
        return function (_274) {
            return Prelude["<$>"]((__dict_Applicative_14["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Maybe_First.First)(traverse(traversableMaybe)(__dict_Applicative_14)(f)(_274));
        };
    };
});
var traversableLast = new Traversable(function () {
    return Data_Foldable.foldableLast;
}, function () {
    return Data_Maybe_Last.functorLast;
}, function (__dict_Applicative_17) {
    return function (_277) {
        return Prelude["<$>"]((__dict_Applicative_17["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Maybe_Last.Last)(sequence(traversableMaybe)(__dict_Applicative_17)(_277));
    };
}, function (__dict_Applicative_16) {
    return function (f) {
        return function (_276) {
            return Prelude["<$>"]((__dict_Applicative_16["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(Data_Maybe_Last.Last)(traverse(traversableMaybe)(__dict_Applicative_16)(f)(_276));
        };
    };
});
var functorStateR = new Prelude.Functor(function (f) {
    return function (k) {
        return function (s) {
            var _691 = stateR(k)(s);
            return {
                accum: _691.accum, 
                value: f(_691.value)
            };
        };
    };
});
var functorStateL = new Prelude.Functor(function (f) {
    return function (k) {
        return function (s) {
            var _694 = stateL(k)(s);
            return {
                accum: _694.accum, 
                value: f(_694.value)
            };
        };
    };
});
var $$for = function (__dict_Applicative_22) {
    return function (__dict_Traversable_23) {
        return function (x) {
            return function (f) {
                return traverse(__dict_Traversable_23)(__dict_Applicative_22)(f)(x);
            };
        };
    };
};
var applyStateR = new Prelude.Apply(function () {
    return functorStateR;
}, function (f) {
    return function (x) {
        return function (s) {
            var _697 = stateR(x)(s);
            var _698 = stateR(f)(_697.accum);
            return {
                accum: _698.accum, 
                value: _698.value(_697.value)
            };
        };
    };
});
var applyStateL = new Prelude.Apply(function () {
    return functorStateL;
}, function (f) {
    return function (x) {
        return function (s) {
            var _703 = stateL(f)(s);
            var _704 = stateL(x)(_703.accum);
            return {
                accum: _704.accum, 
                value: _703.value(_704.value)
            };
        };
    };
});
var applicativeStateR = new Prelude.Applicative(function () {
    return applyStateR;
}, function (a) {
    return function (s) {
        return {
            accum: s, 
            value: a
        };
    };
});
var mapAccumR = function (__dict_Traversable_18) {
    return function (f) {
        return function (s0) {
            return function (xs) {
                return stateR(traverse(__dict_Traversable_18)(applicativeStateR)(function (a) {
                    return function (s) {
                        return f(s)(a);
                    };
                })(xs))(s0);
            };
        };
    };
};
var scanr = function (__dict_Traversable_19) {
    return function (f) {
        return function (b0) {
            return function (xs) {
                return (mapAccumR(__dict_Traversable_19)(function (b) {
                    return function (a) {
                        var b$prime = f(a)(b);
                        return {
                            accum: b$prime, 
                            value: b$prime
                        };
                    };
                })(b0)(xs)).value;
            };
        };
    };
};
var applicativeStateL = new Prelude.Applicative(function () {
    return applyStateL;
}, function (a) {
    return function (s) {
        return {
            accum: s, 
            value: a
        };
    };
});
var mapAccumL = function (__dict_Traversable_20) {
    return function (f) {
        return function (s0) {
            return function (xs) {
                return stateL(traverse(__dict_Traversable_20)(applicativeStateL)(function (a) {
                    return function (s) {
                        return f(s)(a);
                    };
                })(xs))(s0);
            };
        };
    };
};
var scanl = function (__dict_Traversable_21) {
    return function (f) {
        return function (b0) {
            return function (xs) {
                return (mapAccumL(__dict_Traversable_21)(function (b) {
                    return function (a) {
                        var b$prime = f(b)(a);
                        return {
                            accum: b$prime, 
                            value: b$prime
                        };
                    };
                })(b0)(xs)).value;
            };
        };
    };
};
module.exports = {
    Traversable: Traversable, 
    mapAccumR: mapAccumR, 
    mapAccumL: mapAccumL, 
    scanr: scanr, 
    scanl: scanl, 
    "for": $$for, 
    sequence: sequence, 
    traverse: traverse, 
    traversableArray: traversableArray, 
    traversableMaybe: traversableMaybe, 
    traversableFirst: traversableFirst, 
    traversableLast: traversableLast, 
    traversableAdditive: traversableAdditive, 
    traversableDual: traversableDual, 
    traversableConj: traversableConj, 
    traversableDisj: traversableDisj, 
    traversableMultiplicative: traversableMultiplicative
};
