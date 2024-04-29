import 'package:flutter/material.dart';
import 'package:controldegastosapp/temas/apptemas.dart';

class Headerhome extends StatefulWidget {
  const Headerhome({super.key});

  @override
  State<Headerhome> createState() => _HeaderhomeState();
}

class _HeaderhomeState extends State<Headerhome> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                     Text('Balance total',
                      style: TextStyle(
                        fontSize: 17,
                        color: AppTheme.secondary,
                      ), 
                     ),
                     Text('50.000 Gs',
                      style: TextStyle(
                        fontSize: 25,
                        color: AppTheme.background,
                      ), 
                     ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                     Text('Gasto Total',
                      style: TextStyle(
                        fontSize: 17,
                        color: AppTheme.secondary,
                      ), 
                     ),
                     Text('20.000 Gs',
                      style: TextStyle(
                        fontSize: 25,
                        color: AppTheme.error,
                      ), 
                     ),
                  ],
                ),
              ),
              
            ],
          ),
    );
}
}
