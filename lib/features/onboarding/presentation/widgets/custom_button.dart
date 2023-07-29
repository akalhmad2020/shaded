import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_theam.dart';
import '../../../../core/strings/app_strings.dart';


// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  const  CustomButton({Key? key , required this.pageController , required this.width ,
  required this.height , required this.numberOfIndex , required this.sharedPreferences}) : super(key: key);
  final double width ;
  final double height ;
  final int numberOfIndex ;
  final PageController pageController ;
  final SharedPreferences sharedPreferences ;

  @override
  Widget build(BuildContext context) {
    return    Container(
      width: width * 0.85,
      height: height * 0.06,
      decoration: BoxDecoration(
          color: primaryColor ,
          borderRadius: BorderRadius.circular(10)
      ),
      child: MaterialButton(
        onPressed: (){
          if(numberOfIndex == 2){
            sharedPreferences.setBool(kIsItNotFirstTime, true);
            Navigator.of(context).pushReplacementNamed(kSignUp);
          }
          pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
        }, child:   Text(  numberOfIndex == 2 ?  kOnBoardingButtonGetStarted  : kOnBoardingButtonNext ,
        style: const TextStyle(color: Colors.white),),),
    );
  }
}
