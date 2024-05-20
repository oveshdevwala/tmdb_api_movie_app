import 'package:flutter/material.dart';

class SliderIndexProvider extends ChangeNotifier {
  int _index = 0;
  set index(value) {
    _index = value;
    notifyListeners();
  }
  int get index => _index;
}
