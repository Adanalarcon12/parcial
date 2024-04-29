import 'package:controldegastosapp/providers/loginformprovider.dart';
import 'package:controldegastosapp/temas/apptemas.dart';
import 'package:controldegastosapp/widgets/background.dart';
import 'package:controldegastosapp/widgets/loginform.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primary,
        appBar: AppBar(
          
          backgroundColor: AppTheme.primary,
          centerTitle: true,
          toolbarHeight: 150,
          title: const Text('Bienvenido',
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
            ChangeNotifierProvider(
              create: (_) => LoginFormProvider(),
              child: loginForm(),
             ),
            
          ],
          )
        );
  }
}
