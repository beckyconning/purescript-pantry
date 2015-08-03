// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var Control_Monad_Aff = require("Control.Monad.Aff");
var Control_Monad_Error_Class = require("Control.Monad.Error.Class");
var Control_Monad_Eff_Exception = require("Control.Monad.Eff.Exception");
var Control_Monad_Eff_Class = require("Control.Monad.Eff.Class");
var Data_Either = require("Data.Either");
var expectError = function (a) {
    return Prelude.bind(Control_Monad_Aff.bindAff)(Control_Monad_Aff.attempt(a))(function (_54) {
        if (_54 instanceof Data_Either.Left) {
            return Prelude["return"](Control_Monad_Aff.applicativeAff)(Prelude.unit);
        };
        if (_54 instanceof Data_Either.Right) {
            return Control_Monad_Error_Class.throwError(Control_Monad_Aff.monadErrorAff)(Control_Monad_Eff_Exception.error("Expected error"));
        };
        throw new Error("Failed pattern match at /Users/beckyconning/Documents/purescript-pantry/bower_components/purescript-spec/src/Test/Spec/Assertions/Aff.purs line 13, column 1 - line 14, column 1: " + [ _54.constructor.name ]);
    });
};
module.exports = {
    expectError: expectError
};
