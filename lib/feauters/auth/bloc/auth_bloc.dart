import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gde_namaz/feauters/auth/repository/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryInterface _authRepositoryInterface;

  AuthBloc({
    required AuthRepositoryInterface authRepositoryInterface,
  })  : _authRepositoryInterface = authRepositoryInterface,
        super(LoadingState()) {
    on<AuthMeEvent>((event, emit) async {
      final result = await _authRepositoryInterface.authMe();
      result.fold(
        (l) => emit(NoUserState()),
        (r) => emit(SuccessState()),
      );
    });

    on<CreateUserEvent>((event, emit) async {
      final result = await _authRepositoryInterface.createUser();
      result.fold(
        (l) => emit(FailureState(message: l.message)),
        (r) => emit(UserCreatedState()),
      );
    });

    on<AuthByDeviceEvent>((event, emit) async {
      final result = await _authRepositoryInterface.authByDevice();
      result.fold(
        (l) => emit(FailureState(message: l.message)),
        (r) => emit(SuccessState()),
      );
    });
  }
}
