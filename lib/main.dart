import 'package:flutter/material.dart';
import 'package:islami_app/home/homeScreen.dart';
import 'package:islami_app/home/tabs/hadeth/details/hadeth_details_screen.dart';
import 'package:islami_app/home/tabs/quran/details/sura_details_screen.dart';
import 'package:islami_app/home/tabs/quran/details/sura_details_screen1.dart';
import 'package:islami_app/introScreen.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/utiles/app_routes.dart';
import 'package:islami_app/utiles/app_theme.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(create: (BuildContext context) => MostRecentProvider(),
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreenRoute,
      routes: {
        AppRoutes.introScreenRoute:(context)=>IntroScreen(),
        AppRoutes.homeScreenRoute:(context)=> HomeScreen(),
        AppRoutes.suraDetailsScreenRoute:(context)=> SuraDetailsScreen(),
        AppRoutes.suraDetailsScreenRoute1:(context)=> SuraDetailsScreen1(),
        AppRoutes.HadethDetailsScreenRoute:(context)=> HadethDetailsScreen(),


      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
