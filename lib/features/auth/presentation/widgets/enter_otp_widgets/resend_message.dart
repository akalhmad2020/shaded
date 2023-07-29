
import 'package:flutter/material.dart';
import 'package:shded/core/strings/app_strings.dart';

class ResendMessage extends StatelessWidget {
  const ResendMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){

      },
      child: RichText(
          text: const TextSpan(
              text: "Didn't receive any message?" , style:
          TextStyle(color: Color(0xff2D3748) ,fontFamily: kFamilyFontName ,
          fontWeight: FontWeight.w500 , fontSize: 12),
          children: [
            TextSpan(text: '  ') ,
            TextSpan(text: 'Resend Message' , style:
            TextStyle(color: Color(0xffFD9C14) ,  )) ,
          ]
      )),
    );
  }
}
