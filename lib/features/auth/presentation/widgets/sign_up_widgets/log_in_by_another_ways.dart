import 'package:flutter/material.dart';

class LogInByAnotherWays extends StatelessWidget {
  const LogInByAnotherWays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 35,
            height: 35,
            child: Image.asset('assets/images/google.png' ,)) ,
        SizedBox(width: 20,) ,
        SizedBox(
            width: 35,
            height: 35,
            child: Image.asset('assets/images/facebook.png' ,)) ,
      ],
    );
  }
}
