part of 'users_api_bloc.dart';

@immutable
abstract class UsersApiState extends Equatable {}

//data loading state
class UserLoadingState extends UsersApiState {
  @override
  List<Object?> get props => [];
}

//data loaded state

class UserLoadedState extends UsersApiState {
  final List<UserModel> users;
  UserLoadedState(this.users);

  @override
  List<Object?> get props => [users];
}

//data error state
class UserErrorState extends UsersApiState {
  final String error;
  UserErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
