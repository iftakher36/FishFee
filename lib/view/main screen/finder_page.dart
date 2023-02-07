import 'package:flutter/material.dart';

class FinderPage extends StatefulWidget {
  const FinderPage({Key? key}) : super(key: key);

  @override
  State<FinderPage> createState() => _FinderPageState();
}

class _FinderPageState extends State<FinderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.red.withOpacity(0.4), BlendMode.multiply),
                  child: Image.asset("assets/search_screen_background.jpg",height: 220,fit: BoxFit.cover,colorBlendMode: BlendMode.softLight)),
              const Padding(
                padding: EdgeInsets.only(top: 135.0,left: 20,right: 20),
                child: Text("Restaurant Delivery\nto your door ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200.0,left: 20,right: 20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 1,
                        offset: const Offset(1,1)
                      )
                    ]
                  ),
                  child: Row(
                    children:  [
                      const SizedBox(width: 10,),
                      const Icon(Icons.location_pin),
                      const SizedBox(width: 8,),
                      Expanded(
                          child: TextField(decoration: InputDecoration(
                            hintText: "Enter your Address",
                            hintStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade400),
                            border: InputBorder.none
                          ) ,

                      )),
                      SizedBox(
                          width: 80,
                          child: ElevatedButton(onPressed: (){}, child: const Text("EXPLORE",style: TextStyle(fontSize: 10),))),
                      const SizedBox(width: 8,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                const Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                const SizedBox(height: 15,),
                SizedBox(
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: EdgeInsets.only(left: index==0?15:0,bottom: 8,right: 10),
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        spreadRadius: 1,
                                        offset: const Offset(1,1)
                                    )
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0,right: 10),
                                child: Center(child: Text(index==0?"Chinese":index==1?"Super Market":"Groceries",style: TextStyle(fontSize: 12),)),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(height: 15,),
                const Text("Nearby Restaurant",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                const SizedBox(height: 15,),
                SizedBox(
                  height: 180,
                  child: Align(
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: EdgeInsets.only(left: index==0?15:0,bottom: 8,right: 10),
                            child: Container(
                              width: 160,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        spreadRadius: 1,
                                        offset: const Offset(1,1)
                                    )
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(index==0?"assets/demo_one.jpg":index==1?"assets/demo_two.jpg":"assets/demo_three.jpg",height: 100,fit: BoxFit.cover,),
                                  const SizedBox(height: 12,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: const Text("Test Restaurants"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: const Text("\$5 delivery fee"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(height: 15,),
                const Text("Nearby Shop",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                const SizedBox(height: 15,),
                SizedBox(
                  height: 120,
                  child: Align(
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: EdgeInsets.only(left: index==0?15:0,bottom: 8,right: 10),
                            child: Container(
                              width: 160,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        spreadRadius: 1,
                                        offset: const Offset(1,1)
                                    )
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(index==0?"assets/demo_one.jpg":index==1?"assets/demo_three.jpg":"assets/demo_two.jpg",height: 80,fit: BoxFit.cover,),
                                  const SizedBox(height: 8,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(index==0?"Big Bazar":"Life Style"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
