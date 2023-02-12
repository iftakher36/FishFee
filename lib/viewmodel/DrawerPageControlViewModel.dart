import 'package:flutter/material.dart';

class DrawerPageControlViewModel with ChangeNotifier {
  double scale = 1.0, offsetX = 0, offsetY = 0;
  bool isDrawerOpen = false;
  late AnimationController animationController;

  getInitAnimationController(AnimationController controller){
    animationController=controller;
    notifyListeners();
  }

  setDrawerOpen() {
    isDrawerOpen = true;
    scale = 0.8;
    offsetX = 180;
    offsetY = 120;
    animationController.forward();
    notifyListeners();
  }

  setDrawerClose() {
    isDrawerOpen = false;
    scale = 1;
    offsetX = 0;
    offsetY = 0;
    animationController.reverse();
    notifyListeners();
  }
}
