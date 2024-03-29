/// @description Base-struct for all assertion exceptions.
/// @param {String} [_message] - The exception message.
/// @param {Array<String>} [_stacktrace] - The exception stacktrace. Creates a new one if not provided.
function AssertionError(_message = "", _stacktrace = undefined) : Exception(_message, _stacktrace) constructor {
    if (is_undefined(_stacktrace)) {
        // Erase "self" from the callstack generated by parent struct.
        array_delete(stacktrace, 0, 1);
    }
}

/// @description Asserts a comparison made between _value and _threshold.
/// @param {Bool} _comparison_result - The result of the comparison.
/// @param {Any} _value - The value to test.
/// @param {Any} _threshold - The threshold of the value.
/// @param {String} _comparison_description - The description of the comparison.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_threshold_name] - The name of the threshold. Defaults to "threshold".
/// @param {Bool} [_nested] - Whether this call is nested in another assertion.
/// @returns {Any} The value that has been tested.
function assert_comparison(_comparison_result, _value, _threshold, _comparison_description, _value_name = "value", _threshold_name = "threshold", _nested = false) {
    if (!_comparison_result) {
        var _error = new AssertionError(string_join_ext("\n", [
            "`" + _value_name + "` " + _comparison_description + " `" + _threshold_name + "`",
            "\t" + _value_name + ": " + string(_value),
            "\t" + _threshold_name + ": " + string(_threshold),
        ]));
        // Erase this call-site from the exception's stacktrace.
        array_delete(_error.stacktrace, 0, _nested ? 2 : 1);
        throw _error;
    } else {
        return _value;
    }
}

/// @description Asserts a condition is true. Throws if not.
/// @param {Bool} _condition - The condition to assert on.
/// @param {String} _message - The exception message thrown if invalid.
/// @param {Bool} [_nested] - Whether this call is nested in another assertion.
function assert_condition(_condition, _message, _nested = false) {
    if (!_condition) {
        var _error = new AssertionError(_message);
        array_delete(_error.stacktrace, 0, _nested ? 2 : 1);
        throw _error;
    }
}
