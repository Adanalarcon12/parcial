import 'package:controldegastosapp/temas/apptemas.dart';
import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
   
  const BackgroundScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        bottom: 30
      ),
      
      decoration:  BoxDecorations.authBoxDecoration(),
      
    );
  }
}