import 'package:controldegastosapp/widgets/background.dart';
import 'package:controldegastosapp/widgets/registerform.dart';
import 'package:flutter/material.dart';
import 'package:controldegastosapp/temas/apptemas.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primary,
        appBar: AppBar(
          
          backgroundColor: AppTheme.primary,
          centerTitle: true,
          toolbarHeight: 150,
          title: const Text(
            'Registrarse',
            style: TextStyle(
              color: AppTheme.Onsecondary,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              height: 5.2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Stack(
          children: [
            BackgroundScreen(),
            RegisterFormScreen()
          ],
        ));
  }
}
