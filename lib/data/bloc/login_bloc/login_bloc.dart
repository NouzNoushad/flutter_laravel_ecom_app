import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_app_bloc/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/login_request.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc({
    required this.authRepository,
  }) : super(LoginInitial()) {
    on<LoginLoadedEvent>(loginUser);
  }

  FutureOr<void> loginUser(
      LoginLoadedEvent event, Emitter<LoginState> emit) async {
    try {
      var result = await authRepository.loginUser(
          loginRequestModel: event.loginRequestModel);
      print('////////////// login: $result');
      emit(LoginLoadedState(result));
    } catch (error) {
      emit(LoginErrorState(error.toString()));
    }
  }
}
