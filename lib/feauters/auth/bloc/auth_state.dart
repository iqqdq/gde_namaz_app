part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class LoadingState extends AuthState {}

final class NoUserState extends AuthState {}

final class UserCreatedState extends AuthState {}

final class SuccessState extends AuthState {}

final class FailureState extends AuthState {
  const FailureState({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
