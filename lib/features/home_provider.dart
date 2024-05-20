import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  late int _currentIndex=0;
  get currentIndex => _currentIndex;
  set currentIndex(value) {
    _currentIndex = value;
    notifyListeners();
  }
}
