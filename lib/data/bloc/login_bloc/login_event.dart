part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginLoadedEvent extends LoginEvent {
  final LoginRequestModel loginRequestModel;
  const LoginLoadedEvent(this.loginRequestModel);

  @override
  List<Object> get props => [loginRequestModel];
}
