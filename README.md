# hover_zoom_image

[![pub package](https://img.shields.io/pub/v/animated_mouse_cursor.svg)](https://pub.dartlang.org/packages/animated_mouse_cursor)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A Flutter package that enables smooth image zoom effects on hover. Ideal for showcasing high-resolution images with an interactive zoom feature, perfect for web applications and galleries.

### Demo

<video controls autoplay height="400px" 
       src="https://raw.githubusercontent.com/CodeBySubin/hover_zoom_image/master/example/demo%20video/demo.mp4"
       type="video/mp4">
</video>

## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  hover_zoom_image: <latest-version>
```

or

```shell
flutter pub add hover_zoom_image
```

## Implementation

Import the package in your Dart file:

```yaml
import 'package:hover_zoom_image/hover_zoom_image.dart';
```

## Usage

The HoverZoomImage widget allows you to add a smooth zoom effect on images when hovering. You can wrap this widget in MaterialApp or use it within a single Widget.

```dart
MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hover Zoom Image',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Center(
        child: HoverZoomImage(
          imageProvider: const AssetImage('assets/images/sample.jpg'),
          width: 550,
          height: 700,
          zoomScale: 2.5,
          animationDuration: Duration(milliseconds: 150),
        ),
      ),
    );

```
