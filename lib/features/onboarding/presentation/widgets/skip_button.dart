
import 'package:flutter/material.dart';

import '../../../../core/strings/app_strings.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key , required this.pageController}) : super(key: key);
  final PageController pageController ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        InkWell(
            onTap: (){
              pageController.animateToPage(2 , duration: const Duration(milliseconds: 700), curve: Curves.easeIn);
            },
            child: const Text(kOnBoardingButtonSkip )),
      ],
    );
  }
}
