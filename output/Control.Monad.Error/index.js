// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var $$Error = function (noMsg, strMsg) {
    this.noMsg = noMsg;
    this.strMsg = strMsg;
};
var strMsg = function (dict) {
    return dict.strMsg;
};
var noMsg = function (dict) {
    return dict.noMsg;
};
var errorString = new $$Error("", Prelude.id(Prelude.categoryFn));
module.exports = {
    "Error": $$Error, 
    strMsg: strMsg, 
    noMsg: noMsg, 
    errorString: errorString
};
