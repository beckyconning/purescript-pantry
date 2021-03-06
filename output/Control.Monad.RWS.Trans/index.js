// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var Data_Tuple = require("Data.Tuple");
var Data_Monoid = require("Data.Monoid");
var Control_Monad_Trans = require("Control.Monad.Trans");
var Control_Monad_Eff_Class = require("Control.Monad.Eff.Class");
var RWST = function (x) {
    return x;
};
var runRWST = function (_143) {
    return _143;
};
var withRWST = function (f) {
    return function (m) {
        return function (r) {
            return function (s) {
                return Data_Tuple.uncurry(runRWST(m))(f(r)(s));
            };
        };
    };
};
var mkSee = function (__dict_Monoid_5) {
    return function (s) {
        return function (a) {
            return function (w) {
                return {
                    state: s, 
                    result: a, 
                    log: w
                };
            };
        };
    };
};
var monadTransRWST = function (__dict_Monoid_6) {
    return new Control_Monad_Trans.MonadTrans(function (__dict_Monad_7) {
        return function (m) {
            return function (_142) {
                return function (s) {
                    return Prelude[">>="](__dict_Monad_7["__superclass_Prelude.Bind_1"]())(m)(function (a) {
                        return Prelude["return"](__dict_Monad_7["__superclass_Prelude.Applicative_0"]())(mkSee(__dict_Monoid_6)(s)(a)(Data_Monoid.mempty(__dict_Monoid_6)));
                    });
                };
            };
        };
    });
};
var mapRWST = function (f) {
    return function (m) {
        return function (r) {
            return function (s) {
                return f(runRWST(m)(r)(s));
            };
        };
    };
};
var functorRWST = function (__dict_Functor_8) {
    return new Prelude.Functor(function (f) {
        return function (m) {
            return function (r) {
                return function (s) {
                    return Prelude["<$>"](__dict_Functor_8)(function (see) {
                        var _249 = {};
                        for (var _250 in see) {
                            if (see.hasOwnProperty(_250)) {
                                _249[_250] = see[_250];
                            };
                        };
                        _249.result = f(see.result);
                        return _249;
                    })(runRWST(m)(r)(s));
                };
            };
        };
    });
};
var execRWST = function (__dict_Monad_9) {
    return function (m) {
        return function (r) {
            return function (s) {
                return Prelude[">>="](__dict_Monad_9["__superclass_Prelude.Bind_1"]())(runRWST(m)(r)(s))(function (see) {
                    return Prelude["return"](__dict_Monad_9["__superclass_Prelude.Applicative_0"]())(new Data_Tuple.Tuple(see.state, see.log));
                });
            };
        };
    };
};
var evalRWST = function (__dict_Monad_10) {
    return function (m) {
        return function (r) {
            return function (s) {
                return Prelude[">>="](__dict_Monad_10["__superclass_Prelude.Bind_1"]())(runRWST(m)(r)(s))(function (see) {
                    return Prelude["return"](__dict_Monad_10["__superclass_Prelude.Applicative_0"]())(new Data_Tuple.Tuple(see.result, see.log));
                });
            };
        };
    };
};
var applyRWST = function (__dict_Bind_13) {
    return function (__dict_Monoid_14) {
        return new Prelude.Apply(function () {
            return functorRWST((__dict_Bind_13["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]());
        }, function (f) {
            return function (m) {
                return function (r) {
                    return function (s) {
                        return Prelude[">>="](__dict_Bind_13)(runRWST(f)(r)(s))(function (_139) {
                            return Prelude["<#>"]((__dict_Bind_13["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(runRWST(m)(r)(_139.state))(function (_138) {
                                return mkSee(__dict_Monoid_14)(_138.state)(_139.result(_138.result))(Prelude["++"](__dict_Monoid_14["__superclass_Prelude.Semigroup_0"]())(_139.log)(_138.log));
                            });
                        });
                    };
                };
            };
        });
    };
};
var bindRWST = function (__dict_Bind_11) {
    return function (__dict_Monoid_12) {
        return new Prelude.Bind(function () {
            return applyRWST(__dict_Bind_11)(__dict_Monoid_12);
        }, function (m) {
            return function (f) {
                return function (r) {
                    return function (s) {
                        return Prelude[">>="](__dict_Bind_11)(runRWST(m)(r)(s))(function (_140) {
                            return Prelude["<#>"]((__dict_Bind_11["__superclass_Prelude.Apply_0"]())["__superclass_Prelude.Functor_0"]())(runRWST(f(_140.result))(r)(_140.state))(function (see$prime) {
                                var _260 = {};
                                for (var _261 in see$prime) {
                                    if (see$prime.hasOwnProperty(_261)) {
                                        _260[_261] = see$prime[_261];
                                    };
                                };
                                _260.log = Prelude["++"](__dict_Monoid_12["__superclass_Prelude.Semigroup_0"]())(_140.log)(see$prime.log);
                                return _260;
                            });
                        });
                    };
                };
            };
        });
    };
};
var applicativeRWST = function (__dict_Monad_15) {
    return function (__dict_Monoid_16) {
        return new Prelude.Applicative(function () {
            return applyRWST(__dict_Monad_15["__superclass_Prelude.Bind_1"]())(__dict_Monoid_16);
        }, function (a) {
            return function (_141) {
                return function (s) {
                    return Prelude.pure(__dict_Monad_15["__superclass_Prelude.Applicative_0"]())(mkSee(__dict_Monoid_16)(s)(a)(Data_Monoid.mempty(__dict_Monoid_16)));
                };
            };
        });
    };
};
var monadRWST = function (__dict_Monad_0) {
    return function (__dict_Monoid_1) {
        return new Prelude.Monad(function () {
            return applicativeRWST(__dict_Monad_0)(__dict_Monoid_1);
        }, function () {
            return bindRWST(__dict_Monad_0["__superclass_Prelude.Bind_1"]())(__dict_Monoid_1);
        });
    };
};
var monadEffRWS = function (__dict_Monad_2) {
    return function (__dict_Monoid_3) {
        return function (__dict_MonadEff_4) {
            return new Control_Monad_Eff_Class.MonadEff(function () {
                return monadRWST(__dict_Monad_2)(__dict_Monoid_3);
            }, Prelude["<<<"](Prelude.semigroupoidFn)(Control_Monad_Trans.lift(monadTransRWST(__dict_Monoid_3))(__dict_Monad_2))(Control_Monad_Eff_Class.liftEff(__dict_MonadEff_4)));
        };
    };
};
module.exports = {
    RWST: RWST, 
    withRWST: withRWST, 
    mapRWST: mapRWST, 
    execRWST: execRWST, 
    evalRWST: evalRWST, 
    runRWST: runRWST, 
    mkSee: mkSee, 
    functorRWST: functorRWST, 
    applyRWST: applyRWST, 
    bindRWST: bindRWST, 
    applicativeRWST: applicativeRWST, 
    monadRWST: monadRWST, 
    monadTransRWST: monadTransRWST, 
    monadEffRWS: monadEffRWS
};
