// Generated by psc version 0.7.1.0
"use strict";
var $foreign = require("./foreign");
var Prelude = require("Prelude");
var Data_Monoid = require("Data.Monoid");
var Control_Comonad = require("Control.Comonad");
var Control_Extend = require("Control.Extend");
var Control_Lazy = require("Control.Lazy");
var showLazy = function (__dict_Show_0) {
    return new Prelude.Show(function (x) {
        return "Lazy " + Prelude.show(__dict_Show_0)($foreign.force(x));
    });
};
var semiringLazy = function (__dict_Semiring_1) {
    return new Prelude.Semiring(function (a) {
        return function (b) {
            return $foreign.defer(function (_99) {
                return Prelude["+"](__dict_Semiring_1)($foreign.force(a))($foreign.force(b));
            });
        };
    }, function (a) {
        return function (b) {
            return $foreign.defer(function (_101) {
                return Prelude["*"](__dict_Semiring_1)($foreign.force(a))($foreign.force(b));
            });
        };
    }, $foreign.defer(function (_102) {
        return Prelude.one(__dict_Semiring_1);
    }), $foreign.defer(function (_100) {
        return Prelude.zero(__dict_Semiring_1);
    }));
};
var semigroupLazy = function (__dict_Semigroup_2) {
    return new Prelude.Semigroup(function (a) {
        return function (b) {
            return $foreign.defer(function (_108) {
                return Prelude["<>"](__dict_Semigroup_2)($foreign.force(a))($foreign.force(b));
            });
        };
    });
};
var ringLazy = function (__dict_Ring_3) {
    return new Prelude.Ring(function () {
        return semiringLazy(__dict_Ring_3["__superclass_Prelude.Semiring_0"]());
    }, function (a) {
        return function (b) {
            return $foreign.defer(function (_103) {
                return Prelude["-"](__dict_Ring_3)($foreign.force(a))($foreign.force(b));
            });
        };
    });
};
var monoidLazy = function (__dict_Monoid_6) {
    return new Data_Monoid.Monoid(function () {
        return semigroupLazy(__dict_Monoid_6["__superclass_Prelude.Semigroup_0"]());
    }, $foreign.defer(function (_109) {
        return Data_Monoid.mempty(__dict_Monoid_6);
    }));
};
var moduloSemiringLazy = function (__dict_ModuloSemiring_7) {
    return new Prelude.ModuloSemiring(function () {
        return semiringLazy(__dict_ModuloSemiring_7["__superclass_Prelude.Semiring_0"]());
    }, function (a) {
        return function (b) {
            return $foreign.defer(function (_104) {
                return Prelude["/"](__dict_ModuloSemiring_7)($foreign.force(a))($foreign.force(b));
            });
        };
    }, function (a) {
        return function (b) {
            return $foreign.defer(function (_105) {
                return Prelude.mod(__dict_ModuloSemiring_7)($foreign.force(a))($foreign.force(b));
            });
        };
    });
};
var lazyLazy = new Control_Lazy.Lazy(function (f) {
    return $foreign.defer(function (_115) {
        return $foreign.force(f(Prelude.unit));
    });
});
var functorLazy = new Prelude.Functor(function (f) {
    return function (l) {
        return $foreign.defer(function (_110) {
            return f($foreign.force(l));
        });
    };
});
var extendLazy = new Control_Extend.Extend(function () {
    return functorLazy;
}, function (f) {
    return function (x) {
        return $foreign.defer(function (_114) {
            return f(x);
        });
    };
});
var eqLazy = function (__dict_Eq_8) {
    return new Prelude.Eq(function (x) {
        return function (y) {
            return Prelude["=="](__dict_Eq_8)($foreign.force(x))($foreign.force(y));
        };
    });
};
var ordLazy = function (__dict_Ord_4) {
    return new Prelude.Ord(function () {
        return eqLazy(__dict_Ord_4["__superclass_Prelude.Eq_0"]());
    }, function (x) {
        return function (y) {
            return Prelude.compare(__dict_Ord_4)($foreign.force(x))($foreign.force(y));
        };
    });
};
var divisionRingLazy = function (__dict_DivisionRing_9) {
    return new Prelude.DivisionRing(function () {
        return moduloSemiringLazy(__dict_DivisionRing_9["__superclass_Prelude.ModuloSemiring_1"]());
    }, function () {
        return ringLazy(__dict_DivisionRing_9["__superclass_Prelude.Ring_0"]());
    });
};
var numLazy = function (__dict_Num_5) {
    return new Prelude.Num(function () {
        return divisionRingLazy(__dict_Num_5["__superclass_Prelude.DivisionRing_0"]());
    });
};
var comonadLazy = new Control_Comonad.Comonad(function () {
    return extendLazy;
}, $foreign.force);
var boundedLazy = function (__dict_Bounded_11) {
    return new Prelude.Bounded($foreign.defer(function (_107) {
        return Prelude.bottom(__dict_Bounded_11);
    }), $foreign.defer(function (_106) {
        return Prelude.top(__dict_Bounded_11);
    }));
};
var boundedOrdLazy = function (__dict_BoundedOrd_10) {
    return new Prelude.BoundedOrd(function () {
        return boundedLazy(__dict_BoundedOrd_10["__superclass_Prelude.Bounded_0"]());
    }, function () {
        return ordLazy(__dict_BoundedOrd_10["__superclass_Prelude.Ord_1"]());
    });
};
var applyLazy = new Prelude.Apply(function () {
    return functorLazy;
}, function (f) {
    return function (x) {
        return $foreign.defer(function (_111) {
            return $foreign.force(f)($foreign.force(x));
        });
    };
});
var bindLazy = new Prelude.Bind(function () {
    return applyLazy;
}, function (l) {
    return function (f) {
        return $foreign.defer(function (_113) {
            return Prelude["<<<"](Prelude.semigroupoidFn)($foreign.force)(Prelude["<<<"](Prelude.semigroupoidFn)(f)($foreign.force))(l);
        });
    };
});
var booleanAlgebraLazy = function (__dict_BooleanAlgebra_12) {
    return new Prelude.BooleanAlgebra(function () {
        return boundedLazy(__dict_BooleanAlgebra_12["__superclass_Prelude.Bounded_0"]());
    }, function (a) {
        return function (b) {
            return Prelude["<*>"](applyLazy)(Prelude["<$>"](functorLazy)(Prelude.conj(__dict_BooleanAlgebra_12))(a))(b);
        };
    }, function (a) {
        return function (b) {
            return Prelude["<*>"](applyLazy)(Prelude["<$>"](functorLazy)(Prelude.disj(__dict_BooleanAlgebra_12))(a))(b);
        };
    }, function (a) {
        return Prelude["<$>"](functorLazy)(Prelude.not(__dict_BooleanAlgebra_12))(a);
    });
};
var applicativeLazy = new Prelude.Applicative(function () {
    return applyLazy;
}, function (a) {
    return $foreign.defer(function (_112) {
        return a;
    });
});
var monadLazy = new Prelude.Monad(function () {
    return applicativeLazy;
}, function () {
    return bindLazy;
});
module.exports = {
    semiringLazy: semiringLazy, 
    ringLazy: ringLazy, 
    moduloSemiringLazy: moduloSemiringLazy, 
    divisionRingLazy: divisionRingLazy, 
    numLazy: numLazy, 
    eqLazy: eqLazy, 
    ordLazy: ordLazy, 
    boundedLazy: boundedLazy, 
    boundedOrdLazy: boundedOrdLazy, 
    semigroupLazy: semigroupLazy, 
    monoidLazy: monoidLazy, 
    booleanAlgebraLazy: booleanAlgebraLazy, 
    functorLazy: functorLazy, 
    applyLazy: applyLazy, 
    applicativeLazy: applicativeLazy, 
    bindLazy: bindLazy, 
    monadLazy: monadLazy, 
    extendLazy: extendLazy, 
    comonadLazy: comonadLazy, 
    showLazy: showLazy, 
    lazyLazy: lazyLazy, 
    force: $foreign.force, 
    defer: $foreign.defer
};
