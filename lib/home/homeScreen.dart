import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/home/tabs/time/time_tab.dart';
import 'package:islami_app/utiles/islamiColors.dart';
import 'package:islami_app/utiles/app_assets.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages= [
    AppAssets.quaranBg,
    AppAssets.hadethbg,
    AppAssets.sebhabg,
    AppAssets.radiobg,
    AppAssets.timebg,


  ];

  List<Widget> tabsList =[
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
  TimeTab()
  ];

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Stack(
      children: [
        Image.asset(backgroundImages[selectedIndex],
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Islamicolors().gold
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index){
                  selectedIndex = index;
                  setState(() {

                  });
              },
              items: [
                buildbottomNavBarItem(iconName: AppAssets.quaranIcon, label: 'quran', index: 0),
                buildbottomNavBarItem(iconName: AppAssets.hadethIcon, label: 'hadeth', index: 1),
                buildbottomNavBarItem(iconName: AppAssets.sebhaIcon, label: 'sebha', index: 2),
                buildbottomNavBarItem(iconName: AppAssets.radioIcon, label: 'radio', index: 3),
                buildbottomNavBarItem(iconName: AppAssets.timeIcon, label: 'time', index: 4),
              ],
              // type: BottomNavigationBarType.fixed,
              // backgroundColor: Islamicolors().gold,
              //   items: [
              //     buildbottomNavBarItem(iconName: AppAssets.quaranIcon, labelName: 'quran', iconSelName: AppAssets.quranSelIcon, index: 0),
              //     buildbottomNavBarItem(iconName: AppAssets.hadethIcon, labelName: 'hadeth', iconSelName: AppAssets.hadethSelIcon, index: 1),
              //     buildbottomNavBarItem(iconName: AppAssets.sebhaIcon, labelName: 'sebha', iconSelName: AppAssets.SebhaSelIcon, index: 2),
              //     buildbottomNavBarItem(iconName: AppAssets.radioIcon, labelName: 'radio', iconSelName: AppAssets.radioSelIcon, index: 3),
              //     buildbottomNavBarItem(iconName: AppAssets.timeIcon, labelName: 'time', iconSelName: AppAssets.timeSelIcon, index: 4),
              //   ]
            ),
          ),
          body: Column(
            spacing: 21,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo,height:height*0.16,),
              Expanded(child: tabsList[selectedIndex])
            ],
          ),
        )
      ],
    );
  }
  BottomNavigationBarItem buildbottomNavBarItem({required String iconName , required String label , required int index }){
    return BottomNavigationBarItem(icon: selectedIndex == index ?Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
      decoration: BoxDecoration(
          color: Islamicolors().blackBg,
        borderRadius: BorderRadius.circular(66),
      ),
    child: ImageIcon(AssetImage(iconName))): ImageIcon(AssetImage(iconName)),
    label: label
    );
  }

  // BottomNavigationBarItem buildbottomNavBarItem({required String iconSelName,required String iconName,required String labelName,required int index}){
  //   return BottomNavigationBarItem(icon: Image.asset(selectedIndex==index?iconSelName : iconName),
  //       label: labelName);
  // }
}