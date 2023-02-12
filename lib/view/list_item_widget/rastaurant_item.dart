
import 'package:fishfee/widget/custom_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantItem extends StatelessWidget {
  final String imagePath;
  const RestaurantItem({
    Key? key, required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: const Offset(1,1)
              ),
              BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 2,
                  blurRadius: 20,
                  offset: const Offset(1,1)
              ),
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover

                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0,left: 12),
                  child: ClipPath(
                    clipper: PolygonRightClip(),
                    child: Container(
                      color: Colors.green.shade700,
                      constraints: const BoxConstraints(
                        maxWidth: 100,
                        minHeight: 20
                      ),
                      child: Row(
                        children: const [
                          SizedBox(width: 5,),
                          Icon(Icons.star,color: Colors.white,size: 15,),
                          Text("\$0 Delivery ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Expanded(child: Text("Test Restaurants",style: TextStyle(fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),)),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: const [
                        Expanded(child: Text("\$5 delivery fee",style: TextStyle(overflow: TextOverflow.ellipsis),)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}