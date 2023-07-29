
import 'package:flutter/material.dart';

class EnterOtpAppBar extends StatelessWidget {
  const EnterOtpAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined))
      ],
    );
  }
}
