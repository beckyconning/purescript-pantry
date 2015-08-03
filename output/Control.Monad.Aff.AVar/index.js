// Generated by psc version 0.7.1.0
"use strict";
var $foreign = require("./foreign");
var Control_Monad_Aff = require("Control.Monad.Aff");
var Prelude = require("Prelude");
var Data_Function = require("Data.Function");
var Control_Monad_Eff_Exception = require("Control.Monad.Eff.Exception");
var takeVar = function (q) {
    return $foreign._takeVar(Control_Monad_Aff.nonCanceler, q);
};
var putVar = function (q) {
    return function (a) {
        return $foreign._putVar(Control_Monad_Aff.nonCanceler, q, a);
    };
};
var modifyVar = function (f) {
    return function (v) {
        return Prelude[">>="](Control_Monad_Aff.bindAff)(takeVar(v))(Prelude[">>>"](Prelude.semigroupoidFn)(f)(putVar(v)));
    };
};
var makeVar = $foreign._makeVar(Control_Monad_Aff.nonCanceler);
var makeVar$prime = function (a) {
    return Prelude.bind(Control_Monad_Aff.bindAff)(makeVar)(function (_44) {
        return Prelude.bind(Control_Monad_Aff.bindAff)(putVar(_44)(a))(function () {
            return Prelude["return"](Control_Monad_Aff.applicativeAff)(_44);
        });
    });
};
var killVar = function (q) {
    return function (e) {
        return $foreign._killVar(Control_Monad_Aff.nonCanceler, q, e);
    };
};
module.exports = {
    takeVar: takeVar, 
    putVar: putVar, 
    modifyVar: modifyVar, 
    "makeVar'": makeVar$prime, 
    makeVar: makeVar, 
    killVar: killVar
};
