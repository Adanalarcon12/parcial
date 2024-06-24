import 'package:controldegastosapp/temas/apptemas.dart';
import 'package:flutter/material.dart';

class DailyTabScreen extends StatelessWidget {
   
  const DailyTabScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:  BoxDecorations.authBoxDecoration(),

          child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                top: 10
              ),
              
                child: Column(  
                  children: [
                      
                  ],
                )
            ),
    );
  }
}