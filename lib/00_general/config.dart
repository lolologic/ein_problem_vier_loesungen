/// Identifies the four state-management variants demonstrated in this project.
enum Config {
  /// Manages all counters directly inside the homepage widget.
  local,

  /// Manages state centrally while rendering counters in separate widgets.
  distributed,

  /// Passes counter values and callbacks through passive widgets.
  distributedWithPassiveWidgets,

  /// Manages the shared counter state with Riverpod.
  global,
}
