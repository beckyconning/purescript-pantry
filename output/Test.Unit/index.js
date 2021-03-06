// Generated by psc version 0.7.1.0
"use strict";
var $foreign = require("./foreign");
var Prelude = require("Prelude");
var Control_Monad_Eff_Ref = require("Control.Monad.Eff.Ref");
var Control_Monad_Cont_Trans = require("Control.Monad.Cont.Trans");
var Control_Monad_Error_Trans = require("Control.Monad.Error.Trans");
var Test_Unit_Console = require("Test.Unit.Console");
var Control_Monad_Eff = require("Control.Monad.Eff");
var Data_Either = require("Data.Either");
var testC = function (c) {
    return Control_Monad_Error_Trans.ErrorT(function (cb) {
        return Control_Monad_Cont_Trans.runContT(c)(cb);
    });
};
var testFn = function (f) {
    return testC(f);
};
var success = new Data_Either.Right(Prelude.unit);
var runWithStderr = function (l) {
    return function (t) {
        return function (cb) {
            var handler = function (_134) {
                if (_134 instanceof Data_Either.Right) {
                    return function __do() {
                        Test_Unit_Console.restorePos();
                        Test_Unit_Console.eraseLine();
                        Test_Unit_Console.printPass("\u2713 Passed: ")();
                        Test_Unit_Console.printLabel(l)();
                        Test_Unit_Console.print("\n")();
                        return cb(success)();
                    };
                };
                if (_134 instanceof Data_Either.Left) {
                    return function __do() {
                        Test_Unit_Console.restorePos();
                        Test_Unit_Console.eraseLine();
                        Test_Unit_Console.printFail("\u2620 Failed: ")();
                        Test_Unit_Console.printLabel(l)();
                        Test_Unit_Console.print(" because ")();
                        Test_Unit_Console.printFail(_134.value0)();
                        Test_Unit_Console.print("\n")();
                        return cb(_134)();
                    };
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-test-unit/src/Test/Unit.purs line 87, column 9 - line 94, column 9: " + [ _134.constructor.name ]);
            };
            return function __do() {
                Test_Unit_Console.savePos();
                Test_Unit_Console.print("\u2192 Running: ")();
                Test_Unit_Console.printLabel(l)();
                return Control_Monad_Cont_Trans.runContT(Control_Monad_Error_Trans.runErrorT(t))(handler)();
            };
        };
    };
};
var runWithConsole = function (l) {
    return function (t) {
        return function (cb) {
            var handler = function (_135) {
                if (_135 instanceof Data_Either.Right) {
                    return function __do() {
                        Test_Unit_Console.consoleLog("\u2713 Passed: " + l)();
                        return cb(success)();
                    };
                };
                if (_135 instanceof Data_Either.Left) {
                    return function __do() {
                        Test_Unit_Console.consoleError("\u2620 Failed: " + (l + (" because " + _135.value0)))();
                        return cb(_135)();
                    };
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-test-unit/src/Test/Unit.purs line 106, column 9 - line 109, column 9: " + [ _135.constructor.name ]);
            };
            return Control_Monad_Cont_Trans.runContT(Control_Monad_Error_Trans.runErrorT(t))(handler);
        };
    };
};
var test = function (l) {
    return function (t) {
        return Control_Monad_Error_Trans.ErrorT((function () {
            if (Test_Unit_Console.hasStderr) {
                return runWithStderr(l)(t);
            };
            if (!Test_Unit_Console.hasStderr) {
                return runWithConsole(l)(t);
            };
            throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-test-unit/src/Test/Unit.purs line 113, column 1 - line 114, column 1: " + [ Test_Unit_Console.hasStderr.constructor.name ]);
        })());
    };
};
var runTest = function (t) {
    var handler = function (_136) {
        if (_136 instanceof Data_Either.Left) {
            return $foreign.exit(1);
        };
        return $foreign.exit(0);
    };
    return Control_Monad_Cont_Trans.runContT(Control_Monad_Error_Trans.runErrorT(t))(handler);
};
var pickFirst = function (t1) {
    return function (t2) {
        return Control_Monad_Error_Trans.ErrorT(Control_Monad_Cont_Trans.ContT(function (cb) {
            return function __do() {
                var _26 = Control_Monad_Eff_Ref.newRef(false)();
                return (function () {
                    var $$yield = function (t) {
                        return Control_Monad_Cont_Trans.runContT(Control_Monad_Error_Trans.runErrorT(t))(function (res) {
                            return function __do() {
                                var _25 = Control_Monad_Eff_Ref.readRef(_26)();
                                Control_Monad_Eff_Ref.writeRef(_26)(true)();
                                if (_25) {
                                    return Prelude["return"](Control_Monad_Eff.applicativeEff)(Prelude.unit)();
                                };
                                if (!_25) {
                                    return cb(res)();
                                };
                                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-test-unit/src/Test/Unit.purs line 44, column 7 - line 48, column 3: " + [ _25.constructor.name ]);
                            };
                        });
                    };
                    return function __do() {
                        $$yield(t1)();
                        return $$yield(t2)();
                    };
                })()();
            };
        }));
    };
};
var failure = Data_Either.Left.create;
var timeout = function (time) {
    return function (test_1) {
        return pickFirst(test_1)(Control_Monad_Error_Trans.ErrorT(function (cb) {
            return function __do() {
                $foreign.setTimeout(time)(cb(failure("test timed out after " + (Prelude.show(Prelude.showInt)(time) + "ms"))))();
                return Prelude["return"](Control_Monad_Eff.applicativeEff)(Prelude.unit)();
            };
        }));
    };
};
var assertFalse = function (reason) {
    return function (_133) {
        if (!_133) {
            return Control_Monad_Error_Trans.ErrorT(function (cb) {
                return cb(success);
            });
        };
        if (_133) {
            return Control_Monad_Error_Trans.ErrorT(function (cb) {
                return cb(failure(reason));
            });
        };
        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-test-unit/src/Test/Unit.purs line 66, column 1 - line 67, column 1: " + [ reason.constructor.name, _133.constructor.name ]);
    };
};
var assertC = function (reason) {
    return function (c) {
        return Control_Monad_Error_Trans.ErrorT(function (cb) {
            return Control_Monad_Cont_Trans.runContT(c)(function (res) {
                if (res) {
                    return cb(new Data_Either.Right(Prelude.unit));
                };
                if (!res) {
                    return cb(new Data_Either.Left(reason));
                };
                throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-test-unit/src/Test/Unit.purs line 76, column 1 - line 77, column 1: " + [ res.constructor.name ]);
            });
        });
    };
};
var assertFn = function (reason) {
    return function (f) {
        return assertC(reason)(f);
    };
};
var assert = function (reason) {
    return function (_132) {
        if (_132) {
            return Control_Monad_Error_Trans.ErrorT(function (cb) {
                return cb(success);
            });
        };
        if (!_132) {
            return Control_Monad_Error_Trans.ErrorT(function (cb) {
                return cb(failure(reason));
            });
        };
        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-test-unit/src/Test/Unit.purs line 62, column 1 - line 63, column 1: " + [ reason.constructor.name, _132.constructor.name ]);
    };
};
module.exports = {
    runTest: runTest, 
    test: test, 
    assertFn: assertFn, 
    assertC: assertC, 
    testFn: testFn, 
    testC: testC, 
    assertFalse: assertFalse, 
    assert: assert, 
    timeout: timeout, 
    pickFirst: pickFirst, 
    failure: failure, 
    success: success, 
    setTimeout: $foreign.setTimeout
};
