import 'package:flutter/material.dart';
import 'package:controldegastosapp/temas/apptemas.dart';

class ProfileScreen extends StatefulWidget {
   
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primary,
        appBar: AppBar(
          backgroundColor: AppTheme.primary,
          centerTitle: true,
          toolbarHeight: 100,
          title: const Text('Perfil',
            style: TextStyle(
              color: AppTheme.Onsecondary,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              height: 80,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: const Stack(
          children: [
            Text('Perfil')
          ],
          ),
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
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
              Navigator.popAndPushNamed(context, 'history');
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