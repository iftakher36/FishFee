import 'package:fishfee/utils/constant.dart';
import 'package:flutter/cupertino.dart';

class WelcomePageViewModel with ChangeNotifier {
  int onBoardingCurrentIndex = 0;
  List<String> svgAssetPath = [
    'assets/first_onboard.svg',
    'assets/second_onboard.svg',
    'assets/third_onboard.svg'
  ];
  List<String> stepStringTop = ['Welcome to', 'Get', 'Best Quality'];
  List<String> stepStringStart = ['FishFee', 'Fast', 'Products'];
  List<String> stepStringEnd = [
    'Application',
    'Delivery Service',
    'Door To Door'
  ];

// for splash screen
  waitSplashScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 8)).then((value) =>
        Navigator.of(context).pushReplacementNamed(Constant.welcomeRoute));
  }

  changeOnBoardScreen(int pageIndex, BuildContext context) {
    onBoardingCurrentIndex = pageIndex;
    notifyListeners();
  }
}
