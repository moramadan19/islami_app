import 'package:flutter/material.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/utiles/app_assets.dart';
import 'package:islami_app/utiles/app_styles.dart';

class SuraItemWidget extends StatelessWidget {
  final int index;
  const SuraItemWidget({super.key,required this.index });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Row(
      spacing: width*0.05,
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset(AppAssets.frame),
            Text('${index + 1}',style: AppStyles.bold20white,)
          ],
        ),
        Expanded(
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(QuranResources.englishQuranSuraList[index],style: AppStyles.bold20white,),
            Text('${QuranResources.VersasNumberList[index]} Verses',style: AppStyles.bold14white,),


          ],),
        ),
        // Spacer(),
        Text(QuranResources.arabicQuranSuraList[index],style: AppStyles.bold20white,)

        ],
    );
  }
}
