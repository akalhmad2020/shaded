
import 'package:flutter/material.dart';

import '../../../../core/app_theam.dart';

class Dotes extends StatelessWidget {
  const Dotes({Key? key , required this.numberOfIndex , required this.dotesCount}) : super(key: key);
  final int numberOfIndex ;
  final int dotesCount ;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(dotesCount, (index) => AnimatedContainer(
          margin: const EdgeInsets.only(right: 7),
          decoration:   BoxDecoration(
              color: numberOfIndex == index ? primaryColor : Colors.grey ,
              borderRadius: BorderRadius.circular(10)
          ),
          duration: const Duration(milliseconds: 500) ,
          height: 6 , width:  numberOfIndex == index ? 20 : 6 ,)) ,
      ],
    );
  }
}
