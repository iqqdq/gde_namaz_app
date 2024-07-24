import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gde_namaz/feauters/auth/auth.dart';
import 'package:gde_namaz/router/router.dart';
import 'package:gde_namaz/ui/ui.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<AuthBloc>(context).add(const AuthMeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is NoUserState) {
          BlocProvider.of<AuthBloc>(context).add(const CreateUserEvent());
        }

        if (state is UserCreatedState) {
          BlocProvider.of<AuthBloc>(context).add(const AuthByDeviceEvent());
        }

        if (state is SuccessState) {
          context.router.push(const MapRoute());
        }

        if (state is FailureState) {
          Toast().show(
            context: context,
            isFailure: true,
            message: state.message,
          );
        }
      },
      child: Scaffold(
        body: SizedBox.expand(
          child: SafeArea(
            child: Stack(children: [
              /// LOGO
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/img_logo.png',
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.fitWidth,
                ),
              ),

              /// INDICATOR
              const Align(
                alignment: Alignment.bottomCenter,
                child: BottomPadding(
                  child: LoadingIndicator(),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
