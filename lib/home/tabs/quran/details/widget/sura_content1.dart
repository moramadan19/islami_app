import 'package:flutter/material.dart';
import 'package:islami_app/utiles/app_styles.dart';
import 'package:islami_app/utiles/islamiColors.dart';

class SuraContent1 extends StatelessWidget {
  final String content;
  const SuraContent1({super.key,required this.content,});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return Text(content,
    textDirection: TextDirection.rtl,
    textAlign: TextAlign.center,
    style: AppStyles.bold20gold,);
  }
}
