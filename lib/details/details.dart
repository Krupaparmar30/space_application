import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_application/secPage/secPage.dart';

import '../LikePage/LikePage.dart';
import '../provider/providers.dart';

class detailsPage extends StatefulWidget {
  const detailsPage({super.key});

  @override
  State<detailsPage> createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage>
    with TickerProviderStateMixin {
  late AnimationController _animationControllerAll;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationControllerAll = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  void dispose() {
    _animationControllerAll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SpaceProvider spaceProvider = Provider.of<SpaceProvider>(context);
    final SpaceProvider spaceProviderF =
        Provider.of<SpaceProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 880,
              width: 410,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      opacity: 0.2,
                      fit: BoxFit.cover,
                      image: AssetImage(
                          spaceProvider.planetListAll[selectedIndex].image))),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Positioned(
                        top: -20,
                        left: 0,
                        right: 0,
                        child: RotationTransition(
                          turns: _animationControllerAll,
                          child: Image.asset(
                            fit: BoxFit.cover,
                            spaceProvider.planetListAll[selectedIndex].image,
                            height: 280,
                          ),
                        ),
                      ),
                      Container(
                        height: 500,
                        width: 380,
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(20)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                spaceProvider.planetListAll[selectedIndex].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 150),
                                child: Text(
                                  'Gravity : ${spaceProvider.planetListAll[selectedIndex].gravity}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 1, left: 20),
                                child: Text(
                                  'Details : ${spaceProvider.planetListAll[selectedIndex].description}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 200),
                                child: Text(
                                  'Distance : ${spaceProvider.planetListAll[selectedIndex].distance}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 80),
                                child: Text(
                                  'Length_of_day : ${spaceProvider.planetListAll[selectedIndex].length_of_day}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Text(
                                  'Surface_area : ${spaceProvider.planetListAll[selectedIndex].surface_area}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 180,left: 20),
                                    child: Text(
                                      'Velocity : ${spaceProvider.planetListAll[selectedIndex].velocity}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 1,
                                          fontSize: 18),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => LikePage()),
                                        );
                                        setState(() {
                                         spaceProvider.likeList.add(spaceProvider.planetListAll[selectedIndex].name);
                                        });


                                      },
                                      icon: Icon(Icons.favorite,
                                      color: Colors.red,
                                      size: 32,))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
int like=0;