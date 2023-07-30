/// @description Base-struct for all exceptions.
/// @param {String} [_message] - The exception message.
/// @param {Array<String>} [_stacktrace] - The exception stacktrace. Creates a new one if not provided.
function Exception(_message = "", _stacktrace = undefined) constructor {
    message = _message;
    // Erase "self" from the callstack by starting the clone from index 1 rather than index 0.
    stacktrace = is_undefined(_stacktrace) ? array_clone(debug_get_callstack(), 1) : _stacktrace;
}
