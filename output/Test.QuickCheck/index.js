// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var Control_Monad_Eff_Exception = require("Control.Monad.Eff.Exception");
var Test_QuickCheck_LCG = require("Test.QuickCheck.LCG");
var Control_Monad_Eff_Console = require("Control.Monad.Eff.Console");
var Test_QuickCheck_Gen = require("Test.QuickCheck.Gen");
var Data_List = require("Data.List");
var Test_QuickCheck_Arbitrary = require("Test.QuickCheck.Arbitrary");
var Control_Monad_Eff = require("Control.Monad.Eff");
var Control_Monad_Eff_Random = require("Control.Monad.Eff.Random");
var Data_Int = require("Data.Int");
var Success = (function () {
    function Success() {

    };
    Success.value = new Success();
    return Success;
})();
var Failed = (function () {
    function Failed(value0) {
        this.value0 = value0;
    };
    Failed.create = function (value0) {
        return new Failed(value0);
    };
    return Failed;
})();
var Testable = function (test) {
    this.test = test;
};
var $less$qmark$greater = function (_9) {
    return function (msg) {
        if (_9) {
            return Success.value;
        };
        if (!_9) {
            return new Failed(msg);
        };
        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-quickcheck/src/Test/QuickCheck.purs line 104, column 1 - line 105, column 1: " + [ _9.constructor.name, msg.constructor.name ]);
    };
};
var $eq$eq$eq = function (__dict_Eq_0) {
    return function (__dict_Show_1) {
        return function (a) {
            return function (b) {
                return $less$qmark$greater(Prelude["=="](__dict_Eq_0)(a)(b))(Prelude.show(__dict_Show_1)(a) + (" /= " + Prelude.show(__dict_Show_1)(b)));
            };
        };
    };
};
var $div$eq$eq = function (__dict_Eq_2) {
    return function (__dict_Show_3) {
        return function (a) {
            return function (b) {
                return $less$qmark$greater(Prelude["/="](__dict_Eq_2)(a)(b))(Prelude.show(__dict_Show_3)(a) + (" == " + Prelude.show(__dict_Show_3)(b)));
            };
        };
    };
};
var testableResult = new Testable(Prelude["return"](Test_QuickCheck_Gen.applicativeGen));
var testableBoolean = new Testable(function (_12) {
    if (_12) {
        return Prelude["return"](Test_QuickCheck_Gen.applicativeGen)(Success.value);
    };
    if (!_12) {
        return Prelude["return"](Test_QuickCheck_Gen.applicativeGen)(new Failed("Test returned false"));
    };
    throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-quickcheck/src/Test/QuickCheck.purs line 83, column 1 - line 87, column 1: " + [ _12.constructor.name ]);
});
var test = function (dict) {
    return dict.test;
};
var testableFunction = function (__dict_Arbitrary_4) {
    return function (__dict_Testable_5) {
        return new Testable(function (f) {
            return Prelude[">>="](Test_QuickCheck_Gen.bindGen)(Test_QuickCheck_Arbitrary.arbitrary(__dict_Arbitrary_4))(Prelude["<<<"](Prelude.semigroupoidFn)(test(__dict_Testable_5))(f));
        });
    };
};
var showResult = new Prelude.Show(function (_13) {
    if (_13 instanceof Success) {
        return "Success";
    };
    if (_13 instanceof Failed) {
        return "Failed: " + _13.value0;
    };
    throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-quickcheck/src/Test/QuickCheck.purs line 93, column 1 - line 104, column 1: " + [ _13.constructor.name ]);
});
var quickCheckPure = function (__dict_Testable_6) {
    return function (s) {
        return function (n) {
            return function (prop) {
                return Test_QuickCheck_Gen.evalGen(Data_List.replicateM(Test_QuickCheck_Gen.monadGen)(n)(test(__dict_Testable_6)(prop)))({
                    newSeed: s, 
                    size: 10
                });
            };
        };
    };
};
var quickCheck$prime = function (__dict_Testable_7) {
    return function (n) {
        return function (prop) {
            var throwOnFirstFailure = function (__copy_n_1) {
                return function (__copy__10) {
                    var n_1 = __copy_n_1;
                    var _10 = __copy__10;
                    tco: while (true) {
                        if (_10 instanceof Data_List.Nil) {
                            return Prelude["return"](Control_Monad_Eff.applicativeEff)(Prelude.unit);
                        };
                        var n_2 = n_1;
                        if (_10 instanceof Data_List.Cons && _10.value0 instanceof Failed) {
                            return Control_Monad_Eff_Exception.throwException(Control_Monad_Eff_Exception.error("Test " + (Prelude.show(Prelude.showInt)(n_2) + (" failed: \n" + _10.value0.value0))));
                        };
                        if (_10 instanceof Data_List.Cons) {
                            var __tco_n_1 = Prelude["+"](Prelude.semiringInt)(n_1)(Prelude.one(Prelude.semiringInt));
                            var __tco__10 = _10.value1;
                            n_1 = __tco_n_1;
                            _10 = __tco__10;
                            continue tco;
                        };
                        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-quickcheck/src/Test/QuickCheck.purs line 44, column 1 - line 45, column 1: " + [ n_1.constructor.name, _10.constructor.name ]);
                    };
                };
            };
            var countSuccesses = function (_11) {
                if (_11 instanceof Data_List.Nil) {
                    return Prelude.zero(Prelude.semiringInt);
                };
                if (_11 instanceof Data_List.Cons && _11.value0 instanceof Success) {
                    return Prelude["+"](Prelude.semiringInt)(Prelude.one(Prelude.semiringInt))(countSuccesses(_11.value1));
                };
                if (_11 instanceof Data_List.Cons) {
                    return countSuccesses(_11.value1);
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-quickcheck/src/Test/QuickCheck.purs line 44, column 1 - line 45, column 1: " + [ _11.constructor.name ]);
            };
            return function __do() {
                var _6 = Test_QuickCheck_LCG.randomSeed();
                return (function () {
                    var results = quickCheckPure(__dict_Testable_7)(_6)(n)(prop);
                    var successes = countSuccesses(results);
                    return function __do() {
                        Control_Monad_Eff_Console.log(Prelude.show(Prelude.showInt)(successes) + ("/" + (Prelude.show(Prelude.showInt)(n) + " test(s) passed.")))();
                        return throwOnFirstFailure(Prelude.one(Prelude.semiringInt))(results)();
                    };
                })()();
            };
        };
    };
};
var quickCheck = function (__dict_Testable_8) {
    return function (prop) {
        return quickCheck$prime(__dict_Testable_8)(100)(prop);
    };
};
module.exports = {
    Success: Success, 
    Failed: Failed, 
    Testable: Testable, 
    "/==": $div$eq$eq, 
    "===": $eq$eq$eq, 
    "<?>": $less$qmark$greater, 
    test: test, 
    quickCheckPure: quickCheckPure, 
    "quickCheck'": quickCheck$prime, 
    quickCheck: quickCheck, 
    testableResult: testableResult, 
    testableBoolean: testableBoolean, 
    testableFunction: testableFunction, 
    showResult: showResult
};
