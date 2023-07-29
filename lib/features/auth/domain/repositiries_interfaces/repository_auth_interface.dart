import 'package:dartz/dartz.dart';
import 'package:shded/features/auth/domain/entity/person.dart';

abstract class AuthRepoInter{

  Future<bool> sendOtp (String otp);
  Future<bool> sendPhoneNumber (String phoneNumber);


}