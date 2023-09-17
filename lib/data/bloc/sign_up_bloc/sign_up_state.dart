part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

class SignUpLoadedState extends SignUpState {
  final String result;
  const SignUpLoadedState(this.result);

  @override
  List<Object> get props => [result];
}

class SignUpErrorState extends SignUpState {
  final String error;
  const SignUpErrorState(this.error);

  @override
  List<Object> get props => [error];
}
