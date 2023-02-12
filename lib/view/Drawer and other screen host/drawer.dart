import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../list_item_widget/drawer_item.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/person.png"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ///barrier
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 8),
                  child: Container(
                    height: 1,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20,),
                ///name
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: DrawerItem(icon: Icons.person, text: 'Alex Rock',),
                ),
                const SizedBox(height: 10,),
                ///phone
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: DrawerItem(icon: Icons.phone_android, text: '(614) 384-3431',),
                ),
                const SizedBox(height: 10,),
                ///Address
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: DrawerItem(icon: Icons.location_city, text: 'NewYork,USA',),
                ),
                const SizedBox(height: 20,),
                ///barrier
                Padding(
                  padding:  const EdgeInsets.only(left: 12.0, right: 8),
                  child: Container(
                    height: 1,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20,),
                ///edit
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: DrawerItem(icon: Icons.countertops_rounded, text: 'Courier Service',),
                ),
                const SizedBox(height: 10,),
                ///Cart
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: DrawerItem(icon: Icons.shopping_cart, text: 'Cart',),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 200,
        child: Column(
          children: [
            ///barrier
            Padding(
              padding:  const EdgeInsets.only(left: 12.0, right: 8),
              child: Container(
                height: 1,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20,),
            ///edit
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: DrawerItem(icon: Icons.mode_edit_outline_outlined, text: 'Update Profile',),
            ),
            const SizedBox(height: 10,),
            ///edit
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: DrawerItem(icon: Icons.password_sharp, text: 'Change Password',),
            ),
            const SizedBox(height: 10,),
            ///Logout
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: DrawerItem(icon: Icons.login_outlined, text: 'Logout',),
            )
          ],
        ),
      ),
    );
  }
}

