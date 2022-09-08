// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_app/application/service/user.dart';
import 'package:user_app/domain/failures/main_failures.dart';
import 'package:user_app/domain/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final UserServices userServices = UserServices();

  Future<void> getAllUsers() async {
    emit(UserLoading());
    await userServices.getUsers().then((result) {
      result.fold((users) {
        emit(UserSuccess(users));
      }, (faiure) {
        emit(UserError(faiure));
      });
    });
  }
}
