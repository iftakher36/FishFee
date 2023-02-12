
import 'package:flutter/cupertino.dart';

class PolygonRightClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //first control
    Path path=Path();
    path.moveTo(size.width*0.07 ,0);
    path.quadraticBezierTo(0,0,0,size.height*0.5);
    path.quadraticBezierTo(0,size.height,size.width*0.1,size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width*0.94, size.height/2);
    path.lineTo(size.width*0.94, size.height/2);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}