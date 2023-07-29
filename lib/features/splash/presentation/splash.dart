
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shded/core/strings/app_strings.dart';


class Splash extends StatefulWidget {
  const Splash({super.key , required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  bool? isItNotFirstTime ;

  Future<void> _navigateToOnBoardingScreenOrAnotherOne()async{
    await Future.delayed(const Duration(seconds: 2));
   isItNotFirstTime = widget.sharedPreferences.getBool(kIsItNotFirstTime);

   if(isItNotFirstTime != null && isItNotFirstTime == true){
     // ignore: use_build_context_synchronously
     Navigator.of(context).pushReplacementNamed(kSignUp);
   } else if(isItNotFirstTime == null){
     // ignore: use_build_context_synchronously
     Navigator.of(context).pushReplacementNamed(kOnBoarding);
   }
  }

  @override
  void initState() {
    _navigateToOnBoardingScreenOrAnotherOne();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width  ;
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: fem * .025 , vertical:  fem * .06) ,
        width: double.infinity,
        height: fem *.03,
        decoration: const BoxDecoration (
          color:  Colors.white,
        ),
        child: Center(
          child: SizedBox(
            width: fem *.6,
            height: fem *.2,
            child: Image.asset(
              'assets/images/splash_logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}