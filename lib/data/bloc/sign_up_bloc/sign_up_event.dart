part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpLoadedEvent extends SignUpEvent {
  final SignUpRequestModel signUpRequestModel;
  const SignUpLoadedEvent(this.signUpRequestModel);

  @override
  List<Object> get props => [signUpRequestModel];
}
