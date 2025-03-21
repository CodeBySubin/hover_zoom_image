// ignore: deprecated_member_use
import 'dart:html' as html;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// A web implementation of the HoverZoom plugin.
class HoverZoomPlugin {
  static void registerWith(Registrar registrar) {
    registrar.registerMessageHandler();
  }

  /// Applies hover zoom effect using CSS transformations.
  void applyZoom(html.Element element, double scale) {
    element.style
      ..transition = 'transform 0.3s ease-in-out'
      ..transform = 'scale($scale)';
  }

  /// Resets the hover effect.
  void resetZoom(html.Element element) {
    element.style.transform = 'scale(1)';
  }

  /// Adds hover effect to the specified HTML element.
  void addHoverEffect(html.Element element, {double zoomScale = 1.5}) {
    element.onMouseOver.listen((event) => applyZoom(element, zoomScale));
    element.onMouseOut.listen((event) => resetZoom(element));
  }
}
