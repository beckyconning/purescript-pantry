// Generated by psc version 0.7.1.0
"use strict";
var Prelude = require("Prelude");
var Control_Monad_Reader_Trans = require("Control.Monad.Reader.Trans");
var Control_Monad_Trans = require("Control.Monad.Trans");
var Control_Monad_Error_Trans = require("Control.Monad.Error.Trans");
var Control_Monad_Maybe_Trans = require("Control.Monad.Maybe.Trans");
var Control_Monad_Writer_Trans = require("Control.Monad.Writer.Trans");
var Control_Monad_State_Trans = require("Control.Monad.State.Trans");
var Control_Monad_RWS = require("Control.Monad.RWS");
var Control_Monad_Error = require("Control.Monad.Error");
var Control_Monad_RWS_Trans = require("Control.Monad.RWS.Trans");
var Data_Monoid = require("Data.Monoid");
var MonadReader = function (ask, local) {
    this.ask = ask;
    this.local = local;
};
var monadReaderReaderT = function (__dict_Monad_0) {
    return new MonadReader(Prelude["return"](__dict_Monad_0["__superclass_Prelude.Applicative_0"]()), Control_Monad_Reader_Trans.withReaderT);
};
var monadReaderRWST = function (__dict_Monad_1) {
    return function (__dict_Monoid_2) {
        return new MonadReader(Control_Monad_RWS.ask(__dict_Monad_1["__superclass_Prelude.Applicative_0"]())(__dict_Monoid_2), Control_Monad_RWS.local);
    };
};
var monadReaderFun = new MonadReader(Prelude.id(Prelude.categoryFn), Prelude[">>>"](Prelude.semigroupoidFn));
var local = function (dict) {
    return dict.local;
};
var ask = function (dict) {
    return dict.ask;
};
var monadReaderErrorT = function (__dict_Monad_3) {
    return function (__dict_MonadReader_4) {
        return new MonadReader(Control_Monad_Trans.lift(Control_Monad_Error_Trans.monadTransErrorT)(__dict_Monad_3)(ask(__dict_MonadReader_4)), function (f) {
            return Control_Monad_Error_Trans.mapErrorT(local(__dict_MonadReader_4)(f));
        });
    };
};
var monadReaderMaybeT = function (__dict_Monad_5) {
    return function (__dict_MonadReader_6) {
        return new MonadReader(Control_Monad_Trans.lift(Control_Monad_Maybe_Trans.monadTransMaybeT)(__dict_Monad_5)(ask(__dict_MonadReader_6)), function (f) {
            return Control_Monad_Maybe_Trans.mapMaybeT(local(__dict_MonadReader_6)(f));
        });
    };
};
var monadReaderStateT = function (__dict_Monad_7) {
    return function (__dict_MonadReader_8) {
        return new MonadReader(Control_Monad_Trans.lift(Control_Monad_State_Trans.monadTransStateT)(__dict_Monad_7)(ask(__dict_MonadReader_8)), function (f) {
            return Control_Monad_State_Trans.mapStateT(local(__dict_MonadReader_8)(f));
        });
    };
};
var monadReaderWriterT = function (__dict_Monad_9) {
    return function (__dict_Monoid_10) {
        return function (__dict_MonadReader_11) {
            return new MonadReader(Control_Monad_Trans.lift(Control_Monad_Writer_Trans.monadTransWriterT(__dict_Monoid_10))(__dict_Monad_9)(ask(__dict_MonadReader_11)), function (f) {
                return Control_Monad_Writer_Trans.mapWriterT(local(__dict_MonadReader_11)(f));
            });
        };
    };
};
var reader = function (__dict_Monad_12) {
    return function (__dict_MonadReader_13) {
        return function (f) {
            return Prelude[">>="](__dict_Monad_12["__superclass_Prelude.Bind_1"]())(ask(__dict_MonadReader_13))(Prelude["<<<"](Prelude.semigroupoidFn)(Prelude["return"](__dict_Monad_12["__superclass_Prelude.Applicative_0"]()))(f));
        };
    };
};
module.exports = {
    MonadReader: MonadReader, 
    reader: reader, 
    local: local, 
    ask: ask, 
    monadReaderFun: monadReaderFun, 
    monadReaderReaderT: monadReaderReaderT, 
    monadReaderErrorT: monadReaderErrorT, 
    monadReaderMaybeT: monadReaderMaybeT, 
    monadReaderWriterT: monadReaderWriterT, 
    monadReaderStateT: monadReaderStateT, 
    monadReaderRWST: monadReaderRWST
};
