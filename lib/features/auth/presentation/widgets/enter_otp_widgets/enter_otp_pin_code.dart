
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shded/features/auth/presentation/auth_bloc/auth_bloc.dart';

class PinCode extends StatelessWidget {
  const PinCode({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
        appContext: context,
        length: 6,
        onCompleted: (String text){
            BlocProvider.of<AuthBloc>(context).add(HeCompleteOtp( otpCode: text));
        },
        onChanged: (String text){
          if(text.isEmpty){
            BlocProvider.of<AuthBloc>(context).add(HeStoppedWritingOtp());
          } else  {
            BlocProvider.of<AuthBloc>(context).add(HeIsStillWritingOtp());
          }
        },
    obscureText: false,
    animationType: AnimationType.scale,
    animationCurve: Curves.linear,
    animationDuration: const Duration(milliseconds: 200),
    cursorColor: const Color(0xffFFC529),
    keyboardType: TextInputType.number,
    textStyle: const TextStyle(color:  Color(0xffFFC529)),
    pinTheme: PinTheme(
    activeColor: const Color(0xffEEEEEE) ,
    inactiveColor:  const Color(0xffEEEEEE) ,
    selectedColor:  const Color(0xffFFC529),
    fieldHeight: 50,
    fieldWidth: 50,
    shape: PinCodeFieldShape.box,
    borderRadius:  BorderRadius.circular(5) ,
    borderWidth: 1

    ) );
  }
}
