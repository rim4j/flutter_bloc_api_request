part of 'users_api_bloc.dart';

abstract class UsersApiEvent extends Equatable {
  const UsersApiEvent();
}

class LoadUserEvent extends UsersApiEvent {
  @override
  List<Object?> get props => [];
}
