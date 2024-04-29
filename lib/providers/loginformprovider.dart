import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formLogingKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool isLoading = false;

  bool isValidForm(){
    
    return formLogingKey.currentState?.validate()?? false;
  }

}