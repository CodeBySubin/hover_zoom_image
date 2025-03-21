import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'hover_zoom_controller.dart';

/// A widget that displays an image with a hover zoom effect.
/// Uses Provider for state management.
class HoverZoomImage extends StatelessWidget {
  /// The image provider for the image (network, asset, or file).
  final ImageProvider imageProvider;

  /// The width of the image container.
  final double width;

  /// The height of the image container.
  final double height;

  /// The zoom scale factor when hovering.
  final double zoomScale;

  /// The duration of the zoom animation.
  final Duration animationDuration;

  /// Optional decoration for the image container.
  final Decoration? decoration;

  /// Creates a [HoverZoomImage] widget.
  const HoverZoomImage({
    super.key,
    required this.imageProvider,
    this.width = 550,
    this.height = 700,
    this.zoomScale = 2.0,
    this.animationDuration = const Duration(milliseconds: 150),
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HoverZoomController(),
      child: Consumer<HoverZoomController>(
        builder: (context, controller, child) {
          final double zoomedWidth = width * zoomScale;
          final double zoomedHeight = height * zoomScale;

          final double translateX = (controller.mousePosition.dx / width) * (width - zoomedWidth);
          final double translateY = (controller.mousePosition.dy / height) * (height - zoomedHeight);

          return MouseRegion(
            onEnter: (event) => controller.onEnter(),
            onExit: (event) => controller.onExit(),
            onHover: (event) => controller.onHover(event.localPosition),
            child: AnimatedContainer(
              duration: animationDuration,
              width: width,
              height: height,
              decoration: decoration ??
                  BoxDecoration(),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: animationDuration,
                    transform: Matrix4.identity()
                      ..translate(
                        controller.isHovering ? translateX : 0,
                        controller.isHovering ? translateY : 0,
                      )
                      ..scale(controller.isHovering ? zoomScale : 1.0),
                    child: Image(
                      image: imageProvider,
                      width: zoomedWidth,
                      height: zoomedHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

