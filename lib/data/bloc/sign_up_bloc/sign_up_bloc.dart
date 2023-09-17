import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_app_bloc/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/sign_up_request.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepository;
  SignUpBloc({
    required this.authRepository,
  }) : super(SignUpInitial()) {
    on<SignUpLoadedEvent>(signUpUser);
  }

  FutureOr<void> signUpUser(
      SignUpLoadedEvent event, Emitter<SignUpState> emit) async {
    try {
      var result = await authRepository.signUpUser(
          signUpRequestModel: event.signUpRequestModel);
      emit(SignUpLoadedState(result));
    } catch (error) {
      emit(SignUpErrorState(error.toString()));
    }
  }
}
