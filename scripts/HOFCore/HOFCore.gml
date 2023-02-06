/// @description Creates a function that returns the value of `_f(_g(argument0))`.
/// @param {Function} _f - The function to consume the value of `_g(argument0)`.
/// @param {Function} _g - The function to consume the value of `argument0`.
function compose(_f, _g) {
    return method({f: _f, g: _g}, function() { return f(g(argument0)) });
}

/// @description Creates a function that returns the value of `!_f(argument0)`.
/// @param {Function} _f - The function to negate.
function negate(_f) {
    return method({f: _f}, function() { return !f(argument0) });
}

/// @description Calls a function with an array of arguments and returns its result.
/// @param {Function} _func - The function to call.
/// @param {Array} [..._args] - The array of arguments.
function call_with_args(_func, _args) {
    // Feather disable once GM2017 - The type of `script_execute` isn't `Function` but it can still be used as one.
    var f = is_method(_func) ? _func : partial(script_execute, _func);
    switch (argument_count) {
        case  0: return f();
        case  1: return f(_args[0]);
        case  2: return f(_args[0], _args[1]);
        case  3: return f(_args[0], _args[1], _args[2]);
        case  4: return f(_args[0], _args[1], _args[2], _args[3]);
        case  5: return f(_args[0], _args[1], _args[2], _args[3], _args[4]);
        case  6: return f(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5]);
        case  7: return f(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6]);
        case  8: return f(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7]);
        case  9: return f(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8]);
        case 10: return f(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9]);
        case 11: return f(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10]);
        case 12: return f(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11]);
        case 13: return f(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11], _args[12]);
        case 14: return f(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11], _args[12], _args[13]);
        case 15: return f(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11], _args[12], _args[13], _args[14]);
        case 16: return f(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11], _args[12], _args[13], _args[14], _args[15]);
    }
    throw new Exception("argument_count=" + string(argument_count) + " is greater than limit=16");
}

/// @description Calls a constructor with an array of arguments and returns the new instance.
/// @param {Function} _ctor - The constructor to call.
/// @param {Array} [..._args] - The array of arguments.
function construct_with_args(_ctor, _args) {
    switch (argument_count) {
        case  0: return new _ctor();
        case  1: return new _ctor(_args[0]);
        case  2: return new _ctor(_args[0], _args[1]);
        case  3: return new _ctor(_args[0], _args[1], _args[2]);
        case  4: return new _ctor(_args[0], _args[1], _args[2], _args[3]);
        case  5: return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4]);
        case  6: return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5]);
        case  7: return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6]);
        case  8: return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7]);
        case  9: return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8]);
        case 10: return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9]);
        case 11: return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10]);
        case 12: return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11]);
        case 13: return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11], _args[12]);
        case 14: return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11], _args[12], _args[13]);
        case 15: return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11], _args[12], _args[13], _args[14]);
        case 16: return new _ctor(_args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7], _args[8], _args[9], _args[10], _args[11], _args[12], _args[13], _args[14], _args[15]);
    }
    throw new Exception("argument_count=" + string(argument_count) + " is greater than limit=16");
}

/// @description Creates a function that invokes `_f` with `_args` prepended to the arguments it receives.
/// @param {Function} _f - The function to call.
/// @param {Any} [..._args] - The arguments to prepend.
function partial(_f) {
    // Only copy the arguments *after* `_f`.
    var partCount = argument_count - 1;
    var part = array_create(partCount);
    for (var i = 0; i < partCount; ++i) {
        part[i] = argument[i + 1];
    }

    return method({f: _f, part: part, partCount: partCount}, function() {
        var argsCount = partCount + argument_count;
        var args = array_create(argsCount);
        array_copy(args, 0, part, 0, partCount);
        for (var i = 0; i < argument_count; ++i) {
            args[i + partCount] = argument[i];
        }

        return call_with_args(f, args);
    });
}
