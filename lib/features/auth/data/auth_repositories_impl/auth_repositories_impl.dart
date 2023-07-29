

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shded/features/auth/data/remote_auth/remote_auth_interface.dart';
import 'package:shded/features/auth/domain/entity/person.dart';
import 'package:shded/features/auth/domain/repositiries_interfaces/repository_auth_interface.dart';

class AuthRepositoriesImpl implements AuthRepoInter {

 late String verificationId ;

  @override
  Future<bool> sendOtp(String otp) async{

    PhoneAuthCredential phoneAuthCredential =
    PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otp);
    await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);

   return  Future.value(true);

  }

  @override
  Future<bool> sendPhoneNumber(String phoneNumber) async {
    print(phoneNumber + 'ssqqqq');
    await  FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async{

          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException f){
          print(f.message);
        },
        codeSent: (String verificationId , int? idToken) {
          print('ahmed1');
          this.verificationId = verificationId ;
          print('ahmed');
        },
        timeout: const Duration(seconds: 40),
        codeAutoRetrievalTimeout: (String auto){});

    return Future(() => true) ;
  }

}