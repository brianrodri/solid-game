/// @description Encapsulates an instance of a GML array.
/// @param {Real} [_length] - The length of the array. Defaults to 0.
/// @param {Any} [_fill_value] - The default value of each array item. Defaults to 0.
function Array(_length = 0) constructor {
    length = _length;
    array = argument_count > 1 ? array_create(length, argument[1]) : array_create(length);

    #region Core API

    /// @func copy(_other, _other_start, _other_sentinal, _self_start).
    /// @description Copies elements from another array.
    /// @param {Struct.Array} _other - The array to copy elements from.
    /// @param {Real} [_other_start] - The position to start copying elements from. Defaults to 0.
    /// @param {Real} [_other_sentinal] - The number of items to copy. Defaults to the minimum array length.
    /// @param {Real} [_self_start] - The position to begin copying items into. Defaults to 0.
    static copy = function(_other, _other_start = 0, _other_sentinal = undefined, _self_start = 0) {
        var otherSentinal = is_undefined(_other_sentinal) ? _other.length : _other_sentinal;
        var copyCount = min(otherSentinal - _other_start, length - _self_start);
        array_copy(array, _self_start, _other.array, _other_start, copyCount);
    }

    /// @func equals(_other).
    /// @description Returns whether self has the same ordered elements as `_other`.
    /// @param {Struct.Array} _other - The array to compare against.
    /// @returns {Bool} The comparison result.
    static equals = function(_other) {
        return array_equals(array, _other.array);
    }

    /// @func get(_index).
    /// @description Returns the value held at `_index`.
    /// @param {Real} _index - The index of the item.
    /// @returns {Any} The value held at `_index`.
    static get = function(_index) {
        return array[_index];
    }

    /// @func set(_index, _value).
    /// @description Sets the value held at `_index`.
    /// @param {Real} _index - The index of the item.
    /// @param {Any} _value - The value to set at `_index`.
    static set = function(_index, _value) {
        array[_index] = _value;
    }

    /// @func push(_value).
    /// @description Pushes a value to the end of the array.
    /// @param {Any} _value - The value to append.
    static push = function(_value) {
        array_push(array, _value);
        length += 1;
    }

    /// @func pop().
    /// @description Pops a value off of the end of the array and returns it.
    /// @returns {Any} The value popped from the array.
    static pop = function() {
        var popped = array_pop(array);
        length -= 1;
        return popped;
    }

    /// @func insert(_index, _value).
    /// @description Sets the value held at `_index`.
    /// @param {Real} _index - The index of the item.
    /// @param {Any} _value - The value to set at `_index`.
    static insert = function(_index, _value) {
        array_insert(array, _index, _value);
        length += 1;
    }

    /// @func remove(_start, _sentinal).
    /// @description Deletes the range `[_start, _sentinal)` from the array.
    /// @param {Real} _start - The position to start deleting values.
    /// @param {Real} _sentinal - The position to stop deleting values (exclusive). Defaults to `_start + 1`.
    static remove = function(_start, _sentinal = _start + 1) {
        var count = _sentinal - _start;
        array_delete(array, _start, count);
        length -= count;
    }

    /// @func sort(_ascending).
    /// @description Sorts the array.
    /// @param {Bool} _ascending - Whether the items should be in ascending order. Defaults to true.
    static sort = function(_ascending = true) {
        array_sort(array, _ascending);
    }

    /// @func sortBy(_binary_function).
    /// @description Sorts the array according to the relation defined by `_binary_function`.
    /// @param {Function} _binary_function - Must return an *integer* satisfying a weak-ordering between its arguments.
    ///     If `_binary_function(a, b) <= -1`, then `a` will be positioned before `b`.
    ///     If `_binary_function(a, b) ==  0`, then `a` and `b` are equal.
    ///     If `_binary_function(a, b) >=  1`, then `a` will be positioned after `b`.
    static sortBy = function(_binary_function) {
        array_sort(array, _binary_function);
    }

    /// @func shuffle(_start, _sentinal).
    /// @description Shuffles the array in-place.
    static shuffle = function(_start = 0, _sentinal = undefined) {
        var sentinal = is_undefined(_sentinal) ? length : _sentinal;
        array_shuffle_ext(array, _start, sentinal - _start);
    }

    #endregion

    #region Nice-to-haves

    /// @func clone(_start, _sentinal).
    /// @description Returns a copy of the array.
    /// @param {Real} [_start] - The first position to copy from. Defaults to 0.
    /// @param {Real} [_sentinal] - The last position to copy from (exclusive). Defaults to the length of the array.
    static clone = function(_start = 0, _sentinal = undefined) {
        var sentinal = is_undefined(_sentinal) ? length : _sentinal;
        var newArray = new Array(sentinal - _start);
        newArray.copy(self, _start, sentinal);
        return newArray;
    }

    #endregion
}

// function array_of = partial(Array.new);
