import 'package:controldegastosapp/widgets/headerhome.dart';
import 'package:controldegastosapp/widgets/homedata.dart';
import 'package:flutter/material.dart';
import 'package:controldegastosapp/temas/apptemas.dart';
import 'package:controldegastosapp/widgets/background.dart';


class HomeScreen extends StatefulWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primary,
        appBar: AppBar(
          backgroundColor: AppTheme.primary,
          centerTitle: true,
          toolbarHeight: 30,
          title: const Text('Bienvenido',
            style: TextStyle(
              color: AppTheme.Onsecondary,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              height: 40,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: const Stack(
          children: [
            
            
            HomeDataScreen() 
          ],
          ),
        bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.elevator),
            label: 'Grafico',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Cuenta',
          ),
        ],
        currentIndex: _selectedIndex,
        
        selectedItemColor: AppTheme.primary,
        onTap: (int index){
          switch (index){
            case 0:
              Navigator.popAndPushNamed(context, 'home');
            case 1:
              Navigator.popAndPushNamed(context, 'Grafico');
            case 2:
              Navigator.popAndPushNamed(context, 'profile');
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
        
        );
  }
}