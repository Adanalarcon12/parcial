import 'package:controldegastosapp/screens/Grafico.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:controldegastosapp/screens/egresos.dart';
import 'package:controldegastosapp/screens/history.dart';
import 'package:controldegastosapp/screens/home.dart';
import 'package:controldegastosapp/screens/ingrsos.dart';
import 'package:controldegastosapp/screens/login.dart';
import 'package:controldegastosapp/screens/profile.dart';
import 'package:controldegastosapp/screens/register.dart';
import 'package:controldegastosapp/temas/apptemas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme(
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
        ),
      ),
      themeMode: ThemeMode.light,
      home: const Routes(),
      debugShowCheckedModeBanner: false,
    );
  }
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
        'home': (_) => const HomeScreen(),
        'login': (_) => const LoginScreen(),
        'registrarse': (_) => RegisterScreen(),
        'history': (_) => const HistoryScreen(),
        'profile': (_) => const ProfileScreen(),
        'egresos': (_) => ExpensePage(),
        'ingrsos': (_) => IncomePage(),
        'Grafico': (_) => EgresosChartScreen() ,
      },
      debugShowCheckedModeBanner: false,
    );
  }
}