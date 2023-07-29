import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shded/core/app_theam.dart';
import 'package:shded/features/auth/data/auth_repositories_impl/auth_repositories_impl.dart';
import 'package:shded/features/auth/domain/entity/person.dart';
import 'package:shded/features/auth/presentation/pages/ask_for_location.dart';
import '../../../../../core/strings/app_strings.dart';
import '../../../domain/use_cases/send_otp.dart';
import '../../auth_bloc/auth_bloc.dart';

class VerificationButton extends StatelessWidget {
    VerificationButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state){
        if(state is HeCompleteOtpState){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const AskForLocation()));
        }
      },
      builder: (context, state) {
        if(state is HeCompleteOtpState){
          return _buildContainer( primaryColor, kItIsVerifiedButton , true);
        }
        else if(state is HeStoppedWritingOtpState){
          return _buildContainer(const Color(0xffC4C4C4), kVerificationButton , false);
        } else if (state is HeIsStillWritingOtpState){
          return _buildContainer( primaryColor, kItIsVerifiedButton , true);
        }
        return _buildContainer(const Color(0xffC4C4C4), kVerificationButton , false);

      },
    );
  }

  Container _buildContainer(Color color , String text , bool isWriting){
   return Container(
      height: 50,
      decoration: BoxDecoration(
          color:  color,
          borderRadius: BorderRadius.circular(5)
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text, style: const TextStyle(color: Colors.white,
              fontFamily: kFamilyFontName,
              fontWeight: FontWeight.w500,
              fontSize: 18),),
           const SizedBox(width: 20,),

          isWriting ? Image.asset('${kSrcForAssetsImages}loading.png')
              : const SizedBox()
        ],
      ),
    );
  }
}
