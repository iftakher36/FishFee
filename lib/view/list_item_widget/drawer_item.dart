
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const DrawerItem({
    Key? key, required this.icon, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(color: Colors.white10,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 1),
                spreadRadius: 1,
                blurRadius: 5
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0,bottom: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const SizedBox(width: 5,),
            Icon(icon,color: Colors.white30,),
            const SizedBox(width: 5,),
            Expanded(child: Text(text,style: const TextStyle(color: Colors.white,fontSize: 12),))
          ],
        ),
      ),
    );
  }
}