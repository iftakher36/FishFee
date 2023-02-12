import 'package:fishfee/utils/apptheme.dart';
import 'package:fishfee/utils/constant.dart';
import 'package:fishfee/viewmodel/welcome_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tuple/tuple.dart';
import 'onboarding_pageview_item.dart';

class WelComePage extends StatefulWidget {
  const WelComePage({Key? key}) : super(key: key);

  @override
  State<WelComePage> createState() => _WelComePageState();
}

class _WelComePageState extends State<WelComePage> {
  late PageController pageController =
      PageController(viewportFraction: 1, keepPage: true, initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            onPageChanged: (page) {
              Provider.of<WelcomePageViewModel>(context, listen: false)
                  .changeOnBoardScreen(page, context);
            },
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            itemCount: Provider.of<WelcomePageViewModel>(context, listen: false)
                .svgAssetPath
                .length,
            itemBuilder: (context, index) {
              return Selector<
                      WelcomePageViewModel,
                      Tuple4<List<String>, List<String>, List<String>,
                          List<String>>>(
                  selector: (ctx, data) => Tuple4(
                      data.svgAssetPath,
                      data.stepStringStart,
                      data.stepStringTop,
                      data.stepStringEnd),
                  shouldRebuild: (prev, next) =>
                      prev.item1.length != next.item2.length,
                  builder: (context, item, child) {
                    return OnBoardingItem(
                      imagePath: item.item1[index],
                      stepStringTop: item.item3[index],
                      stepStringStart: item.item2[index],
                      stepStringEnd: item.item4[index],
                      isCenter: index == 0 ? false : true,
                    );
                  });
            }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                if (pageController.hasClients) {
                  if (pageController.page?.toInt() != 2) {
                    pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutCubic);
                    setState(() {});
                  } else {
                    Navigator.pushNamed(context, Constant.hostRoute);
                  }
                }
              },
              child: Text(
                Provider.of<WelcomePageViewModel>(context, listen: true)
                            .onBoardingCurrentIndex ==
                        2
                    ? "Skip"
                    : "Next",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: Provider.of<WelcomePageViewModel>(context, listen: false)
                  .svgAssetPath
                  .length,
              effect: ExpandingDotsEffect(
                activeDotColor: AppTheme.lightPrimaryColor,
                dotHeight: 12,
                dotWidth: 12,
                // strokeWidth: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
