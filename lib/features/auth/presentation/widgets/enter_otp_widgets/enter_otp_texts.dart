import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/strings/app_strings.dart';
import '../../auth_bloc/auth_bloc.dart';

class EnterOtpTexts extends StatelessWidget {
    EnterOtpTexts({Key? key   }) : super(key: key);

  String? phoneNumber ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(kEnterValidationCode, style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.w500, fontFamily: kFamilyFontName),),
        const SizedBox(height: 15,),
        _buildText(kEnterValidationCodeThatSentTo),
        const SizedBox(height: 8,),
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if(state is PhoneNumberSent){
              phoneNumber = state.phoneNumber ;
              return _buildText(state.phoneNumber);
            } else {
              return _buildText(phoneNumber??'');
            }
          },
        ),
      ],
    );
  }

  Text _buildText(String text) {
    return Text(
      text, style: const TextStyle(fontSize: 14, color: Color(0xffA2A0A8),
      fontWeight: FontWeight.w400, fontFamily: kFamilyFontName,),);
  }
}
