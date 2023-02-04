/// @description Asserts a comparison made between _value and _threshold.
/// @param {Bool} _comparison_result - The result of the comparison.
/// @param {Any} _value - The value to test.
/// @param {Any} _threshold - The threshold of the value.
/// @param {String} _comparison_description - The description of the comparison.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_threshold_name] - The name of the threshold. Defaults to "threshold".
/// @returns {Any} The value that has been tested.
function assert_comparison(_comparison_result, _value, _threshold, _comparison_description, _value_name = "value", _threshold_name = "threshold") {
    if (!_comparison_result) {
        var error = new AssertionError(string_join_ext("\n", [
            "`" + _value_name + "` " + _comparison_description + " `" + _threshold_name + "`",
            "\t" + _value_name + ": " + string(_value),
            "\t" + _threshold_name + ": " + string(_threshold),
        ]));
        // Erase this call-site from the exception's stacktrace.
        array_delete(error.stacktrace, 0, 1);
        throw error;
    } else {
        return _value;
    }
}

/// @description Asserts that `_value == _wanted`.
/// @param {Real} _value - The value to test.
/// @param {Real} _wanted - The expected value.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_wanted_name] - The name of the expected value. Defaults to "wanted".
/// @returns {Real} The value that has been tested.
function assert_eq(_value, _wanted, _value_name = "value", _wanted_name = "wanted") {
    return assert_comparison(_value == _wanted, _value, _wanted, "must be equal to", _value_name, _wanted_name);
}

/// @description Asserts that `_value != _wanted`.
/// @param {Real} _value - The value to test.
/// @param {Real} _unwanted - The unexpected value.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_unwanted_name] - The name of the unexpected value. Defaults to "unwanted".
/// @returns {Real} The value that has been tested.
function assert_ne(_value, _unwanted, _value_name = "value", _unwanted_name = "unwanted") {
    return assert_comparison(_value != _unwanted, _value, _unwanted, "must not be equal to", _value_name, _unwanted_name);
}

/// @description Asserts that `_value < _threshold`.
/// @param {Real} _value - The value to test.
/// @param {Real} _threshold - The threshold of the value.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_threshold_name] - The name of the threshold. Defaults to "threshold".
/// @returns {Real} The value that has been tested.
function assert_lt(_value, _threshold, _value_name = "value", _threshold_name = "threshold") {
    return assert_comparison(_value < _threshold, _value, _threshold, "must be less than", _value_name, _threshold_name);
}

/// @description Asserts that `_value <= _threshold`.
/// @param {Real} _value - The value to test.
/// @param {Real} _threshold - The threshold of the value.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_threshold_name] - The name of the threshold. Defaults to "threshold".
/// @returns {Real} The value that has been tested.
function assert_le(_value, _threshold, _value_name = "value", _threshold_name = "threshold") {
    return assert_comparison(_value <= _threshold, _value, _threshold, "must be less than or equal to", _value_name, _threshold_name);
}

/// @description Asserts that `_value > _threshold`.
/// @param {Real} _value - The value to test.
/// @param {Real} _threshold - The threshold of the value.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_threshold_name] - The name of the threshold. Defaults to "threshold".
/// @returns {Real} The value that has been tested.
function assert_gt(_value, _threshold, _value_name = "value", _threshold_name = "threshold") {
    return assert_comparison(_value > _threshold, _value, _threshold, "must be greater than", _value_name, _threshold_name);
}

/// @description Asserts that `_value >= _threshold`.
/// @param {Real} _value - The value to test.
/// @param {Real} _threshold - The threshold of the value.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_threshold_name] - The name of the threshold. Defaults to "threshold".
/// @returns {Real} The value that has been tested.
function assert_ge(_value, _threshold, _value_name = "value", _threshold_name = "threshold") {
    return assert_comparison(_value >= _threshold, _value, _threshold, "must be greater than or equal to", _value_name, _threshold_name);
}

/// @description Asserts that `is_instanceof(_struct, _constructor)`.
/// @param {Struct} _struct - The struct to test.
/// @param {Function} _constructor - The constructor expected to have built the struct.
/// @param {String} [_struct_name] - The name of the value. Defaults to "value".
/// @param {String} [_constructor_name] - The name of the threshold. Defaults to "threshold".
/// @returns {Real} The value that has been tested.
function assert_instanceof(_struct, _constructor, _struct_name = "struct", _constructor_name = "constructor") {
    return assert_comparison(is_instanceof(_struct, _constructor), _struct, _constructor, "must be an instance of", _struct_name, _constructor_name);
}
