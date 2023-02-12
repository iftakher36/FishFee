import 'package:fishfee/view/main%20screen/finder_page.dart';
import 'package:fishfee/viewmodel/DrawerPageControlViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawer.dart';

class DrawerHost extends StatefulWidget {
  const DrawerHost({Key? key}) : super(key: key);

  @override
  State<DrawerHost> createState() => _DrawerHostState();
}

class _DrawerHostState extends State<DrawerHost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DrawerPage(),
          AnimatedContainer(
            curve: Curves.easeInCirc,
              duration: const Duration(milliseconds: 80),
              transform: Matrix4.translationValues(Provider.of<DrawerPageControlViewModel>(context).offsetX,
                  Provider.of<DrawerPageControlViewModel>(context).offsetY, 0)..scale(Provider.of<DrawerPageControlViewModel>(context).scale),
              child: GestureDetector(
                onTap: (){
                  Provider.of<DrawerPageControlViewModel>(context,listen: false).setDrawerClose();
                },
                onHorizontalDragUpdate: (t){
                  if (t.delta.dx > 8) {
                    Provider.of<DrawerPageControlViewModel>(context,listen: false).setDrawerOpen();
                  } else if(t.delta.dx < -8){
                    Provider.of<DrawerPageControlViewModel>(context,listen: false).setDrawerClose();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Provider.of<DrawerPageControlViewModel>(context).isDrawerOpen?15:0),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(1,1),
                        color: Colors.black54,
                        spreadRadius: 1,
                        blurRadius: 10,
                        blurStyle: BlurStyle.outer

                      ),
                    ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Provider.of<DrawerPageControlViewModel>(context).isDrawerOpen?15:0),
                    child: AbsorbPointer(
                        absorbing: Provider.of<DrawerPageControlViewModel>(context,listen: true).isDrawerOpen,
                        child: const FinderPage()),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
