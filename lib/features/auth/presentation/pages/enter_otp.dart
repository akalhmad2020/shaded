import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shded/features/auth/presentation/widgets/enter_otp_widgets/enter_otp_app_bar.dart';
import 'package:shded/features/auth/presentation/widgets/enter_otp_widgets/enter_otp_pin_code.dart';
import 'package:shded/features/auth/presentation/widgets/enter_otp_widgets/enter_otp_texts.dart';
import 'package:shded/features/auth/presentation/widgets/enter_otp_widgets/enter_otp_verification_button.dart';
import 'package:shded/features/auth/presentation/widgets/enter_otp_widgets/resend_message.dart';

import '../../../../core/strings/app_strings.dart';

class EnterOtp extends StatefulWidget {
  const EnterOtp({Key? key }) : super(key: key);

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}



class _EnterOtpState extends State<EnterOtp> {

  late String phoneNumber ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const EnterOtpAppBar(),
              const SizedBox(height: 35,),
              Image.asset('${kSrcForAssetsImages}sms.png'),
              const SizedBox(height: 35,),
              EnterOtpTexts(),
              const SizedBox(height: 35,),
              const PinCode(),
              const SizedBox(height: 15,),
              const ResendMessage(),
              const SizedBox(height: 55,),
              VerificationButton()

            ],
          ),
        ),
      ),
    );
  }


}
