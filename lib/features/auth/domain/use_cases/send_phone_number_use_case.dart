

import 'package:dartz/dartz.dart';

import '../repositiries_interfaces/repository_auth_interface.dart';

class SendPhoneNumberUseCase {

  SendPhoneNumberUseCase({required this.authRepoInter});
  final AuthRepoInter authRepoInter ;
  Future<bool> sendPhoneNumber ({required String phoneNumber})async{
    return authRepoInter.sendPhoneNumber(phoneNumber);
  }


}