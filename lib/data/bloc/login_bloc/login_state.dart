part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginLoadedState extends LoginState {
  final String result;
  const LoginLoadedState(this.result);

  @override
  List<Object> get props => [result];
}

class LoginErrorState extends LoginState {
  final String error;
  const LoginErrorState(this.error);

  @override
  List<Object> get props => [error];
}
