import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CubicBezierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Bezier(Colors.amber, 1.0)],
      ),
    );
  }
}

class Bezier extends StatelessWidget {
  const Bezier(this.color, this.scale, {this.blur = 0.0, this.delay = 0.0});

  final Color color;
  final double scale;
  final double blur;
  final double delay;

  List<PathDetail> _getLogoPath() {
    final List<PathDetail> paths = <PathDetail>[];

    final Path path = Path();
    path.moveTo(100.0, 97.0);
    path.cubicTo(100.0, 97.0, 142.0, 59.0, 169.91, 41.22);
    path.cubicTo(197.82, 23.44, 249.24, 5.52, 204.67, 85.84);

    paths.add(PathDetail(path));

    // Path 2
    final Path bezier2Path = Path();
    bezier2Path.moveTo(0.0, 70.55);
    bezier2Path.cubicTo(0.0, 70.55, 42.0, 31.55, 69.91, 14.77);
    bezier2Path.cubicTo(97.82, -2.01, 149.24, -20.93, 104.37, 59.39);

    paths.add(PathDetail(bezier2Path, translate: <double>[29.45, 151.0], rotation: -1.5708));

    // Path 3
    final Path bezier3Path = Path();
    bezier3Path.moveTo(0.0, 69.48);
    bezier3Path.cubicTo(0.0, 69.48, 44.82, 27.92, 69.91, 13.7);
    bezier3Path.cubicTo(95.0, -0.52, 149.24, -22.0, 104.37, 58.32);

    paths.add(PathDetail(bezier3Path, translate: <double>[53.0, 200.48], rotation: -3.14159));

    // Path 4
    final Path bezier4Path = Path();
    bezier4Path.moveTo(0.0, 69.48);
    bezier4Path.cubicTo(0.0, 69.48, 43.82, 27.92, 69.91, 13.7);
    bezier4Path.cubicTo(96.0, -0.52, 149.24, -22.0, 104.37, 58.32);

    paths.add(PathDetail(bezier4Path, translate: <double>[122.48, 77.0], rotation: -4.71239));

    return paths;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      CustomPaint(
        foregroundPainter: BezierPainter(Colors.grey, 0.0, _getLogoPath(), false),
        size: const Size(100.0, 100.0),
      ),
      AnimatedBezier(color, scale, blur: blur, delay: delay),
    ]);
  }
}

class PathDetail {
  PathDetail(this.path, {this.translate, this.rotation});

  Path path;
  List<double> translate = <double>[];
  double rotation;
}

class AnimatedBezier extends StatefulWidget {
  const AnimatedBezier(this.color, this.scale, {this.blur = 0.0, this.delay});

  final Color color;
  final double scale;
  final double blur;
  final double delay;

  @override
  State createState() => AnimatedBezierState();
}

class Point {
  Point(this.x, this.y);

  double x;
  double y;
}

class AnimatedBezierState extends State<AnimatedBezier> with SingleTickerProviderStateMixin {}

class BezierPainter extends CustomPainter {
  BezierPainter(this.color, this.blur, this.path, this.isPlaying);

  Color color;
  final double blur;
  List<PathDetail> path;
  bool isPlaying;
}
