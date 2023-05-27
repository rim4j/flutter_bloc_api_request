import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_api_request/models/user_model.dart';
import 'package:flutter_bloc_api_request/repository/repositories.dart';

part 'users_api_event.dart';
part 'users_api_state.dart';

class UsersApiBloc extends Bloc<UsersApiEvent, UsersApiState> {
  final UserRepository _userRepository;
  UsersApiBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
