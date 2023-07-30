/// @description Returns a copy of the given array.
/// @param {Array<Any>} _array - The array to copy.
/// @param {Real} [_start] - The position to begin copying from. Defaults to 0.
/// @param {Real} [_sentinal] - The position to stop copying from (exclusive). Defaults to the length of the array.
/// @returns {Array<Any>}
function array_clone(_array, _start = 0, _sentinal = array_length(_array)) {
    var _count = _sentinal - _start;
    var _clone = array_create(_count);
    for (var _i = 0; _i < _count; ++_i) {
        _clone[_i] = _array[_start + _i];
    }
    return _clone;
}

#macro ASSIGN_TO_ARGUMENT_ARRAY                      \
var __argument_array = array_create(argument_count); \
for (var __i = 0; __i < argument_count; ++__i) {     \
    __argument_array[__i] = argument[__i];           \
}
