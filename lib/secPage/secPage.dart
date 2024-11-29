import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_application/details/details.dart';

import '../provider/providers.dart';

class secPage extends StatefulWidget {
  const secPage({super.key});

  @override
  State<secPage> createState() => _secPageState();
}

class _secPageState extends State<secPage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SpaceProvider spaceProvider = Provider.of<SpaceProvider>(context);
    final SpaceProvider spaceProviderF =
        Provider.of<SpaceProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: 900,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.5,
                image: AssetImage('assets/images/k.gif'))),
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Hi Krupa",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Which Planet You Explore  ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 2)
                ],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/sp1.jpg'))),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider.builder(
                itemCount: spaceProvider.planetListAll.length,
                options: CarouselOptions(
                  height: 400,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: false,
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder: (context, index, realIndex) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => detailsPage()),
                      );
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 500,
                          width: 300,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              //   color: Color(int.tryParse(spaceProvider.planetListAll[index].color) ?? 0xFF000000),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.transparent,
                                    spreadRadius: 2,
                                    offset: Offset(0, 2),
                                    blurRadius: 2)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 220),
                                  const Text('Planet',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22)),
                                  const SizedBox(height: 5),
                                  Text(
                                    spaceProvider.planetListAll[index].name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 52,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    spaceProvider.planetListAll[index].gravity,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -50,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: RotationTransition(
                              turns: _animationController,
                              child: Image.asset(
                                fit: BoxFit.cover,
                                spaceProvider.planetListAll[index].image,
                                height: 280,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

//
int selectedIndex = 0;
