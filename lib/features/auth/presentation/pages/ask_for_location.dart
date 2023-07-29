

import 'package:flutter/material.dart';
import 'package:shded/core/strings/app_strings.dart';

class AskForLocation extends StatelessWidget {
  const AskForLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 24),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const Text('Get Location') ,
                const SizedBox(height: 50,) ,
                Image.asset('${kSrcForAssetsImages}map.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
