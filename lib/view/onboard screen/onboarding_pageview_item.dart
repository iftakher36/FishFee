import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/apptheme.dart';
class OnBoardingItem extends StatelessWidget {
  final String imagePath,stepStringTop,stepStringStart,stepStringEnd;
  final bool isCenter;
  const OnBoardingItem({Key? key, required this.imagePath, required this.stepStringTop, required this.stepStringStart, required this.stepStringEnd, required this.isCenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 20,right: 20,bottom: 0,top: 0,
            child: SvgPicture.asset(imagePath,)),
        Positioned(
            left: 20,right: 20,bottom: 20,top: 20,
            child: Text("$stepStringTop\n",style: const TextStyle(fontSize:30,color: Colors.grey,fontWeight: FontWeight.normal),textAlign: isCenter?TextAlign.center:TextAlign.left,)),
        Padding(
          padding: EdgeInsets.only(top: 55.0,left: isCenter?0:20),
          child: Align(
            alignment: isCenter?Alignment.topCenter:Alignment.topLeft,
            child: Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 30),
                children: [
                  TextSpan(text: "$stepStringStart ",style: TextStyle(color: AppTheme.lightPrimaryColor,fontWeight: FontWeight.bold)),
                  TextSpan(text: stepStringEnd,style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.normal)),
                ]
            )),
          ),
        )
      ],
    );
  }
}
