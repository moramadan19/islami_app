import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/utiles/app_routes.dart';
import 'package:islami_app/utiles/islamiColors.dart';

class IntroScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IntroductionScreen(
      globalBackgroundColor: Islamicolors().black,
      pages: [
        buildPage(title: 'Welcome To Islami App', bodyimage: 'assets/images/first.png', bodyText: ''),
        buildPage(title: 'Welcome To Islami', bodyimage: 'assets/images/mosq.png', bodyText: 'We Are Very Excited To Have You In Our Community'),
        buildPage(title: 'Reading the Quran', bodyimage: 'assets/images/introQuran.png', bodyText: 'Read, and your Lord is the Most Generous'),
        buildPage(title: 'Bearish', bodyimage: 'assets/images/introDoaa.png', bodyText: 'Praise the name of your Lord, the Most High'),
        buildPage(title: 'Holy Quran Radio', bodyimage: 'assets/images/introMike.png', bodyText: 'You can listen to the Holy Quran Radio through the application for free and easily')

      
      ],
      showBackButton: true,
      back: const Text(
        'Back',
        style: TextStyle(
          color: Color(0xFFE2BE7F),
          fontWeight: FontWeight.bold,
        ),
      ),
      next: const Text (
        'Next',
        style: TextStyle(
          color: Color(0xFFE2BE7F),
          fontWeight: FontWeight.bold,
        ),
      ),
      done: InkWell(
        onTap:(){ Navigator.of(context).pushNamed(AppRoutes.homeScreenRoute);},
        child: const Text(
          'Finish',
          style: TextStyle(
            color: Color(0xFFE2BE7F),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      onDone: () {
        Navigator.pushReplacementNamed(context, '/login');
      },


     
    );
  }
  PageViewModel buildPage({
    required String title,
    required String bodyimage,
    required String bodyText
}){
    return PageViewModel(
        titleWidget: const SizedBox(),
        bodyWidget: Column(children:
        [
          Center(child: Image.asset('assets/images/logo.png')),
          Image.asset(bodyimage) ,
          Text(title,style: TextStyle(
              color: Islamicolors().gold,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),),
           SizedBox(height: 20),
          if(bodyText.isNotEmpty)  Text(bodyText,style: TextStyle(
              color: Islamicolors().gold,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),

        ],)
    );
  }
}