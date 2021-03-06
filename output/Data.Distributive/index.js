// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var Data_Identity = require("Data.Identity");
var Distributive = function (__superclass_Prelude$dotFunctor_0, collect, distribute) {
    this["__superclass_Prelude.Functor_0"] = __superclass_Prelude$dotFunctor_0;
    this.collect = collect;
    this.distribute = distribute;
};
var distributiveIdentity = new Distributive(function () {
    return Data_Identity.functorIdentity;
}, function (__dict_Functor_1) {
    return function (f) {
        return Prelude["<<<"](Prelude.semigroupoidFn)(Data_Identity.Identity)(Prelude.map(__dict_Functor_1)(Prelude["<<<"](Prelude.semigroupoidFn)(Data_Identity.runIdentity)(f)));
    };
}, function (__dict_Functor_0) {
    return Prelude["<<<"](Prelude.semigroupoidFn)(Data_Identity.Identity)(Prelude.map(__dict_Functor_0)(Data_Identity.runIdentity));
});
var distribute = function (dict) {
    return dict.distribute;
};
var distributiveFunction = new Distributive(function () {
    return Prelude.functorFn;
}, function (__dict_Functor_3) {
    return function (f) {
        return Prelude["<<<"](Prelude.semigroupoidFn)(distribute(distributiveFunction)(__dict_Functor_3))(Prelude.map(__dict_Functor_3)(f));
    };
}, function (__dict_Functor_2) {
    return function (a) {
        return function (e) {
            return Prelude.map(__dict_Functor_2)(function (_6) {
                return _6(e);
            })(a);
        };
    };
});
var cotraverse = function (__dict_Distributive_4) {
    return function (__dict_Functor_5) {
        return function (f) {
            return Prelude["<<<"](Prelude.semigroupoidFn)(Prelude.map(__dict_Distributive_4["__superclass_Prelude.Functor_0"]())(f))(distribute(__dict_Distributive_4)(__dict_Functor_5));
        };
    };
};
var collect = function (dict) {
    return dict.collect;
};
module.exports = {
    Distributive: Distributive, 
    cotraverse: cotraverse, 
    collect: collect, 
    distribute: distribute, 
    distributiveIdentity: distributiveIdentity, 
    distributiveFunction: distributiveFunction
};
