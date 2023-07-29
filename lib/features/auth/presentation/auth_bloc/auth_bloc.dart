import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shded/features/auth/data/auth_repositories_impl/auth_repositories_impl.dart';
import 'package:shded/features/auth/domain/use_cases/send_phone_number_use_case.dart';

import '../../domain/use_cases/send_otp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SendPhoneNumberUseCase sendPhoneNumberUseCase = SendPhoneNumberUseCase(authRepoInter: AuthRepositoriesImpl());
  SendOtpUseCase sendOtpUseCase = SendOtpUseCase(authRepoInter: AuthRepositoriesImpl());
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      if(event is SelectYourId){
        emit(SelectedId(yourId: event.yourId));
      }else if (event is IfNumberWasWrong){
        emit(NumberIsWrong(autovalidateMode: event.autoValidateMode));
      } else if (event is HeFinishWritingPhoneNumber){
        emit(PhoneNumberIsReady(phoneNumber: event.phoneNumber));
      } else if(event is HeCompleteOtp){
        sendOtpUseCase.sendOtpUseCase(otp: event.otpCode);
        emit(HeCompleteOtpState( otpCode: event.otpCode));
      }else if(event is HeStoppedWritingOtp){
        emit(HeStoppedWritingOtpState());
      }else if(event is HeIsStillWritingOtp){
        emit(HeIsStillWritingOtpState());
      } else if (event is SendPhoneNumber){
        sendPhoneNumberUseCase.sendPhoneNumber(phoneNumber: event.phoneNumber);
        emit(PhoneNumberSent(phoneNumber: event.phoneNumber));
      }

    });
  }
}
