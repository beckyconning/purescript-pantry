// Generated by psc version 0.7.1.0
"use strict";
var Data_Unfoldable = require("Data.Unfoldable");
var Prelude = require("Prelude");
var Data_Foldable = require("Data.Foldable");
var Data_Lazy = require("Data.Lazy");
var Control_Lazy = require("Control.Lazy");
var Data_Maybe = require("Data.Maybe");
var Data_Monoid = require("Data.Monoid");
var Data_Traversable = require("Data.Traversable");
var Control_Alt = require("Control.Alt");
var Control_Alternative = require("Control.Alternative");
var Control_MonadPlus = require("Control.MonadPlus");
var Control_Plus = require("Control.Plus");
var Data_Tuple = require("Data.Tuple");
var List = function (x) {
    return x;
};
var Nil = (function () {
    function Nil() {

    };
    Nil.value = new Nil();
    return Nil;
})();
var Cons = (function () {
    function Cons(value0, value1) {
        this.value0 = value0;
        this.value1 = value1;
    };
    Cons.create = function (value0) {
        return function (value1) {
            return new Cons(value0, value1);
        };
    };
    return Cons;
})();
var runList = function (_507) {
    return _507;
};
var step = Prelude["<<<"](Prelude.semigroupoidFn)(Data_Lazy.force)(runList);
var semigroupList = new Prelude.Semigroup(function (xs) {
    return function (ys) {
        var go = function (_542) {
            if (_542 instanceof Nil) {
                return step(ys);
            };
            if (_542 instanceof Cons) {
                return new Cons(_542.value0, Prelude["<>"](semigroupList)(_542.value1)(ys));
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 662, column 5 - line 663, column 5: " + [ _542.constructor.name ]);
        };
        return Prelude["<$>"](Data_Lazy.functorLazy)(go)(runList(xs));
    };
});
var showList = function (__dict_Show_0) {
    return new Prelude.Show(function (xs) {
        var go = function (_537) {
            if (_537 instanceof Nil) {
                return "Nil";
            };
            if (_537 instanceof Cons) {
                return "Cons (" + (Prelude.show(__dict_Show_0)(_537.value0) + (") (" + (go(step(_537.value1)) + ")")));
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 631, column 1 - line 637, column 1: " + [ _537.constructor.name ]);
        };
        return "fromStrict (" + (go(step(xs)) + ")");
    });
};
var uncons = function (xs) {
    var _687 = step(xs);
    if (_687 instanceof Nil) {
        return Data_Maybe.Nothing.value;
    };
    if (_687 instanceof Cons) {
        return new Data_Maybe.Just({
            head: _687.value0, 
            tail: _687.value1
        });
    };
    throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 278, column 1 - line 279, column 1: " + [ _687.constructor.name ]);
};
var tail = function (xs) {
    return Prelude["<$>"](Data_Maybe.functorMaybe)(function (_1) {
        return _1.tail;
    })(uncons(xs));
};
var take = function (n) {
    return function (xs) {
        var go = function (_526) {
            return function (_527) {
                if (_526 === 0) {
                    return Nil.value;
                };
                if (_527 instanceof Nil) {
                    return Nil.value;
                };
                if (_527 instanceof Cons) {
                    return new Cons(_527.value0, take(Prelude["-"](Prelude.ringInt)(_526)(1))(_527.value1));
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 445, column 3 - line 446, column 3: " + [ _526.constructor.name, _527.constructor.name ]);
            };
        };
        return Prelude["<$>"](Data_Lazy.functorLazy)(go(n))(runList(xs));
    };
};
var takeWhile = function (p) {
    return function (xs) {
        var go = function (_528) {
            if (_528 instanceof Cons && p(_528.value0)) {
                return new Cons(_528.value0, takeWhile(p)(_528.value1));
            };
            return Nil.value;
        };
        return Prelude["<$>"](Data_Lazy.functorLazy)(go)(runList(xs));
    };
};
var updateAt = function (n) {
    return function (x) {
        return function (xs) {
            var go = function (_518) {
                return function (_519) {
                    if (_519 instanceof Nil) {
                        return Nil.value;
                    };
                    if (_518 === 0 && _519 instanceof Cons) {
                        return new Cons(x, _519.value1);
                    };
                    if (_519 instanceof Cons) {
                        return new Cons(_519.value0, updateAt(Prelude["-"](Prelude.ringInt)(_518)(1))(x)(_519.value1));
                    };
                    throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 341, column 3 - line 342, column 3: " + [ _518.constructor.name, _519.constructor.name ]);
                };
            };
            return Prelude["<$>"](Data_Lazy.functorLazy)(go(n))(runList(xs));
        };
    };
};
var zipWith = function (f) {
    return function (xs) {
        return function (ys) {
            var go = function (_535) {
                return function (_536) {
                    if (_535 instanceof Nil) {
                        return Nil.value;
                    };
                    if (_536 instanceof Nil) {
                        return Nil.value;
                    };
                    if (_535 instanceof Cons && _536 instanceof Cons) {
                        return new Cons(f(_535.value0)(_536.value0), zipWith(f)(_535.value1)(_536.value1));
                    };
                    throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 612, column 3 - line 613, column 3: " + [ _535.constructor.name, _536.constructor.name ]);
                };
            };
            return Prelude["<*>"](Data_Lazy.applyLazy)(Prelude["<$>"](Data_Lazy.functorLazy)(go)(runList(xs)))(runList(ys));
        };
    };
};
var zip = zipWith(Data_Tuple.Tuple.create);
var $$null = Prelude["<<<"](Prelude.semigroupoidFn)(Data_Maybe.isNothing)(uncons);
var nil = List(Data_Lazy.defer(function (_504) {
    return Nil.value;
}));
var monoidList = new Data_Monoid.Monoid(function () {
    return semigroupList;
}, nil);
var mapMaybe = function (f) {
    return function (xs) {
        var go = function (__copy__525) {
            var _525 = __copy__525;
            tco: while (true) {
                if (_525 instanceof Nil) {
                    return Nil.value;
                };
                if (_525 instanceof Cons) {
                    var _711 = f(_525.value0);
                    if (_711 instanceof Data_Maybe.Nothing) {
                        var __tco__525 = step(_525.value1);
                        _525 = __tco__525;
                        continue tco;
                    };
                    if (_711 instanceof Data_Maybe.Just) {
                        return new Cons(_711.value0, mapMaybe(f)(_525.value1));
                    };
                    throw new Error("Failed pattern match: " + [ _711.constructor.name ]);
                };
                throw new Error("Failed pattern match: " + [ _525.constructor.name ]);
            };
        };
        return Prelude["<$>"](Data_Lazy.functorLazy)(go)(runList(xs));
    };
};
var length = function (xs) {
    var go = function (_509) {
        if (_509 instanceof Nil) {
            return 0;
        };
        if (_509 instanceof Cons) {
            return Prelude["+"](Prelude.semiringInt)(1)(go(step(_509.value1)));
        };
        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 193, column 1 - line 194, column 1: " + [ _509.constructor.name ]);
    };
    return go(step(xs));
};
var lazyList = new Control_Lazy.Lazy(function (f) {
    return List(Data_Lazy.defer(Prelude["<<<"](Prelude.semigroupoidFn)(step)(f)));
});
var last = function (xs) {
    var go = function (__copy__511) {
        var _511 = __copy__511;
        tco: while (true) {
            if (_511 instanceof Cons) {
                if ($$null(_511.value1)) {
                    return new Data_Maybe.Just(_511.value0);
                };
                if (Prelude.otherwise) {
                    var __tco__511 = step(_511.value1);
                    _511 = __tco__511;
                    continue tco;
                };
            };
            return Data_Maybe.Nothing.value;
        };
    };
    return go(step(xs));
};
var index = function (xs) {
    var go = function (__copy__513) {
        return function (__copy__514) {
            var _513 = __copy__513;
            var _514 = __copy__514;
            tco: while (true) {
                if (_513 instanceof Nil) {
                    return Data_Maybe.Nothing.value;
                };
                if (_513 instanceof Cons && _514 === 0) {
                    return new Data_Maybe.Just(_513.value0);
                };
                if (_513 instanceof Cons) {
                    var __tco__513 = step(_513.value1);
                    var __tco__514 = Prelude["-"](Prelude.ringInt)(_514)(1);
                    _513 = __tco__513;
                    _514 = __tco__514;
                    continue tco;
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 290, column 1 - line 291, column 1: " + [ _513.constructor.name, _514.constructor.name ]);
            };
        };
    };
    return go(step(xs));
};
var $bang$bang = index;
var head = function (xs) {
    return Prelude["<$>"](Data_Maybe.functorMaybe)(function (_0) {
        return _0.head;
    })(uncons(xs));
};
var functorList = new Prelude.Functor(function (f) {
    return function (xs) {
        var go = function (_543) {
            if (_543 instanceof Nil) {
                return Nil.value;
            };
            if (_543 instanceof Cons) {
                return new Cons(f(_543.value0), Prelude["<$>"](functorList)(f)(_543.value1));
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 671, column 5 - line 672, column 5: " + [ _543.constructor.name ]);
        };
        return Prelude["<$>"](Data_Lazy.functorLazy)(go)(runList(xs));
    };
});
var fromStep = Prelude["<<<"](Prelude.semigroupoidFn)(List)(Prelude.pure(Data_Lazy.applicativeLazy));
var insertBy = function (cmp) {
    return function (x) {
        return function (xs) {
            var go = function (_510) {
                if (_510 instanceof Nil) {
                    return new Cons(x, nil);
                };
                if (_510 instanceof Cons) {
                    var _731 = cmp(x)(_510.value0);
                    if (_731 instanceof Prelude.GT) {
                        return new Cons(_510.value0, insertBy(cmp)(x)(_510.value1));
                    };
                    return new Cons(x, fromStep(_510));
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 231, column 3 - line 232, column 3: " + [ _510.constructor.name ]);
            };
            return Prelude["<$>"](Data_Lazy.functorLazy)(go)(runList(xs));
        };
    };
};
var insert = function (__dict_Ord_2) {
    return insertBy(Prelude.compare(__dict_Ord_2));
};
var fromList = function (__dict_Unfoldable_3) {
    return Data_Unfoldable.unfoldr(__dict_Unfoldable_3)(function (xs) {
        return Prelude["<$>"](Data_Maybe.functorMaybe)(function (rec) {
            return new Data_Tuple.Tuple(rec.head, rec.tail);
        })(uncons(xs));
    });
};
var foldableList = new Data_Foldable.Foldable(function (__dict_Monoid_4) {
    return function (f) {
        return function (xs) {
            var go = function (_546) {
                if (_546 instanceof Nil) {
                    return Data_Monoid.mempty(__dict_Monoid_4);
                };
                if (_546 instanceof Cons) {
                    return Prelude["<>"](__dict_Monoid_4["__superclass_Prelude.Semigroup_0"]())(f(_546.value0))(Data_Foldable.foldMap(foldableList)(__dict_Monoid_4)(f)(_546.value1));
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 690, column 5 - line 691, column 5: " + [ _546.constructor.name ]);
            };
            return go(step(xs));
        };
    };
}, function (o) {
    return function (b) {
        return function (xs) {
            var go = function (_545) {
                if (_545 instanceof Nil) {
                    return b;
                };
                if (_545 instanceof Cons) {
                    return Data_Foldable.foldl(foldableList)(o)(o(b)(_545.value0))(_545.value1);
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 684, column 5 - line 685, column 5: " + [ _545.constructor.name ]);
            };
            return go(step(xs));
        };
    };
}, function (o) {
    return function (b) {
        return function (xs) {
            var go = function (_544) {
                if (_544 instanceof Nil) {
                    return b;
                };
                if (_544 instanceof Cons) {
                    return o(_544.value0)(Data_Foldable.foldr(foldableList)(o)(b)(_544.value1));
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 678, column 5 - line 679, column 5: " + [ _544.constructor.name ]);
            };
            return go(step(xs));
        };
    };
});
var filter = function (p) {
    return function (xs) {
        var go = function (__copy__524) {
            var _524 = __copy__524;
            tco: while (true) {
                if (_524 instanceof Nil) {
                    return Nil.value;
                };
                if (_524 instanceof Cons) {
                    if (p(_524.value0)) {
                        return new Cons(_524.value0, filter(p)(_524.value1));
                    };
                    if (Prelude.otherwise) {
                        var __tco__524 = step(_524.value1);
                        _524 = __tco__524;
                        continue tco;
                    };
                };
                throw new Error("Failed pattern match: " + [ _524.constructor.name ]);
            };
        };
        return Prelude["<$>"](Data_Lazy.functorLazy)(go)(runList(xs));
    };
};
var intersectBy = function (eq) {
    return function (xs) {
        return function (ys) {
            return filter(function (x) {
                return Data_Foldable.any(foldableList)(Prelude.booleanAlgebraBoolean)(eq(x))(ys);
            })(xs);
        };
    };
};
var intersect = function (__dict_Eq_5) {
    return intersectBy(Prelude["=="](__dict_Eq_5));
};
var nubBy = function (eq) {
    return function (xs) {
        var go = function (_533) {
            if (_533 instanceof Nil) {
                return Nil.value;
            };
            if (_533 instanceof Cons) {
                return new Cons(_533.value0, nubBy(eq)(filter(function (y) {
                    return Prelude.not(Prelude.booleanAlgebraBoolean)(eq(_533.value0)(y));
                })(_533.value1)));
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 539, column 3 - line 540, column 3: " + [ _533.constructor.name ]);
        };
        return Prelude["<$>"](Data_Lazy.functorLazy)(go)(runList(xs));
    };
};
var nub = function (__dict_Eq_6) {
    return nubBy(Prelude["=="](__dict_Eq_6));
};
var eqList = function (__dict_Eq_7) {
    return new Prelude.Eq(function (xs) {
        return function (ys) {
            var go = function (__copy__538) {
                return function (__copy__539) {
                    var _538 = __copy__538;
                    var _539 = __copy__539;
                    tco: while (true) {
                        if (_538 instanceof Nil && _539 instanceof Nil) {
                            return true;
                        };
                        if (_538 instanceof Cons && (_539 instanceof Cons && Prelude["=="](__dict_Eq_7)(_538.value0)(_539.value0))) {
                            var __tco__538 = step(_538.value1);
                            var __tco__539 = step(_539.value1);
                            _538 = __tco__538;
                            _539 = __tco__539;
                            continue tco;
                        };
                        return false;
                    };
                };
            };
            return go(step(xs))(step(ys));
        };
    });
};
var ordList = function (__dict_Ord_1) {
    return new Prelude.Ord(function () {
        return eqList(__dict_Ord_1["__superclass_Prelude.Eq_0"]());
    }, function (xs) {
        return function (ys) {
            var go = function (__copy__540) {
                return function (__copy__541) {
                    var _540 = __copy__540;
                    var _541 = __copy__541;
                    tco: while (true) {
                        if (_540 instanceof Nil && _541 instanceof Nil) {
                            return Prelude.EQ.value;
                        };
                        if (_540 instanceof Nil) {
                            return Prelude.LT.value;
                        };
                        if (_541 instanceof Nil) {
                            return Prelude.GT.value;
                        };
                        if (_540 instanceof Cons && _541 instanceof Cons) {
                            var _757 = Prelude.compare(__dict_Ord_1)(_540.value0)(_541.value0);
                            if (_757 instanceof Prelude.EQ) {
                                var __tco__540 = step(_540.value1);
                                var __tco__541 = step(_541.value1);
                                _540 = __tco__540;
                                _541 = __tco__541;
                                continue tco;
                            };
                            return _757;
                        };
                        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 645, column 1 - line 656, column 1: " + [ _540.constructor.name, _541.constructor.name ]);
                    };
                };
            };
            return go(step(xs))(step(ys));
        };
    });
};
var dropWhile = function (p) {
    return function (xs) {
        var go = function (__copy__531) {
            var _531 = __copy__531;
            tco: while (true) {
                if (_531 instanceof Cons && p(_531.value0)) {
                    var __tco__531 = step(_531.value1);
                    _531 = __tco__531;
                    continue tco;
                };
                return fromStep(_531);
            };
        };
        return go(step(xs));
    };
};
var drop = function (n) {
    return function (xs) {
        var go = function (__copy__529) {
            return function (__copy__530) {
                var _529 = __copy__529;
                var _530 = __copy__530;
                tco: while (true) {
                    if (_529 === 0) {
                        return _530;
                    };
                    if (_530 instanceof Nil) {
                        return Nil.value;
                    };
                    if (_530 instanceof Cons) {
                        var __tco__529 = Prelude["-"](Prelude.ringInt)(_529)(1);
                        var __tco__530 = step(_530.value1);
                        _529 = __tco__529;
                        _530 = __tco__530;
                        continue tco;
                    };
                    throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 462, column 1 - line 463, column 1: " + [ _529.constructor.name, _530.constructor.name ]);
                };
            };
        };
        return Prelude["<$>"](Data_Lazy.functorLazy)(go(n))(runList(xs));
    };
};
var deleteBy = function (eq) {
    return function (x) {
        return function (xs) {
            var go = function (_534) {
                if (_534 instanceof Nil) {
                    return Nil.value;
                };
                if (_534 instanceof Cons) {
                    if (eq(x)(_534.value0)) {
                        return step(_534.value1);
                    };
                    if (Prelude.otherwise) {
                        return new Cons(_534.value0, deleteBy(eq)(x)(_534.value1));
                    };
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 568, column 3 - line 569, column 3: " + [ _534.constructor.name ]);
            };
            return Prelude["<$>"](Data_Lazy.functorLazy)(go)(runList(xs));
        };
    };
};
var unionBy = function (eq) {
    return function (xs) {
        return function (ys) {
            return Prelude["<>"](semigroupList)(xs)(Data_Foldable.foldl(foldableList)(Prelude.flip(deleteBy(eq)))(nubBy(eq)(ys))(xs));
        };
    };
};
var union = function (__dict_Eq_8) {
    return unionBy(Prelude["=="](__dict_Eq_8));
};
var deleteAt = function (n) {
    return function (xs) {
        var go = function (_516) {
            return function (_517) {
                if (_517 instanceof Nil) {
                    return Nil.value;
                };
                if (_516 === 0 && _517 instanceof Cons) {
                    return step(_517.value1);
                };
                if (_517 instanceof Cons) {
                    return new Cons(_517.value0, deleteAt(Prelude["-"](Prelude.ringInt)(_516)(1))(_517.value1));
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 327, column 3 - line 328, column 3: " + [ _516.constructor.name, _517.constructor.name ]);
            };
        };
        return Prelude["<$>"](Data_Lazy.functorLazy)(go(n))(runList(xs));
    };
};
var $$delete = function (__dict_Eq_9) {
    return deleteBy(Prelude["=="](__dict_Eq_9));
};
var $bslash$bslash = function (__dict_Eq_10) {
    return Data_Foldable.foldl(foldableList)(Prelude.flip($$delete(__dict_Eq_10)));
};
var cycle = function (xs) {
    return Control_Lazy.fix(lazyList)(function (ys) {
        return Prelude["<>"](semigroupList)(xs)(ys);
    });
};
var cons = function (x) {
    return function (xs) {
        return List(Data_Lazy.defer(function (_505) {
            return new Cons(x, xs);
        }));
    };
};
var init = function (xs) {
    var go = function (_512) {
        if (_512 instanceof Cons) {
            if ($$null(_512.value1)) {
                return new Data_Maybe.Just(nil);
            };
            if (Prelude.otherwise) {
                return Prelude["<$>"](Data_Maybe.functorMaybe)(cons(_512.value0))(go(step(_512.value1)));
            };
        };
        return Data_Maybe.Nothing.value;
    };
    return go(step(xs));
};
var insertAt = function (_508) {
    return function (x) {
        return function (xs) {
            if (_508 === 0) {
                return cons(x)(xs);
            };
            var go = function (_515) {
                if (_515 instanceof Nil) {
                    return new Cons(x, nil);
                };
                if (_515 instanceof Cons) {
                    return new Cons(_515.value0, insertAt(Prelude["-"](Prelude.ringInt)(_508)(1))(x)(_515.value1));
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 314, column 3 - line 315, column 3: " + [ _515.constructor.name ]);
            };
            return Prelude["<$>"](Data_Lazy.functorLazy)(go)(runList(xs));
        };
    };
};
var iterate = function (f) {
    return function (x) {
        return Control_Lazy.fix(lazyList)(function (xs) {
            return cons(x)(Prelude["<$>"](functorList)(f)(xs));
        });
    };
};
var repeat = function (x) {
    return Control_Lazy.fix(lazyList)(function (xs) {
        return cons(x)(xs);
    });
};
var reverse = function (xs) {
    var go = function (__copy_acc) {
        return function (__copy__522) {
            var acc = __copy_acc;
            var _522 = __copy__522;
            tco: while (true) {
                var acc_1 = acc;
                if (_522 instanceof Nil) {
                    return acc_1;
                };
                if (_522 instanceof Cons) {
                    var __tco_acc = cons(_522.value0)(acc);
                    var __tco__522 = step(_522.value1);
                    acc = __tco_acc;
                    _522 = __tco__522;
                    continue tco;
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 380, column 1 - line 381, column 1: " + [ acc.constructor.name, _522.constructor.name ]);
            };
        };
    };
    return go(nil)(step(xs));
};
var singleton = function (a) {
    return cons(a)(nil);
};
var range = function (start) {
    return function (end) {
        if (Prelude["=="](Prelude.eqInt)(start)(end)) {
            return singleton(start);
        };
        if (Prelude.otherwise) {
            var go = function (__copy_s) {
                return function (__copy_e) {
                    return function (__copy_step_1) {
                        return function (__copy_tail_1) {
                            var s = __copy_s;
                            var e = __copy_e;
                            var step_1 = __copy_step_1;
                            var tail_1 = __copy_tail_1;
                            tco: while (true) {
                                if (Prelude["=="](Prelude.eqInt)(s)(e)) {
                                    return cons(s)(tail_1);
                                };
                                if (Prelude.otherwise) {
                                    var __tco_s = Prelude["+"](Prelude.semiringInt)(s)(step_1);
                                    var __tco_e = e;
                                    var __tco_step_1 = step_1;
                                    var __tco_tail_1 = cons(s)(tail_1);
                                    s = __tco_s;
                                    e = __tco_e;
                                    step_1 = __tco_step_1;
                                    tail_1 = __tco_tail_1;
                                    continue tco;
                                };
                                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 161, column 1 - line 162, column 1: " + [ s.constructor.name, e.constructor.name, step_1.constructor.name, tail_1.constructor.name ]);
                            };
                        };
                    };
                };
            };
            return go(end)(start)((function () {
                var _798 = Prelude[">"](Prelude.ordInt)(start)(end);
                if (_798) {
                    return 1;
                };
                if (!_798) {
                    return Prelude.negate(Prelude.ringInt)(1);
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 161, column 1 - line 162, column 1: " + [ _798.constructor.name ]);
            })())(nil);
        };
        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 161, column 1 - line 162, column 1: " + [ start.constructor.name, end.constructor.name ]);
    };
};
var $dot$dot = range;
var span = function (p) {
    return function (xs) {
        var _799 = uncons(xs);
        if (_799 instanceof Data_Maybe.Just && p(_799.value0.head)) {
            var _800 = span(p)(_799.value0.tail);
            return {
                init: cons(_799.value0.head)(_800.init), 
                rest: _800.rest
            };
        };
        return {
            init: nil, 
            rest: xs
        };
    };
};
var groupBy = function (eq) {
    return function (xs) {
        var go = function (_532) {
            if (_532 instanceof Nil) {
                return Nil.value;
            };
            if (_532 instanceof Cons) {
                var _807 = span(eq(_532.value0))(_532.value1);
                return new Cons(cons(_532.value0)(_807.init), groupBy(eq)(_807.rest));
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 517, column 3 - line 518, column 3: " + [ _532.constructor.name ]);
        };
        return Prelude["<$>"](Data_Lazy.functorLazy)(go)(runList(xs));
    };
};
var group = function (__dict_Eq_11) {
    return groupBy(Prelude["=="](__dict_Eq_11));
};
var toList = function (__dict_Foldable_12) {
    return Data_Foldable.foldr(__dict_Foldable_12)(cons)(nil);
};
var traversableList = new Data_Traversable.Traversable(function () {
    return foldableList;
}, function () {
    return functorList;
}, function (__dict_Applicative_14) {
    return function (xs) {
        var go = function (_549) {
            if (_549 instanceof Nil) {
                return Prelude.pure(__dict_Applicative_14)(nil);
            };
            if (_549 instanceof Cons) {
                return Prelude["<*>"](__dict_Applicative_14["__superclass_Prelude.Apply_0"]())(Prelude["<$>"]((__dict_Applicative_14["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(cons)(_549.value0))(Data_Traversable.sequence(traversableList)(__dict_Applicative_14)(_549.value1));
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 711, column 5 - line 712, column 5: " + [ _549.constructor.name ]);
        };
        return go(step(xs));
    };
}, function (__dict_Applicative_13) {
    return function (f) {
        return function (xs) {
            var go = function (_548) {
                if (_548 instanceof Nil) {
                    return Prelude.pure(__dict_Applicative_13)(nil);
                };
                if (_548 instanceof Cons) {
                    return Prelude["<*>"](__dict_Applicative_13["__superclass_Prelude.Apply_0"]())(Prelude["<$>"]((__dict_Applicative_13["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(cons)(f(_548.value0)))(Data_Traversable.traverse(traversableList)(__dict_Applicative_13)(f)(_548.value1));
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 705, column 5 - line 706, column 5: " + [ _548.constructor.name ]);
            };
            return go(step(xs));
        };
    };
});
var $colon = cons;
var unfoldableList = new Data_Unfoldable.Unfoldable(function (f) {
    return function (b) {
        var go = function (_547) {
            if (_547 instanceof Data_Maybe.Nothing) {
                return nil;
            };
            if (_547 instanceof Data_Maybe.Just) {
                return $colon(_547.value0.value0)(Control_Lazy.defer(lazyList)(function (_506) {
                    return go(f(_547.value0.value1));
                }));
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 693, column 1 - line 701, column 1: " + [ _547.constructor.name ]);
        };
        return go(f(b));
    };
});
var concatMap = function (f) {
    return function (xs) {
        var go = function (_523) {
            if (_523 instanceof Nil) {
                return Nil.value;
            };
            if (_523 instanceof Cons) {
                return step(Prelude["<>"](semigroupList)(f(_523.value0))(concatMap(f)(_523.value1)));
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 399, column 3 - line 400, column 3: " + [ _523.constructor.name ]);
        };
        return Prelude["<$>"](Data_Lazy.functorLazy)(go)(runList(xs));
    };
};
var catMaybes = mapMaybe(Prelude.id(Prelude.categoryFn));
var monadList = new Prelude.Monad(function () {
    return applicativeList;
}, function () {
    return bindList;
});
var bindList = new Prelude.Bind(function () {
    return applyList;
}, Prelude.flip(concatMap));
var applyList = new Prelude.Apply(function () {
    return functorList;
}, Prelude.ap(monadList));
var applicativeList = new Prelude.Applicative(function () {
    return applyList;
}, singleton);
var concat = function (_15) {
    return Prelude[">>="](bindList)(_15)(Prelude.id(Prelude.categoryFn));
};
var alterAt = function (n) {
    return function (f) {
        return function (xs) {
            var go = function (_520) {
                return function (_521) {
                    if (_521 instanceof Nil) {
                        return Nil.value;
                    };
                    if (_520 === 0 && _521 instanceof Cons) {
                        var _828 = f(_521.value0);
                        if (_828 instanceof Data_Maybe.Nothing) {
                            return step(_521.value1);
                        };
                        if (_828 instanceof Data_Maybe.Just) {
                            return new Cons(_828.value0, _521.value1);
                        };
                        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 367, column 3 - line 368, column 3: " + [ _828.constructor.name ]);
                    };
                    if (_521 instanceof Cons) {
                        return new Cons(_521.value0, alterAt(Prelude["-"](Prelude.ringInt)(_520)(1))(f)(_521.value1));
                    };
                    throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-lists/src/Data/List/Lazy.purs line 367, column 3 - line 368, column 3: " + [ _520.constructor.name, _521.constructor.name ]);
                };
            };
            return Prelude["<$>"](Data_Lazy.functorLazy)(go(n))(runList(xs));
        };
    };
};
var modifyAt = function (n) {
    return function (f) {
        return alterAt(n)(Prelude["<<<"](Prelude.semigroupoidFn)(Data_Maybe.Just.create)(f));
    };
};
var altList = new Control_Alt.Alt(function () {
    return functorList;
}, Prelude.append(semigroupList));
var plusList = new Control_Plus.Plus(function () {
    return altList;
}, nil);
var alternativeList = new Control_Alternative.Alternative(function () {
    return plusList;
}, function () {
    return applicativeList;
});
var monadPlusList = new Control_MonadPlus.MonadPlus(function () {
    return alternativeList;
}, function () {
    return monadList;
});
module.exports = {
    Nil: Nil, 
    Cons: Cons, 
    List: List, 
    zip: zip, 
    zipWith: zipWith, 
    intersectBy: intersectBy, 
    intersect: intersect, 
    "\\\\": $bslash$bslash, 
    deleteBy: deleteBy, 
    "delete": $$delete, 
    unionBy: unionBy, 
    union: union, 
    nubBy: nubBy, 
    nub: nub, 
    groupBy: groupBy, 
    group: group, 
    span: span, 
    dropWhile: dropWhile, 
    drop: drop, 
    takeWhile: takeWhile, 
    take: take, 
    catMaybes: catMaybes, 
    mapMaybe: mapMaybe, 
    filter: filter, 
    concatMap: concatMap, 
    concat: concat, 
    reverse: reverse, 
    alterAt: alterAt, 
    modifyAt: modifyAt, 
    updateAt: updateAt, 
    deleteAt: deleteAt, 
    insertAt: insertAt, 
    index: index, 
    "!!": $bang$bang, 
    uncons: uncons, 
    init: init, 
    tail: tail, 
    last: last, 
    head: head, 
    insertBy: insertBy, 
    insert: insert, 
    cons: cons, 
    ":": $colon, 
    length: length, 
    "null": $$null, 
    cycle: cycle, 
    iterate: iterate, 
    repeat: repeat, 
    range: range, 
    "..": $dot$dot, 
    singleton: singleton, 
    nil: nil, 
    step: step, 
    toList: toList, 
    fromList: fromList, 
    runList: runList, 
    showList: showList, 
    eqList: eqList, 
    ordList: ordList, 
    lazyList: lazyList, 
    semigroupList: semigroupList, 
    monoidList: monoidList, 
    functorList: functorList, 
    foldableList: foldableList, 
    unfoldableList: unfoldableList, 
    traversableList: traversableList, 
    applyList: applyList, 
    applicativeList: applicativeList, 
    bindList: bindList, 
    monadList: monadList, 
    altList: altList, 
    plusList: plusList, 
    alternativeList: alternativeList, 
    monadPlusList: monadPlusList
};
