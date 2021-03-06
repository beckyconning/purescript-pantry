// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var Control_Apply = require("Control.Apply");
var Control_Monad_Error = require("Control.Monad.Error");
var Control_Monad_Rec_Class = require("Control.Monad.Rec.Class");
var Control_Monad_Trans = require("Control.Monad.Trans");
var Control_Monad_Eff_Class = require("Control.Monad.Eff.Class");
var Control_Alt = require("Control.Alt");
var Control_Alternative = require("Control.Alternative");
var Control_MonadPlus = require("Control.MonadPlus");
var Control_Plus = require("Control.Plus");
var Data_Either = require("Data.Either");
var Data_Monoid = require("Data.Monoid");
var Data_Tuple = require("Data.Tuple");
var ErrorT = function (x) {
    return x;
};
var runErrorT = function (_129) {
    return _129;
};
var monadTransErrorT = new Control_Monad_Trans.MonadTrans(function (__dict_Monad_2) {
    return function (m) {
        return ErrorT(Prelude.bind(__dict_Monad_2["__superclass_Prelude.Bind_1"]())(m)(function (_22) {
            return Prelude["return"](__dict_Monad_2["__superclass_Prelude.Applicative_0"]())(new Data_Either.Right(_22));
        }));
    };
});
var mapErrorT = function (f) {
    return function (m) {
        return ErrorT(f(runErrorT(m)));
    };
};
var liftPassError = function (__dict_Monad_10) {
    return function (pass) {
        return mapErrorT(function (m) {
            return pass(Prelude.bind(__dict_Monad_10["__superclass_Prelude.Bind_1"]())(m)(function (_24) {
                return Prelude["return"](__dict_Monad_10["__superclass_Prelude.Applicative_0"]())((function () {
                    if (_24 instanceof Data_Either.Left) {
                        return new Data_Tuple.Tuple(new Data_Either.Left(_24.value0), Prelude.id(Prelude.categoryFn));
                    };
                    if (_24 instanceof Data_Either.Right) {
                        return new Data_Tuple.Tuple(new Data_Either.Right(_24.value0.value0), _24.value0.value1);
                    };
                    throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-transformers/src/Control/Monad/Error/Trans.purs line 87, column 1 - line 88, column 1: " + [ _24.constructor.name ]);
                })());
            }));
        });
    };
};
var liftListenError = function (__dict_Monad_11) {
    return function (listen) {
        return mapErrorT(function (m) {
            return Prelude.bind(__dict_Monad_11["__superclass_Prelude.Bind_1"]())(listen(m))(function (_23) {
                return Prelude["return"](__dict_Monad_11["__superclass_Prelude.Applicative_0"]())(Prelude["<$>"](Data_Either.functorEither)(function (r) {
                    return new Data_Tuple.Tuple(r, _23.value1);
                })(_23.value0));
            });
        });
    };
};
var liftCallCCError = function (callCC) {
    return function (f) {
        return ErrorT(callCC(function (c) {
            return runErrorT(f(function (a) {
                return ErrorT(c(new Data_Either.Right(a)));
            }));
        }));
    };
};
var functorErrorT = function (__dict_Functor_12) {
    return new Prelude.Functor(function (f) {
        return Prelude["<<<"](Prelude.semigroupoidFn)(ErrorT)(Prelude["<<<"](Prelude.semigroupoidFn)(Prelude["<$>"](__dict_Functor_12)(Prelude["<$>"](Data_Either.functorEither)(f)))(runErrorT));
    });
};
var applyErrorT = function (__dict_Apply_14) {
    return new Prelude.Apply(function () {
        return functorErrorT(__dict_Apply_14["__superclass_Prelude.Functor_0"]());
    }, function (_130) {
        return function (_131) {
            return ErrorT(Prelude["<*>"](__dict_Apply_14)(Prelude["<$>"](__dict_Apply_14["__superclass_Prelude.Functor_0"]())(Control_Apply.lift2(Data_Either.applyEither)(Prelude["$"]))(_130))(_131));
        };
    });
};
var bindErrorT = function (__dict_Monad_13) {
    return new Prelude.Bind(function () {
        return applyErrorT((__dict_Monad_13["__superclass_Prelude.Applicative_0"]())["__superclass_Prelude.Apply_0"]());
    }, function (m) {
        return function (f) {
            return ErrorT(Prelude.bind(__dict_Monad_13["__superclass_Prelude.Bind_1"]())(runErrorT(m))(function (_20) {
                if (_20 instanceof Data_Either.Left) {
                    return Prelude["return"](__dict_Monad_13["__superclass_Prelude.Applicative_0"]())(new Data_Either.Left(_20.value0));
                };
                if (_20 instanceof Data_Either.Right) {
                    return runErrorT(f(_20.value0));
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-transformers/src/Control/Monad/Error/Trans.purs line 55, column 1 - line 62, column 1: " + [ _20.constructor.name ]);
            }));
        };
    });
};
var applicativeErrorT = function (__dict_Applicative_15) {
    return new Prelude.Applicative(function () {
        return applyErrorT(__dict_Applicative_15["__superclass_Prelude.Apply_0"]());
    }, function (a) {
        return ErrorT(Prelude.pure(__dict_Applicative_15)(new Data_Either.Right(a)));
    });
};
var monadErrorT = function (__dict_Monad_7) {
    return new Prelude.Monad(function () {
        return applicativeErrorT(__dict_Monad_7["__superclass_Prelude.Applicative_0"]());
    }, function () {
        return bindErrorT(__dict_Monad_7);
    });
};
var monadEffError = function (__dict_Monad_8) {
    return function (__dict_MonadEff_9) {
        return new Control_Monad_Eff_Class.MonadEff(function () {
            return monadErrorT(__dict_Monad_8);
        }, Prelude["<<<"](Prelude.semigroupoidFn)(Control_Monad_Trans.lift(monadTransErrorT)(__dict_Monad_8))(Control_Monad_Eff_Class.liftEff(__dict_MonadEff_9)));
    };
};
var monadRecErrorT = function (__dict_Error_3) {
    return function (__dict_MonadRec_4) {
        return new Control_Monad_Rec_Class.MonadRec(function () {
            return monadErrorT(__dict_MonadRec_4["__superclass_Prelude.Monad_0"]());
        }, function (f) {
            return Prelude["<<<"](Prelude.semigroupoidFn)(ErrorT)(Control_Monad_Rec_Class.tailRecM(__dict_MonadRec_4)(function (a) {
                return Prelude.bind((__dict_MonadRec_4["__superclass_Prelude.Monad_0"]())["__superclass_Prelude.Bind_1"]())(runErrorT(f(a)))(function (_21) {
                    return Prelude["return"]((__dict_MonadRec_4["__superclass_Prelude.Monad_0"]())["__superclass_Prelude.Applicative_0"]())((function () {
                        if (_21 instanceof Data_Either.Left) {
                            return new Data_Either.Right(new Data_Either.Left(_21.value0));
                        };
                        if (_21 instanceof Data_Either.Right && _21.value0 instanceof Data_Either.Left) {
                            return new Data_Either.Left(_21.value0.value0);
                        };
                        if (_21 instanceof Data_Either.Right && _21.value0 instanceof Data_Either.Right) {
                            return new Data_Either.Right(new Data_Either.Right(_21.value0.value0));
                        };
                        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-transformers/src/Control/Monad/Error/Trans.purs line 64, column 1 - line 72, column 1: " + [ _21.constructor.name ]);
                    })());
                });
            }));
        });
    };
};
var altErrorT = function (__dict_Monad_18) {
    return new Control_Alt.Alt(function () {
        return functorErrorT(((__dict_Monad_18["__superclass_Prelude.Applicative_0"]())["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]());
    }, function (x) {
        return function (y) {
            return ErrorT(Prelude[">>="](__dict_Monad_18["__superclass_Prelude.Bind_1"]())(runErrorT(x))(function (e) {
                if (e instanceof Data_Either.Left) {
                    return runErrorT(y);
                };
                return Prelude["return"](__dict_Monad_18["__superclass_Prelude.Applicative_0"]())(e);
            }));
        };
    });
};
var plusErrorT = function (__dict_Monad_0) {
    return function (__dict_Error_1) {
        return new Control_Plus.Plus(function () {
            return altErrorT(__dict_Monad_0);
        }, Prelude["return"](__dict_Monad_0["__superclass_Prelude.Applicative_0"]())(Data_Either.Left.create(Control_Monad_Error.strMsg(__dict_Error_1)("No alternative"))));
    };
};
var alternativeErrorT = function (__dict_Monad_16) {
    return function (__dict_Error_17) {
        return new Control_Alternative.Alternative(function () {
            return plusErrorT(__dict_Monad_16)(__dict_Error_17);
        }, function () {
            return applicativeErrorT(__dict_Monad_16["__superclass_Prelude.Applicative_0"]());
        });
    };
};
var monadPlusErrorT = function (__dict_Monad_5) {
    return function (__dict_Error_6) {
        return new Control_MonadPlus.MonadPlus(function () {
            return alternativeErrorT(__dict_Monad_5)(__dict_Error_6);
        }, function () {
            return monadErrorT(__dict_Monad_5);
        });
    };
};
module.exports = {
    ErrorT: ErrorT, 
    liftCallCCError: liftCallCCError, 
    liftPassError: liftPassError, 
    liftListenError: liftListenError, 
    mapErrorT: mapErrorT, 
    runErrorT: runErrorT, 
    functorErrorT: functorErrorT, 
    applyErrorT: applyErrorT, 
    applicativeErrorT: applicativeErrorT, 
    altErrorT: altErrorT, 
    plusErrorT: plusErrorT, 
    alternativeErrorT: alternativeErrorT, 
    bindErrorT: bindErrorT, 
    monadErrorT: monadErrorT, 
    monadRecErrorT: monadRecErrorT, 
    monadPlusErrorT: monadPlusErrorT, 
    monadTransErrorT: monadTransErrorT, 
    monadEffError: monadEffError
};
