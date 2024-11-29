import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Container(
        height: 820,
        width: 500,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/images/sp1.jpg'))),
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            // Center(
            //   child: Animate(
            //     effects: [FadeEffect(), ScaleEffect()],
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Text(
            //         "Hello World!",
            //         style: TextStyle(fontSize: 22, color: Colors.white),
            //       ),
            //     ),
            //   ),
            // ),
            // // an opacity of 1 is "neutral"
            // Text("Hello", style: TextStyle(
            //   color: Colors.grey.shade100,
            //   fontSize: 32,)).animate().fade(), // begin=0, end=1
            // Text("Hello", style: TextStyle(
            //   color: Colors.grey.shade100,
            //   fontSize: 32,)).animate().fade(begin: 0.5), // e,nd=1
            Text(
              "SPACE TOUR",
              style: TextStyle(
                  color: Colors.grey.shade100,
                  fontSize: 42,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            )
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .fadeOut(curve: Curves.easeInOut),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                  children: AnimateList(
                interval: 400.ms,
                effects: [FadeEffect(duration: 300.ms)],
                children: [
                  Text(
                    "Hi WellCome",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 22),
                  ),
                  Text(
                    "To Space",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  )
                ],
              )),
            ),

            // shader can be combined with other effects

            SizedBox(
              height: 350,
            ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {

                Navigator.of(context).pushNamed("/sec");
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                   borderRadius: BorderRadius.circular(10)
                ),
                child:   Center(
                  child: Text(
                    "Enjoy 🚀",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ).animate().swap(
                      duration: 900.ms,
                      builder: (_, __) => Text(
                        "Get Start",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )),
                ),
              ),
            ),
          )

            // or shorthand:
            //          , Column(
            //             children: [Text("Hello"), Text("World"),  Text("Goodbye")]
            //                 .animate(interval: 400.ms).fade(duration: 300.ms),
            //           )
          ],
        ),
      )),
    );
  }
}
