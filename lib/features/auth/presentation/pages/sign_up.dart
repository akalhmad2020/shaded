
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shded/features/auth/presentation/auth_bloc/auth_bloc.dart';


import '../widgets/sign_up_widgets/log_in_by_another_ways.dart';
import '../widgets/sign_up_widgets/sign_up_app_bar.dart';
import '../widgets/sign_up_widgets/sign_up_options.dart';
import '../widgets/sign_up_widgets/sign_up_phone_number_text_field.dart';
import '../widgets/sign_up_widgets/sign_up_send_otp_button.dart';
import '../widgets/sign_up_widgets/sign_up_text_log_in.dart';
import '../widgets/sign_up_widgets/sign_up_texts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController controller = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  CustomAppBar(width: width,height: height) ,
                  Texts(height: height) ,
                  SizedBox(height: height*0.04,) ,
                  BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if(state is NumberIsWrong){
                      return CustomTextField(controller: controller , autoValidateMode: state.autovalidateMode,);
                    }else{
                      return CustomTextField(controller: controller , autoValidateMode: autoValidateMode,);
                    }
                    },)                   ,
                  SizedBox(height: height*0.05,) ,
                  const Options(),
                  SizedBox(height: height*0.07,) ,
                  SendOtpButton(formKey: formKey,),
                  SizedBox(height: height*0.06,) ,
                  const TextLogIn(),
                  SizedBox(height: height*0.03,) ,
                  const LogInByAnotherWays() ,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

