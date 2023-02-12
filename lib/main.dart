import 'package:fishfee/utils/apptheme.dart';
import 'package:fishfee/utils/constant.dart';
import 'package:fishfee/view/Drawer%20and%20other%20screen%20host/drawer_host.dart';
import 'package:fishfee/view/main screen/finder_page.dart';
import 'package:fishfee/view/onboard%20screen/welcome_page.dart';
import 'package:fishfee/view/splash%20screen/splash_screen.dart';
import 'package:fishfee/viewmodel/DrawerPageControlViewModel.dart';
import 'package:fishfee/viewmodel/welcome_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => WelcomePageViewModel()),
        ChangeNotifierProvider(create: (ctx)=> DrawerPageControlViewModel())
      ],
      child: MaterialApp(
        title: 'FishFee',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routes: {
          Constant.welcomeRoute: (ctx) => const WelComePage(),
          Constant.splashRoute: (ctx) => const SplashScreen(),
          Constant.hostRoute: (ctx) => const DrawerHost(),
        },
      ),
    );
  }
}
