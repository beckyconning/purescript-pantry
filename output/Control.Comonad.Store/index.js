// Generated by psc version 0.7.1.0
"use strict";
var Data_Tuple = require("Data.Tuple");
var Prelude = require("Prelude");
var Data_Identity = require("Data.Identity");
var Control_Comonad_Store_Trans = require("Control.Comonad.Store.Trans");
var store = function (f) {
    return function (x) {
        return Control_Comonad_Store_Trans.StoreT(new Data_Tuple.Tuple(f, x));
    };
};
var runStore = function (s) {
    return Data_Tuple.swap(Prelude["<$>"](Data_Tuple.functorTuple)(Data_Identity.runIdentity)(Data_Tuple.swap(Control_Comonad_Store_Trans.runStoreT(s))));
};
module.exports = {
    store: store, 
    runStore: runStore
};