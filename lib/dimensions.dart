import 'package:flutter/cupertino.dart';

class Dimensions {
  static double boxHeight;
  static double boxWidth;
  Dimensions(BuildContext context) {
    boxHeight = MediaQuery.of(context).size.height / 100;
    boxWidth = MediaQuery.of(context).size.width / 100;
  }
}
