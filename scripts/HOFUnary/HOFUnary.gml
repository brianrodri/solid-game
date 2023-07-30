/// @description The no-op function. Takes nothing and returns nothing.
function noop() {
}

/// @description The identity function. Returns its first argument.
/// @param {Any} _value - The value to return.
/// @returns {Any}
function identity(_value) {
    return _value;
}

/// @description Creates a function that always returns the given value.
/// @param {Any} _value - The value to return.
/// @returns {Function}
function returns(_value) {
    return method({ value: _value }, function() { return value });
}

/// @description Creates a function that always throws the given error.
/// @param {Any} _error - The error to throw.
/// @returns {Function}
function throws(_error) {
    return method({ error: _error }, function() { throw error });
}

/// @description Transforms a built-in function into a function pointer.
/// @param {Function} _built_in_function - The built-in function.
/// @returns {Function}
function func_ptr(_built_in_function) {
    return method(undefined, _built_in_function);
}
