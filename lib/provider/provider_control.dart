import 'package:flutter/material.dart';

class Provider_control with ChangeNotifier {
  Color Primary = Colors.red;

  setColor(Color color) {
    this.Primary = color;
    notifyListeners();
  }
}
