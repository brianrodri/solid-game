/// @description Asserts that `_value == _wanted`.
/// @param {Real} _value - The value to test.
/// @param {Real} _wanted - The expected value.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_wanted_name] - The name of the expected value. Defaults to "wanted".
/// @returns {Real} The value that has been tested.
function assert_eq(_value, _wanted, _value_name = "value", _wanted_name = "wanted") {
    return assert_comparison(_value == _wanted, _value, _wanted, "must be equal to", _value_name, _wanted_name, true);
}

/// @description Asserts that `_index` is valid for an array `_length`.
/// @param {Real} _index - The index to test.
/// @param {Real} _length - The length being indexed into.
/// @param {String} [_index_name] - The name of the index. Defaults to "index".
/// @param {String} [_length_name] - The name of the expected value. Defaults to "length".
/// @returns {Real} The value that has been tested.
function assert_index(_index, _length, _index_name = "index", _length_name = "length") {
    return assert_comparison(_index >= 0 && _index < _length, _index, _length, "must be valid for an array with length", _index_name, _length_name, true);
}

/// @description Asserts that `_value != _unwanted`.
/// @param {Real} _value - The value to test.
/// @param {Real} _unwanted - The unwanted value.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_unwanted_name] - The name of the unwanted value. Defaults to "unwanted".
/// @returns {Real} The value that has been tested.
function assert_ne(_value, _unwanted, _value_name = "value", _unwanted_name = "unwanted") {
    return assert_comparison(_value != _unwanted, _value, _unwanted, "must not be equal to", _value_name, _unwanted_name, true);
}

/// @description Asserts that `_value < _threshold`.
/// @param {Real} _value - The value to test.
/// @param {Real} _threshold - The threshold of the value.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_threshold_name] - The name of the threshold. Defaults to "threshold".
/// @returns {Real} The value that has been tested.
function assert_lt(_value, _threshold, _value_name = "value", _threshold_name = "threshold") {
    return assert_comparison(_value < _threshold, _value, _threshold, "must be less than", _value_name, _threshold_name, true);
}

/// @description Asserts that `_value <= _threshold`.
/// @param {Real} _value - The value to test.
/// @param {Real} _threshold - The threshold of the value.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_threshold_name] - The name of the threshold. Defaults to "threshold".
/// @returns {Real} The value that has been tested.
function assert_le(_value, _threshold, _value_name = "value", _threshold_name = "threshold") {
    return assert_comparison(_value <= _threshold, _value, _threshold, "must be less than or equal to", _value_name, _threshold_name, true);
}

/// @description Asserts that `_value > _threshold`.
/// @param {Real} _value - The value to test.
/// @param {Real} _threshold - The threshold of the value.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_threshold_name] - The name of the threshold. Defaults to "threshold".
/// @returns {Real} The value that has been tested.
function assert_gt(_value, _threshold, _value_name = "value", _threshold_name = "threshold") {
    return assert_comparison(_value > _threshold, _value, _threshold, "must be greater than", _value_name, _threshold_name, true);
}

/// @description Asserts that `_value >= _threshold`.
/// @param {Real} _value - The value to test.
/// @param {Real} _threshold - The threshold of the value.
/// @param {String} [_value_name] - The name of the value. Defaults to "value".
/// @param {String} [_threshold_name] - The name of the threshold. Defaults to "threshold".
/// @returns {Real} The value that has been tested.
function assert_ge(_value, _threshold, _value_name = "value", _threshold_name = "threshold") {
    return assert_comparison(_value >= _threshold, _value, _threshold, "must be greater than or equal to", _value_name, _threshold_name, true);
}

/// @description Asserts that `is_instanceof(_struct, _constructor)`.
/// @param {Struct} _struct - The struct to test.
/// @param {Function} _constructor - The constructor expected to have built the struct.
/// @param {String} [_struct_name] - The name of the value. Defaults to "value".
/// @param {String} [_constructor_name] - The name of the threshold. Defaults to "threshold".
/// @returns {Real} The value that has been tested.
function assert_instanceof(_struct, _constructor, _struct_name = "struct", _constructor_name = "constructor") {
    return assert_comparison(is_instanceof(_struct, _constructor), _struct, _constructor, "must be an instance of", _struct_name, _constructor_name, true);
}
