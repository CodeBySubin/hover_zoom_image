import 'package:flutter/material.dart';
import 'hover_zoom_state.dart';

/// Controller class for managing hover and mouse events.
class HoverZoomController with ChangeNotifier {
  final HoverZoomState _state = HoverZoomState();

  bool get isHovering => _state.isHovering;
  Offset get mousePosition => _state.mousePosition;

  /// Handles mouse enter event.
  void onEnter() {
    _state.isHovering = true;
    notifyListeners();
  }

  /// Handles mouse exit event.
  void onExit() {
    _state.isHovering = false;
    _state.mousePosition = Offset.zero;
    notifyListeners();
  }

  /// Handles mouse hover event.
  void onHover(Offset position) {
    _state.mousePosition = position;
    notifyListeners();
  }
}
