import 'package:controldegastosapp/screens/history.dart';
import 'package:controldegastosapp/screens/home.dart';
import 'package:controldegastosapp/screens/login.dart';
import 'package:controldegastosapp/screens/profile.dart';
import 'package:controldegastosapp/screens/register.dart';
import 'package:controldegastosapp/temas/apptemas.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(
    
    MaterialApp(
      theme: ThemeData(
         colorScheme:  const ColorScheme(
          brightness: Brightness.light,
            error: AppTheme.error,
            onError: AppTheme.onError,
           primary: AppTheme.primary, 
           onPrimary: AppTheme.Onprimary,
           secondary: AppTheme.secondary, 
           onSecondary: AppTheme.Onsecondary, 
           background: AppTheme.background,
           onBackground: AppTheme.onBackground,
           surface: AppTheme.surface,
           onSurface: AppTheme.onSurface, 
           )
      ),
      
      themeMode: ThemeMode.light,
      home:Routes(),
      debugShowCheckedModeBanner: false,
    )
    
  );
}

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      initialRoute: 'login',
      routes: {
        'home' : (_) => HomeScreen(),
        'login' : (_) => LoginScreen(),
        'registrarse' : (_) => RegisterScreen(),
        'history' : (_) => HistoryScreen(),
        'profile' : (_) => ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,


    );
  }
}



