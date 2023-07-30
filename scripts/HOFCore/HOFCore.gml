/// @description Returns the composition of all input functions.
/// @param {Function} [..._funcs] - The functions to compose. Requires at least one.
/// @returns {Function}
function compose() {
    assert_gt(argument_count, 0);
    var _composition = argument[0];
    for (var _i = 1; _i < argument_count; ++_i) {
        _composition = new Compose2(_composition, argument[_i]).invoke;
    }
    return _composition;
}

/// @description Calls a constructor with an array of arguments and returns the new instance.
/// @param {Function} _ctor - The constructor to call.
/// @param {Array} _args - The array of arguments.
/// @returns {Struct}
function construct_with_args(_ctor, _args) {
    var _array_length = array_length(_args);
    assert_le(_array_length, 16);
    switch (_array_length) {
        case 0:
            return new _ctor();
        case 1:
            return new _ctor(_args[0]);
        case 2:
            return new _ctor(_args[0], _args[1]);
        case 3:
            return new _ctor(_args[0], _args[1], _args[2]);
        case 4:
            return new _ctor(_args[0], _args[1], _args[2], _args[3]);
        case 5:
            return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4]);
        case 6:
            return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5]);
        case 7:
            return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6]);
        case 8:
            return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7]);
        case 9:
            return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8]);
        case 10:
            return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9]);
        case 11:
            return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10]);
        case 12:
            return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11]);
        case 13:
            return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11], _args[12]);
        case 14:
            return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11], _args[12], _args[13]);
        case 15:
            return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11], _args[12], _args[13], _args[14]);
        case 16:
            return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11], _args[12], _args[13], _args[14], _args[15]);
    }
}

/// @description Creates a function that invokes `_f` with `_args` prepended to the arguments it receives.
/// @param {Function} _func - The function to call.
/// @param {Any} [..._args] - The arguments to prepend.
/// @returns {Function}
function partial(_func) {
    var _args = array_create(argument_count - 1);
    for (var _i = 1; _i < argument_count; ++_i) {
        _args[_i - 1] = argument[_i];
    }
    return new Partial(_func, _args).invoke;
}

#region Helper structs

/// @description Helper struct for composing two functions.
/// @param {Function} _f - The function to consume the value of `_g(...args)`.
/// @param {Function} _g - The function to consume the value of `...args`.
function Compose2(_f, _g) constructor {
    f = _f;
    g = _g;
    invoke = function() {
        switch (argument_count) {
            case 0:
                return f(g());
            case 1:
                return f(g(argument[0]));
            default:
                NEW_ARGUMENT_ARRAY;
                return f(script_execute_ext(g, __argument_array));
        }
    };
}

/// @description Helper struct for invoking a function with pre-defined arguments.
/// @param {Function} _func - The function to call.
/// @param {Array} _part - The arguments to prepend.
function Partial(_func, _part) constructor {
    func = _func;
    part = _part;
    invoke = array_length(_part) == 0 ? _func : function() {
        NEW_ARGUMENT_ARRAY;
        return script_execute_ext(func, array_concat(part, __argument_array));
    };
}

#endregion
