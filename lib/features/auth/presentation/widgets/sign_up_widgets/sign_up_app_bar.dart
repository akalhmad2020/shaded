

import 'package:flutter/material.dart';

import '../../../../../core/strings/app_strings.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key , required this.width , required this.height}) : super(key: key);
  final double height ;
  final double width ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:   [
      const  Icon(Icons.arrow_back_ios_new_sharp) ,
        SizedBox(width: width * 0.22,),
      const  Text(kCreateAnAccount  , style: TextStyle(
        fontFamily: kFamilyFontName ,
        fontSize: 18 ,
        fontWeight: FontWeight.w500
      ),),
      ],
    );
  }
}
