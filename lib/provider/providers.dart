import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_application/modal/modal.dart';

class SpaceProvider extends ChangeNotifier {
  List dataList = [];
  List<Planet> planetListAll = [];
  List<Planet> bookmarkedList = [];


  SpaceProvider() {
    jsonParsing();
    loadBookmarkedPlanets();
  }

  Future<void> jsonParsing() async {
    String? json = await rootBundle.loadString('assets/json/spaceList.json');
    dataList = jsonDecode(json);
    planetListAll = dataList.map((e) => Planet.fromJson(e)).toList();
    notifyListeners();
  }
  Future<void> loadBookmarkedPlanets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? bookmarkedPlanets = prefs.getStringList('bookmarkedPlanets');

    if (bookmarkedPlanets != null) {
      bookmarkedList = planetListAll
          .where((planet) => bookmarkedPlanets.contains(planet.name))
          .toList();
      notifyListeners();
    }
  }
  Future<void> saveBookmarkedPlanets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> bookmarkedPlanets =
    bookmarkedList.map((planet) => planet.name).toList();
    await prefs.setStringList('bookmarkedPlanets', bookmarkedPlanets);
  }
}
