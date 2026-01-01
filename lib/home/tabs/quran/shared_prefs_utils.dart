import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const String mostRecentKey = 'most-recent';
}

 Future<void> saveLastSuraIndex(int newSuraIndex)async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> mostRecentList =  prefs.getStringList(SharedPrefsKeys.mostRecentKey)??[];
      //todo: duplicate
      //todo: check index => exist -> remove -> add
      if(mostRecentList.contains('$newSuraIndex')){
        mostRecentList.remove('$newSuraIndex');
      }
      mostRecentList.insert(0,'$newSuraIndex');
      //todo: limit
      if(mostRecentList.length>=5){
        mostRecentList.removeLast();
      }
     await prefs.setStringList(SharedPrefsKeys.mostRecentKey,mostRecentList);
    }


//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPrefsKeys {
//   static const String mostRecentKey = 'most-recent';
// }
//
// // Save: Make it most recent first + no duplicates + limit size
// Future<void> saveLastSuraIndex(int newSuraIndex) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//   List<String> mostRecentList =
//       prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
//
//   // Convert to string
//   String newIndexStr = newSuraIndex.toString();
//
//   // Remove if already exists (avoid duplicates)
//   mostRecentList.remove(newIndexStr);
//
//   // Add to the beginning (most recent first)
//   mostRecentList.insert(0, newIndexStr);
//
//   // Optional: Limit to last 10 recent surahs
//   if (mostRecentList.length > 10) {
//     mostRecentList = mostRecentList.sublist(0, 10);
//   }
//
//   await prefs.setStringList(SharedPrefsKeys.mostRecentKey, mostRecentList);
// }
//
// // Read: Safe parsing with error handling
// Future<List<int>> getLastSuraIndex() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//   List<String>? storedList =
//   prefs.getStringList(SharedPrefsKeys.mostRecentKey);
//
//   if (storedList == null || storedList.isEmpty) {
//     return [];
//   }
//
//   List<int> result = [];
//
//   for (String str in storedList) {
//     int? parsed = int.tryParse(str);
//     if (parsed != null && parsed >= 0 && parsed < 114) { // Valid surah index: 0-113
//       result.add(parsed);
//     }
//     // Silently skip invalid entries
//   }
//
//   return result;
// }



