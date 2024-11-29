import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_application/details/details.dart';
import 'package:space_application/provider/providers.dart';
import 'package:space_application/secPage/secPage.dart';
import 'package:space_application/splesh/splesh.dart';

import 'LikePage/LikePage.dart';
import 'homePage/homePage.dart';

void main()
{
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       routes: {
          '/':(context)=>SpleshPage(),
         '/home':(context)=>homePage(),
          '/sec':(context)=>secPage(),
         '/det':(context)=>detailsPage(),
         '/fav':(context)=>LikePage()
       },
      ),
    );
  }
}
