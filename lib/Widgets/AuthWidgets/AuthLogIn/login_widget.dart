import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Bloc|Cubit/AuthCubit/auth_cubit.dart';
import '../animated_logo_widget.dart';

class LoginWidget extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(  // Usa il widget Center per centrare il contenuto
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra il contenuto verticalmente
          crossAxisAlignment: CrossAxisAlignment.center, // Centra il contenuto orizzontalmente
          children: [
            const AnimatedLogoWidget(),
            SizedBox(height: 10),
            // Email Field with shadow and icon
            TextFormField(
              controller: emailController,
              style: TextStyle(color: theme.appBarTheme.foregroundColor),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail, color: theme.iconTheme.color), // Icona della chiave di violino (qui una mail)
                labelText: 'Email',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(color: theme.appBarTheme.foregroundColor, fontSize: theme.textTheme.labelLarge?.fontSize),
                filled: true,
                fillColor: Colors.blueGrey,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.primaryColor, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              ),
            ),
            SizedBox(height: 20),
            // Password Field with shadow and icon
            TextFormField(
              controller: passwordController,
              style: TextStyle(color: theme.appBarTheme.foregroundColor),
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: theme.iconTheme.color), // Icona della chiave (lock)
                labelText: 'Password',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(color: theme.appBarTheme.foregroundColor, fontSize: theme.textTheme.labelLarge?.fontSize),
                filled: true,
                fillColor: Colors.blueGrey,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.primaryColor, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5), width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().login(
                  emailController.text,
                  passwordController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
