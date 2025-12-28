import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home/tabs/quran/details/sura_details_screen.dart';
import 'package:islami_app/home/tabs/quran/details/widget/most_recent_widget.dart';
import 'package:islami_app/home/tabs/quran/shared_prefs_utils.dart';
import 'package:islami_app/home/tabs/quran/widget/sura_item_widget.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/utiles/app_assets.dart';
import 'package:islami_app/utiles/app_routes.dart';
import 'package:islami_app/utiles/app_styles.dart';
import 'package:islami_app/utiles/islamiColors.dart';

class QuranTab extends StatefulWidget {
   QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
   List<int> filterList = List.generate(114, (index) => index,);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height*0.02,
        children: [
        TextField(
          cursorColor: Islamicolors().gold,
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            enabledBorder:builtDecoration(),
            focusedBorder: builtDecoration(),
            prefixIcon: Image.asset(AppAssets.suraIcon),
            hintText: 'Surah Name',
            hintStyle: AppStyles.bold16white
            // hintStyle: Theme.of(context).textTheme.headlineMedium
          ),
          onChanged: (newText){
              searchByNewText(newText);
          },
        ),
          MostRecentWidget(),
          Text('Suras List',style: AppStyles.bold16white,),
          Expanded(child: filterList.isEmpty?
              Center(child: Text('No Sura Item Found',style: AppStyles.bold20white,),)
              :
          ListView.separated(
              itemBuilder: (context,index){
                return InkWell(
                onTap: (){
                  //todo: save last sura index
                  saveLastSuraIndex(filterList[index]);
                  //todo: Navigate to sura Details screen
                  Navigator.of(context).pushNamed(AppRoutes.suraDetailsScreenRoute1,
                      arguments: filterList[index]);
                }
                ,child: SuraItemWidget(index: filterList[index],));
                },
              separatorBuilder: (context,index){
                return Divider(
                  color: Colors.white,
                thickness: 2,
                  indent: width*0.06 ,
                  endIndent: width*0.06,
                );
              },
              itemCount: filterList.length))
      ],),
    );
  }

  OutlineInputBorder builtDecoration(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            color: Islamicolors().gold,
            width: 2
        )
    );
  }

  void searchByNewText(String newText) {
    List<int> filterSearchList = [];
    for(int i =0;i < QuranResources.englishQuranSuraList.length;i++){
      if(QuranResources.englishQuranSuraList[i].toLowerCase().contains(newText.toLowerCase())){
        filterSearchList.add(i);
      }
    }
    for(int i =0;i < QuranResources.arabicQuranSuraList.length;i++){
      if(QuranResources.arabicQuranSuraList[i].toLowerCase().contains(newText.toLowerCase())){
        filterSearchList.add(i);
      }
    }
    filterList = filterSearchList;
    setState(() {

    });
  }
}
