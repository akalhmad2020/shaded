
import 'package:dartz/dartz.dart';
import 'package:shded/features/auth/data/models/person_model.dart';

abstract class RemoteAuthInterface {
  Future<Unit> sendOtp (PersonModel personModel);
}