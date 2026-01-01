import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/tabs/quran/shared_prefs_utils.dart';

class MostRecentProvider extends ChangeNotifier{
  //todo: data
  List<int> mostRecentList= [];

  //todo: get last sura index => read Data
  void getLastSuraIndex()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesAsString = prefs.getStringList(SharedPrefsKeys.mostRecentKey)??[];
    mostRecentList = mostRecentIndicesAsString.map((newSuraIndex)=>int.parse(newSuraIndex)).toList();
    notifyListeners();
    // return mostRecentIndicesAsInt.reversed.toList();

  }

}