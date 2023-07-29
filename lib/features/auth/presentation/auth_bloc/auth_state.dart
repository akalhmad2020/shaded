part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SelectedId extends AuthState  {
  SelectedId({required this.yourId});
  final  int yourId ;
}

class NumberIsWrong extends AuthState  {
  NumberIsWrong({required this.autovalidateMode});
    AutovalidateMode autovalidateMode ;
}

class PhoneNumberIsReady extends AuthState {
  PhoneNumberIsReady({required this.phoneNumber});
  final String phoneNumber;
}

class HeCompleteOtpState extends AuthState {
  HeCompleteOtpState({ required this.otpCode});

  final String otpCode;
}

class HeIsStillWritingOtpState extends AuthState {
}

class HeStoppedWritingOtpState extends AuthState {

}

class PhoneNumberSent  extends AuthState {
  PhoneNumberSent({required this.phoneNumber});
  final String phoneNumber;
}