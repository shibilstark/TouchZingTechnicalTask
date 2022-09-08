import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:user_app/application/core/api.dart';
import 'package:user_app/domain/failures/main_failures.dart';
import 'package:user_app/domain/models/user_model.dart';

class UserServices {
  static final UserServices instance = UserServices._();
  factory UserServices() => instance;
  UserServices._();

  Future<Either<List<UserModel>, MainFailures>> getUsers() async {
    try {
      final Response response = await Dio(BaseOptions()).get(Api.user);

      if (response.statusCode == 200) {
        final data = (response.data['employees'] as List);
        final users = data.map((user) => UserModel.fromMap(user)).toList();
        log(users.toString());
        return Left(users);
      } else {
        log('Server Failure');
        return Right(MainFailures(type: FailureType.server));
      }
    } catch (e) {
      log(e.toString());
      return Right(MainFailures(type: FailureType.client));
    }
  }
}
