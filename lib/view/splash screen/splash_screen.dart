import 'package:fishfee/utils/apptheme.dart';
import 'package:fishfee/utils/constant.dart';
import 'package:fishfee/viewmodel/welcome_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<WelcomePageViewModel>(context, listen: false)
        .waitSplashScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.lightSecondaryColor,
        body: Center(
          child: TextLiquidFill(
            text: 'FISHFEE',
            waveColor: Colors.white,
            boxBackgroundColor: AppTheme.lightSecondaryColor,
            waveDuration: const Duration(seconds: 2),
            loadDuration: Constant.splashDuration,
            textStyle: const TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
                color: Colors.green),
            boxHeight: 300.0,
          ),
        ));
  }
}
