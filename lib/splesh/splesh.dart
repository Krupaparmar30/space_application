
import 'package:flutter/material.dart';
import 'package:so_simple_splash/so_simple_splash.dart';

class SpleshPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Simple_splash(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: 5),
          logo: Image(
              fit:BoxFit.cover,image: AssetImage('assets/images/sp1.jpg')),

          //gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
          whileWaiting: () async {
            // Simulate a task like fetching data
            await Future.delayed(Duration(seconds: 5));
          },
          onFinished: () async {
            // Navigate to the next page
            Navigator.of(context).pushNamed('/home');
          },
        ),
      ),
    );
  }
}
