
import 'package:flutter/material.dart';

import '../../../../../core/strings/app_strings.dart';

class Texts extends StatelessWidget {
  const Texts({Key? key , required this.height }) : super(key: key);

  final double height ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height *0.05,) ,
          const Text(kWelcome , style: TextStyle(
              fontFamily: kFamilyFontName ,
              fontSize: 18 ,
              fontWeight: FontWeight.w500
          ),) ,
          SizedBox(height: height *0.04,) ,
          const Text(kEnterYourPhoneNumber , style: TextStyle(
              fontFamily: kFamilyFontName ,
              fontSize: 14 ,
              fontWeight: FontWeight.w500 ,
              color: Color(0xff686868)
          ),) ,
        ],
      ),
    );
  }
}
