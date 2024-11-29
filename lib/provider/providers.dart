import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_application/modal/modal.dart';

class SpaceProvider extends ChangeNotifier {
  List dataList = [];
  List<Planet> planetListAll = [];
  List<Planet> bookmarkedList = [];

  List<String> likeList = [];
  SpaceProvider() {
    jsonParsing();

  }

  Future<void> jsonParsing() async {
    String? json = await rootBundle.loadString('assets/json/spaceList.json');
    dataList = jsonDecode(json);
    planetListAll = dataList.map((e) => Planet.fromJson(e)).toList();
    notifyListeners();
  }
  Future<void> addFavourite(String name) async {
    String data = "$name";


    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    likeList.add(data);
    // likeList.add(image);

    sharedPreferences.setStringList('likeList', likeList);
  }

  void remove(int index)
  {
    planetListAll.removeAt(index);
    notifyListeners();
  }
}
