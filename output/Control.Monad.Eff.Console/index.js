// Generated by psc version 0.7.1.0
"use strict";
var $foreign = require("./foreign");
var Prelude = require("Prelude");
var Control_Monad_Eff = require("Control.Monad.Eff");
var print = function (__dict_Show_0) {
    return Prelude["<<<"](Prelude.semigroupoidFn)($foreign.log)(Prelude.show(__dict_Show_0));
};
module.exports = {
    print: print, 
    error: $foreign.error, 
    log: $foreign.log
};
