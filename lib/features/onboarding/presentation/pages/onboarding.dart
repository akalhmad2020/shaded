
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shded/features/onboarding/presentation/widgets/dotes.dart';


import '../../../../core/strings/app_strings.dart';
import '../../domain/on_boarding_entity.dart';
import '../widgets/custom_button.dart';
import '../widgets/skip_button.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key , required this.sharedPreferences});
  final SharedPreferences sharedPreferences ;
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  int numberOfIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    List<OnBoardingEntity> onBoarding = const [
      OnBoardingEntity(text:  kFirstOnBoardingText , imageSrc: kFirstSrcImageOnBoarding),
      OnBoardingEntity(text:  kSecondOnBoardingText , imageSrc: kSecondSrcImageOnBoarding),
      OnBoardingEntity(text:  kThirdOnBoardingText , imageSrc: kThirdSrcImageOnBoarding),
    ] ;


    PageController pageController = PageController();
    return Scaffold(
      body: SafeArea(
        // Main widget in this page and it holds all next widgets.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            // To skip on boarding pages.
            padding:   EdgeInsets.symmetric(horizontal: width * .06 , vertical: width * .06),
            child: SkipButton(pageController: pageController,),
          ),
            Expanded(
              flex: 2,
              // This is page view builder and holds image and text.
              child:    PageView.builder(
                  onPageChanged: (int index){
                    setState(() {
                      numberOfIndex = index ;
                    });
                  },
                  controller: pageController,
                  itemCount: onBoarding.length ,
                  itemBuilder: (c,i){
                    return  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/${onBoarding[i].imageSrc}'),
                        SizedBox(height: height * 0.1,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * .2 ),
                          child:  Text(onBoarding[i].text ,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16 , fontFamily: kFamilyFontName ),),
                        ),
                      ],
                    ) ;

                  }))
               ,
              // To give this page some space between its components.
              SizedBox(height: height * .1,) ,
            Expanded(child: Column(
        children: [

         Dotes(numberOfIndex: numberOfIndex, dotesCount: 3),
          // To give this page some space between its components.
          SizedBox(height: height * 0.01,),
          // This button to control and to go to next on boarding.
          CustomButton(height: height , width:  width , pageController:  pageController , numberOfIndex: numberOfIndex,
          sharedPreferences: widget.sharedPreferences,)
      ],
    )
            ),
          ],
        ),
      ),
    );
  }
  }