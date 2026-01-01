import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth.dart';
import 'package:islami_app/model/hadeth_details.dart';
import 'package:islami_app/utiles/app_assets.dart';
import 'package:islami_app/utiles/app_routes.dart';
import 'package:islami_app/utiles/app_styles.dart';
import 'package:islami_app/utiles/islamiColors.dart';

class HadethItem extends StatefulWidget {
  final int index ;

   HadethItem({super.key,required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
   Hadeth? hadeth;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadhadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
     var width = MediaQuery.of(context).size.width;


     return Container(
     decoration: BoxDecoration(
     image : DecorationImage(image: AssetImage(AppAssets.bg3))
      ,borderRadius: BorderRadius.circular(20),
      color: Islamicolors().gold
    ),child: hadeth ==null?
        Center(child: CircularProgressIndicator(
          color: Islamicolors().gold,
        ))
        :
         Column(
           spacing: height*0.02,
           children: [
             Padding(
               padding: const EdgeInsets.only(left: 8,right: 8,top: 8),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween
               ,children: [
                 Image.asset(AppAssets.left_corner2),
                 Expanded(child: Text(hadeth?.title ??'',style: AppStyles.bold24black,textAlign: TextAlign.center,)),
                 Image.asset(AppAssets.right_corner2)

               ],),
             ),
           Expanded(child: SingleChildScrollView(child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: InkWell(onTap: (){
               Navigator.of(context).pushNamed(AppRoutes.HadethDetailsScreenRoute,arguments: HadethDetailsArgs(hadeth: hadeth!, index: widget.index));
             },child: Text(hadeth?.content??'',style: AppStyles.bold16black,textAlign: TextAlign.center,)),
           ))),
             Image.asset(AppAssets.bottom2)

         ],),

    );
  }

  void loadhadethFile(int index)async{
   String fileContent= await rootBundle.loadString('assets/Hadeeth/h$index.txt');
   List<String> hadethLines = fileContent.split('\n');
   int fileContentIndex=  fileContent.indexOf('\n');
   String title = fileContent.substring(0,fileContentIndex);
   String content = fileContent.substring(fileContentIndex+1);
   hadeth= Hadeth(title: title, content: content);
   await Future.delayed(Duration(seconds: 1));
   setState(() {

   });


   // hadethLines.sublist(0,hadethLines.indexOf('\n'));
   // for(int i =0;i<hadethLines.length;i++){
   //   String title = hadethLines[0];
   //   hadethLines.removeAt(0);
   // }
  }
}
