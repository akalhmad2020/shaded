part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}


class SelectYourId extends AuthEvent {
  SelectYourId({required this.yourId});
  final int yourId ;
}

class IfNumberWasWrong extends AuthEvent{
  IfNumberWasWrong({required this.autoValidateMode});
  AutovalidateMode autoValidateMode ;
}

class HeFinishWritingPhoneNumber extends AuthEvent{
  HeFinishWritingPhoneNumber({required this.phoneNumber});
  final String phoneNumber;
}

class HeCompleteOtp extends AuthEvent{
  HeCompleteOtp({ required this.otpCode });
final String otpCode;
}


class HeIsStillWritingOtp extends AuthEvent{

}



class HeStoppedWritingOtp extends AuthEvent{

}

class SendPhoneNumber extends AuthEvent{
   SendPhoneNumber({required this.phoneNumber});
  final String phoneNumber ;
}
