

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_application/details/details.dart';

import '../provider/providers.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    final SpaceProvider spaceProvider = Provider.of<SpaceProvider>(context);
    final SpaceProvider spaceProviderF =
    Provider.of<SpaceProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      body:
     Column(
       children: [
         ...List.generate(spaceProvider.planetListAll.length, (index) =>  Column(
           children: [
             SizedBox(
               height: 50,
             ),
             Center(
               child: Container(
                 height: 130,
                 width: 350,
                 decoration: BoxDecoration(
                     color: Colors.white12,
                     borderRadius: BorderRadius.circular(20)

                 ),
                 child: Column(
                   children: [
                     SizedBox(
                       height: 10,
                       width: 20,

                     ),
                     Row(
                       children: [
                         SizedBox(
                           width: 20,
                         ),
                         Container(
                           height: 100,
                           width: 100,
                           decoration: BoxDecoration(
                               image: DecorationImage(image: AssetImage(spaceProvider.planetListAll[like].image))
                           ),
                         ),
                         SizedBox(
                           width: 30,
                         ),
                         Column(
                           children: [
                             Text(spaceProvider.planetListAll[like].name,style: TextStyle(color: Colors.white,fontSize: 22),),
                             Text(spaceProvider.planetListAll[like].subtitle,style: TextStyle(color: Colors.white,fontSize: 18),)
                           ],
                         )
                       ],
                     )
                   ],
                 ),
               ),
             )
           ],
         ),)
       ],
     )
    );
  }
}
