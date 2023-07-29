import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:shded/features/auth/domain/repositiries_interfaces/repository_auth_interface.dart';
import '../entity/person.dart';
class SendOtpUseCase {

  SendOtpUseCase({required this.authRepoInter});
  final AuthRepoInter authRepoInter ;
  Future<bool> sendOtpUseCase ({required String otp})async{
    return authRepoInter.sendOtp(otp);
  }
}