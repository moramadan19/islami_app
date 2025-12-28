import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/quran/shared_prefs_utils.dart';
import 'package:islami_app/model/quran_resources.dart';

import '../../../../../utiles/app_assets.dart';
import '../../../../../utiles/app_styles.dart';
import '../../../../../utiles/islamiColors.dart';

class MostRecentWidget extends StatefulWidget {
   MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  List<int> mostRecentList= [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      getMostRecentList();
    }

  void getMostRecentList()async{
    mostRecentList= await getLastSuraIndex();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Visibility(
      visible: mostRecentList.isNotEmpty,
      child: Column(
        spacing: height*0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently',style: AppStyles.bold16white,),
          SizedBox(
              height: height*0.16
              ,child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: width*0.02),
                  decoration: BoxDecoration(
                      color: Islamicolors().gold,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Column(
                        spacing: height*0.0086,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(QuranResources.englishQuranSuraList[mostRecentList[index]],style:AppStyles.bold24black),
                          Text(QuranResources.arabicQuranSuraList[mostRecentList[index]],style:AppStyles.bold24black),
                          Text('${QuranResources.VersasNumberList[mostRecentList[index]]}Verses',style: AppStyles.bold14black,),
                        ],
                      ),
                      Image.asset(AppAssets.suraImage)
                    ],
                  ),
                );
              },
              separatorBuilder: (context,index){
                return SizedBox(width: width*0.04,);
              },
              itemCount: mostRecentList.length
          )),
        ],
      ),
    );
  }
}
