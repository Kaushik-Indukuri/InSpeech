import 'package:flutter/rendering.dart';
import 'colors.dart';

/**
 * The BackgroundPainter class is used throughout the application to set the background color of
 * certain pages in the application. This class creates smooth curves for a variety of our applications
 * features, making the overall user experience much more aesthetic. 
 *
 * @author Kaushik Indukuri, Yuvraj Khullar, Akhil Giridhar, Derek Xu
 * @version 1.0
 */

class BackgroundPainter extends CustomPainter{

  BackgroundPainter() :
        bluePaint = Paint()..color = paletteBlue..style = PaintingStyle.fill,
        greyPaint = Paint()..color = lightbackground..style = PaintingStyle.fill,
        greenPaint = Paint()..color = darkBlue..style = PaintingStyle.fill;

  final bluePaint;
  final greyPaint;
  final greenPaint;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    paintBlue(canvas, size);
    paintGrey(canvas, size);
    paintGreen(canvas, size);
  }

  void paintBlue(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, size.height/2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    _addPointsToPath(path, [
      Point(size.width*0, size.height),
      Point(size.width*0, size.height/1),
      Point(size.width*0.4, size.height),
      Point(size.width*0.7, size.height*0.75),
      Point(size.width, size.height*0.75),

    ]);

    canvas.drawPath(path, bluePaint);
  }

  void paintGrey(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, size.height/2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    _addPointsToPath(path, [
      Point(size.width*0, size.height*0.4),
      Point(size.width*0, size.height*0.4),
      Point(size.width*0.25, size.height*0.7),
      Point(size.width*0.55, size.height*0.55),
      Point(size.width*0.9, size.height*0.325),
      Point(size.width, size.height*0.3),

    ]);

    canvas.drawPath(path, greyPaint);
  }

  void paintGreen(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, size.height/2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    _addPointsToPath(path, [
      Point(size.width*0, size.height*0.1),
      Point(size.width*0, size.height*0.1),
      Point(size.width*0.15, size.height*0.175),
      Point(size.width*0.3, size.height*0.1),
      Point(size.width*0.5, size.height*0.125),
      Point(size.width*0.7, size.height*0),
      Point(size.width, size.height*-0.4),

    ]);

    canvas.drawPath(path, greenPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _addPointsToPath(Path path, List<Point> points){
    if (points.length < 3){
      throw UnsupportedError('Need three or more points to create a path');
    }

    for(var i = 0; i < points.length -2; i++){
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    path.quadraticBezierTo(
      points[points.length - 2].x,
      points[points.length - 2].y,
      points[points.length - 1].x,
      points[points.length - 1].y,
    );
  }
}

class BluePainter extends CustomPainter{

  BluePainter() :
        bluePaint = Paint()..color = paletteBlue..style = PaintingStyle.fill,
        greyPaint = Paint()..color = lightbackground..style = PaintingStyle.fill,
        greenPaint = Paint()..color = darkBlue..style = PaintingStyle.fill;

  final bluePaint;
  final greyPaint;
  final greenPaint;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    paintGreen(canvas, size);
  }

  void paintGreen(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, size.height/2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    _addPointsToPath(path, [
      Point(size.width*0, size.height*0.8),
      Point(size.width*0, size.height*0.65),
      Point(size.width*0.3, size.height*0.45),
      Point(size.width*0.7, size.height*0.65),
      Point(size.width*0.93, size.height*0.4),
      Point(size.width*1, size.height*0),
      Point(size.width*1, size.height*0),
    ]);

    canvas.drawPath(path, greenPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _addPointsToPath(Path path, List<Point> points){
    if (points.length < 3){
      throw UnsupportedError('Need three or more points to create a path');
    }

    for(var i = 0; i < points.length -2; i++){
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    path.quadraticBezierTo(
      points[points.length - 2].x,
      points[points.length - 2].y,
      points[points.length - 1].x,
      points[points.length - 1].y,
    );
  }
}

class SpeechPainter extends CustomPainter{

  SpeechPainter() :
        bluePaint = Paint()..color = paletteBlue..style = PaintingStyle.fill,
        greyPaint = Paint()..color = lightbackground..style = PaintingStyle.fill,
        greenPaint = Paint()..color = darkBlue..style = PaintingStyle.fill;

  final bluePaint;
  final greyPaint;
  final greenPaint;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    paintGreen(canvas, size);
  }

  void paintGreen(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, size.height/2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    _addPointsToPath(path, [
      Point(size.width*0, size.height),
      Point(size.width*0, size.height),
      Point(size.width*0.2, size.height),
      Point(size.width*0.2, size.height),
      Point(size.width*0.36, size.height*0.75),
      Point(size.width*0.4, size.height*0.675),
      Point(size.width*0.49, size.height*0.45),
      Point(size.width*0.51, size.height*0.15),
      Point(size.width*0.475, size.height*0),
      Point(size.width*0.475, size.height*0),
      Point(size.width, size.height*0),
    ]);

    canvas.drawPath(path, greenPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _addPointsToPath(Path path, List<Point> points){
    if (points.length < 3){
      throw UnsupportedError('Need three or more points to create a path');
    }

    for(var i = 0; i < points.length -2; i++){
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    path.quadraticBezierTo(
      points[points.length - 2].x,
      points[points.length - 2].y,
      points[points.length - 1].x,
      points[points.length - 1].y,
    );
  }
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}
