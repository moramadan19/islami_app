import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/tabs/quran/details/widget/sura_content.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/utiles/app_assets.dart';
import 'package:islami_app/utiles/app_styles.dart';

import '../../../../utiles/app_routes.dart';
import '../../../../utiles/islamiColors.dart';

class SuraDetailsScreen extends StatefulWidget {
   SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var height  = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if(verses.isEmpty){
    loadSuraFile(index); }

    return Scaffold(
      backgroundColor: Islamicolors().blackBg,
      appBar: AppBar(
          title: Text(QuranResources.englishQuranSuraList[index],
            style: AppStyles.bold20gold,),
        actions: [
          Icon(Icons.view_agenda_rounded),
          InkWell(onTap: (){
            Navigator.of(context).pushNamed(AppRoutes.suraDetailsScreenRoute1,
                arguments: index);
          },child: Icon(Icons.view_headline))
        ],

        ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Image.asset(AppAssets.left_corner),
            Text(QuranResources.arabicQuranSuraList[index],style: AppStyles.bold24gold,),
            Image.asset(AppAssets.right_corner)
          ],),
          Expanded(
              child: verses.isEmpty?
                  Center(child: CircularProgressIndicator(color: Islamicolors().gold,))
                  :
              ListView.separated(
                padding: EdgeInsets.only(top: height*0.02),
              itemBuilder: (context,index){
                return SuraContent(content: verses[index], index: index,);
              },
              separatorBuilder:(context,index){
                return SizedBox(
                  height: height*0.02,
                );
              },
              itemCount: verses.length)),
          Image.asset(AppAssets.bottom_bg)
        ],),
      ),
      );

  }

  void loadSuraFile(int index)async{
    String fileContent = await rootBundle.loadString('assets/Suras/${index+1}.txt');
    List<String> lines = fileContent.split('\n');
    for(int i =0; i<lines.length; i++){
      print(lines[i]);
    }
    verses = lines;
    await Future.delayed(Duration(seconds: 1));
    setState(() {

    });
  }
}
