import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shded/core/app_theam.dart';
import 'package:shded/core/strings/app_strings.dart';
import 'package:shded/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:shded/features/auth/presentation/pages/enter_otp.dart';

class SendOtpButton extends StatefulWidget {
  const SendOtpButton({Key? key, required this.formKey })
      : super(key: key);
  final GlobalKey<FormState> formKey;

  @override
  State<SendOtpButton> createState() => _SendOtpButtonState();
}

class _SendOtpButtonState extends State<SendOtpButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.formKey.currentState!.validate()) {
          widget.formKey.currentState!.save();


          Navigator.pushNamed(context, kEnterOtp);
         //
         // BlocListener(listener: (BuildContext context, state) {
         //   print(state.runtimeType);
         //   print('ddddd');
         //   if(state is PhoneNumberSent){
         //
         //   }
         // },);
        } else {
          BlocProvider.of<AuthBloc>(context).add(
             IfNumberWasWrong(autoValidateMode: AutovalidateMode.always));
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(5)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: const Center(
          child: Text(kSendOtp, style: TextStyle(color: Colors.white,
              fontFamily: kFamilyFontName,
              fontWeight: FontWeight.w500,
              fontSize: 18),),
        ),
      ),
    );
  }
}
