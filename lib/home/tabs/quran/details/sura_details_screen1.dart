import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/tabs/quran/details/widget/sura_content.dart';
import 'package:islami_app/home/tabs/quran/details/widget/sura_content1.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/utiles/app_routes.dart';
import 'package:provider/provider.dart';

import '../../../../model/quran_resources.dart';
import '../../../../utiles/app_assets.dart';
import '../../../../utiles/app_styles.dart';
import '../../../../utiles/islamiColors.dart';

class SuraDetailsScreen1 extends StatefulWidget {
   SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  String suraContent = '';
  late MostRecentProvider mostRecentProvider ;


  @override
  Widget build(BuildContext context) {
    var height  = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    if(suraContent.isEmpty){
      loadSuraFile(index);
    }

    return Scaffold(
      backgroundColor: Islamicolors().blackBg,
      appBar: AppBar(
        title: Text(QuranResources.englishQuranSuraList[index],
          style: AppStyles.bold20gold,),
        actions: [
          InkWell(onTap: (){
            Navigator.of(context).pushNamed(AppRoutes.suraDetailsScreenRoute,
                arguments: index);
          },child: Icon(Icons.view_agenda_rounded)),
          Icon(Icons.view_headline)
        ],


      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04),
        child: Column(
        spacing: height*0.04  ,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.left_corner),
              Text(QuranResources.arabicQuranSuraList[index],style: AppStyles.bold24gold,),
              Image.asset(AppAssets.right_corner)
            ],),
          Expanded(child: suraContent.isEmpty?
              Center(child: CircularProgressIndicator(color: Islamicolors().gold,)):
              SingleChildScrollView(child: SuraContent1(content: suraContent))
          ),

          Image.asset(AppAssets.bottom_bg)
        ],),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //todo: read last sura index from shared prefs
    mostRecentProvider.getLastSuraIndex();

  }

  void loadSuraFile(int index)async{
    String fileContent = await rootBundle.loadString('assets/Suras/${index+1}.txt');
    List<String> lines = fileContent.split('\n');
    for(int i =0; i<lines.length; i++){
      lines[i] += '[${i+1}]';
    }

    suraContent =lines.join();
    await Future.delayed(Duration(seconds: 1));
    setState(() {

    });
  }
}
