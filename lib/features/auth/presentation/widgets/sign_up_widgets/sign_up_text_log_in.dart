

import 'package:flutter/material.dart';

class TextLogIn extends StatelessWidget {
  const TextLogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  const [
        SizedBox(
            width: 70,
            child: Divider(height: 1, color: Color(0xffB3B3B380), thickness: 1,)) ,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Or Log In by' , style: TextStyle(color: Color(0xff505050) , fontSize: 11),),
        ) ,
        SizedBox(
            width: 70,
            child: Divider(height: 1, color: Color(0xffB3B3B380), thickness: 1,)) ,

      ],
    );
  }
}
