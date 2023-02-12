import 'package:fishfee/viewmodel/DrawerPageControlViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../list_item_widget/rastaurant_item.dart';

class FinderPage extends StatefulWidget {
  const FinderPage({Key? key}) : super(key: key);

  @override
  State<FinderPage> createState() => _FinderPageState();
}

class _FinderPageState extends State<FinderPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DrawerPageControlViewModel>(context,listen: false).getInitAnimationController(AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 400),
          reverseDuration: const Duration(milliseconds: 400)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.red.withOpacity(0.4), BlendMode.multiply),
                    child: Image.asset("assets/search_screen_background.jpg",
                        height: 220,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.softLight)),
                SafeArea(
                    child: IconButton(
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow,
                      color: Colors.white,
                      progress: Provider.of<DrawerPageControlViewModel>(context)
                          .animationController),
                  onPressed: () {
                    Provider.of<DrawerPageControlViewModel>(context,
                            listen: false)
                        .setDrawerOpen();
                  },
                )),
                const Padding(
                  padding: EdgeInsets.only(top: 135.0, left: 20, right: 20),
                  child: Text(
                    "Restaurant Delivery\nto your door ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 200.0, left: 20, right: 20),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 1,
                              offset: const Offset(1, 1))
                        ]),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.location_pin),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              hintText: "Enter your Address",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade400),
                              border: InputBorder.none),
                        )),
                        SizedBox(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "EXPLORE",
                                  style: TextStyle(fontSize: 10),
                                ))),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),

                  /// Categories
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_outlined))
                    ],
                  ),
                  ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black54,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade400,
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(1, 1))
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black54.withOpacity(0.3),
                                        BlendMode.multiply),
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                              image: AssetImage(index == 0
                                                  ? "assets/chinese.jpg"
                                                  : index == 1
                                                      ? "assets/supershop.jpg"
                                                      : "assets/grocery.jpg"),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      index == 0
                                          ? "#Chinese"
                                          : index == 1
                                              ? "#Super Market"
                                              : "#Groceries",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),

                  /// nearby restaurant
                  const Text(
                    "Nearby Restaurant",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      itemCount: 3,
                      padding: const EdgeInsets.only(top: 0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return RestaurantItem(
                          imagePath: index == 0
                              ? "assets/demo_one.jpg"
                              : index == 1
                                  ? "assets/demo_two.jpg"
                                  : "assets/demo_three.jpg",
                        );
                      }),
                  const SizedBox(
                    height: 15,
                  ),

                  /// nearby shop
                  const Text(
                    "Nearby Shop",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ListView.builder(
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 0),
                      itemBuilder: (context, index) {
                        return RestaurantItem(
                            imagePath: index == 0
                                ? "assets/demo_two.jpg"
                                : index == 1
                                    ? "assets/demo_one.jpg"
                                    : "assets/demo_three.jpg");
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
