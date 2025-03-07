import 'package:flutter/material.dart';
import 'AuthLogIn/login_widget.dart';
import 'AuthSignIn/sigin_widget.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: theme.appBarTheme.backgroundColor,
            child: TabBar(
              labelColor: theme.appBarTheme.foregroundColor,
              tabs: [
                Tab(text: 'Login'),
                Tab(text: 'Registration'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                LoginWidget(),
                RegisterWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
