part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<UserModel> users;

  const UserSuccess(this.users);
}

class UserError extends UserState {
  final MainFailures failures;
  const UserError(this.failures);
}
