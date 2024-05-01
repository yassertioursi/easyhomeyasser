import 'package:flutter/material.dart';

class bloc_fav with ChangeNotifier {
  bool isFav = false;
  void setFav(bool value) {
    isFav = value;
    notifyListeners();
  }

  void setVisible(bool bool) {}
}

class bloc_six with ChangeNotifier {
  bool isVisible = false;
  void setVisible(bool value) {
    isVisible = value;
    notifyListeners();
  }
}
