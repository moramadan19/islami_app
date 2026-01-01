import 'package:flutter/material.dart';
import 'package:islami_app/utiles/app_styles.dart';
import 'package:islami_app/utiles/islamiColors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double _turns = 0.0;
  int counter = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ',style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
          ),
          Image.asset('assets/sebha/Mask group-1.png'),
          GestureDetector(
            onTap: _changeRotation,
            child: Stack(
              alignment: Alignment.center,
              children :[
                AnimatedRotation(turns:  _turns, duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: Image.asset('assets/sebha/SebhaBody 1.png')),
                Column(children: [
                  Text('سبحان الله',style: AppStyles.bold36white,),
                  Text('$counter',style: AppStyles.bold36white,)
                ] )
              ]
            ),
          )
        ],
      ),
    );
  }

  void _changeRotation() {
    if(counter>1){
      counter--;
    }else{
      counter = 30;
    }
    setState(() {
      // Add 0.25 to the turns value for a 90-degree (quarter) turn
      _turns += 0.034;

      // You can add more logic here for specific angles
    });
  }
}
