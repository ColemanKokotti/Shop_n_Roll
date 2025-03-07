import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc|Cubit/AuthCubit/auth_cubit.dart';
import '../Bloc|Cubit/AuthCubit/auth_state.dart';
import '../FireBase/auth_service.dart';
import '../Widgets/AuthWidgets/auth_form_widget.dart';
import '../Widgets/AuthWidgets/error_dialog_widget.dart';
import 'list_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => AuthCubit(AuthService(FirebaseAuth.instance)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Authentication', style: TextStyle(color: theme.appBarTheme.foregroundColor)),
          backgroundColor: theme.appBarTheme.backgroundColor,
        ),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ListScreen()),
              );
            }

            if (state is AuthErrorDialogState) {
              showErrorDialog(context, state.message);
            }
          },
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is AuthAuthenticated) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome, ${state.user.email}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      // Logout button removed
                    ],
                  ),
                );
              } else {
                return AuthForm(); // This is where we include the AuthForm
              }
            },
          ),
        ),
      ),
    );
  }
}