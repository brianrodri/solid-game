/// @description Returns a copy of the given array.
/// @param {Array<Any>} _array - The array to copy.
/// @param {Real} [_start] - The position to begin copying from. Defaults to 0.
/// @param {Real} [_sentinal] - The position to stop copying from (exclusive). Defaults to the length of the array.
/// @returns {Array<Any>}
function array_clone(_array, _start = 0, _sentinal = array_length(_array)) {
    var count = _sentinal - _start;
    var array = array_create(count);
    for (var i = 0; i < count; ++i) {
        array[i] = _array[i + _start];
    }
    return array;
}
