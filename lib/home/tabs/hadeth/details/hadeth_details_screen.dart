

import 'package:flutter/material.dart';

import '../../../../model/hadeth_details.dart';
import '../../../../utiles/app_assets.dart';
import '../../../../utiles/app_styles.dart';
import '../../../../utiles/islamiColors.dart';

class HadethDetailsScreen extends StatelessWidget {
   HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height  = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;
    HadethDetailsArgs args = ModalRoute.of(context)?.settings.arguments as HadethDetailsArgs;


    return Scaffold(
      backgroundColor: Islamicolors().blackBg,
      appBar: AppBar(
          title: Text('Hadith ${args.index}',
            style: AppStyles.bold20gold,),

        ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Image.asset(AppAssets.left_corner),
            Text(args.hadeth.title),
            Image.asset(AppAssets.right_corner)
          ],),
          Expanded(
              child:
              Text(args.hadeth.content,style: AppStyles.bold20gold,textAlign: TextAlign.center,)),
          Image.asset(AppAssets.bottom_bg)
        ],),
      ),
      );

  }
}
