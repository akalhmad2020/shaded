
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shded/core/app_theam.dart';
import 'package:shded/features/auth/presentation/auth_bloc/auth_bloc.dart';


import '../../../../../core/strings/app_strings.dart';

class CustomTextField extends StatefulWidget {
   CustomTextField({Key? key , required this.autoValidateMode , required this.controller}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
  final TextEditingController controller ;
  AutovalidateMode autoValidateMode ;
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          controller: widget.controller,
          autovalidateMode: widget.autoValidateMode,
          validator: (v){
            if(v?.isEmpty ?? true){
              return kTitleCantBeEmpty;
            }else if (v!.length != 13){
              return 'You do not have 13 digits';
            }else if (!v!.startsWith('+')){
              return 'You do not have + ';
            }
          },
          onSaved: (String? text){
            BlocProvider.of<AuthBloc>(context).add(SendPhoneNumber(phoneNumber: text!));
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone_android_rounded) ,
        hintText: kTestPhoneNumber,
        focusColor: primaryColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor  ),
          borderRadius: BorderRadius.circular(7) ,
        ),
          ),
        ),
      ),
    );
  }
}
