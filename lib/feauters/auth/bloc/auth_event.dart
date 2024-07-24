part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

final class AuthMeEvent extends AuthEvent {
  const AuthMeEvent();

  @override
  List<Object> get props => [];
}

final class CreateUserEvent extends AuthEvent {
  const CreateUserEvent();

  @override
  List<Object> get props => [];
}

final class AuthByDeviceEvent extends AuthEvent {
  const AuthByDeviceEvent();

  @override
  List<Object> get props => [];
}
