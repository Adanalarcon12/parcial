import 'package:controldegastosapp/providers/loginformprovider.dart';
import 'package:controldegastosapp/temas/apptemas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class loginForm extends StatefulWidget {
  loginForm({super.key});

  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      
      padding: EdgeInsets.only(
        top: 20,
        bottom: 30
      ),
      
      decoration:  BoxDecorations.authBoxDecoration(),
        
      child: SingleChildScrollView(
        
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 80),
        child: 
          Form(
            //validacion al cambiar
           // autovalidateMode: AutovalidateMode.onUserInteraction,
            key: loginForm.formLogingKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'nombre@gmail.com',
                    labelText: 'Correo',
                    suffixIcon: Icons.alternate_email_outlined
                  ),
                  autofocus: true,
                  onTapOutside: (value) => loginForm.email  ,
                  keyboardType: TextInputType.emailAddress,
                  validator: ( String ? value ) {
                    //expresion regura para correos
                    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp  = new RegExp(pattern);

                    return regExp.hasMatch(value ?? '')
                      ?null
                      :'Ingrese un correo valido'
                    ;
                  },
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '*****',
                    labelText: 'Contraseña',
                    suffixIcon: Icons.password
                  ),
                  keyboardType: TextInputType.number,
                  onTapOutside: (value) => loginForm.password  ,
                  obscureText: true,
                  validator: ( String ? value ) {
                    //expresion regura para correos
                    return (value!= null && value.length >=6 )
                        ? null
                        : 'La contraseña debe de ser de 6 caracteres';
                    
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(AppTheme.primary)
                                
                    ),
                    onPressed: () {
                      if(!loginForm.isValidForm()) return;
                      else {
                        Navigator.pushReplacementNamed(context, 'home');
                      }
                    },
                    child: Text('Iniciar Sesión',
                      style:TextStyle(
                        color: AppTheme.secondary
                      ),)
                ),
                SizedBox(height: 5,),
                TextButton(
                  onPressed: ()=>{Navigator.pushNamed(context, 'recuperarsenha')},
                  child: Text('Olvidaste la contraseña?',
                      style: TextStyle(
                        color: AppTheme.Onsecondary,
                        fontSize: 12,
                        
                      ),
                      
                    )
                  ),
                SizedBox(height: 5,),
                  TextButton(
                    style:  ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(AppTheme.onBackground), 
                      padding: MaterialStatePropertyAll(EdgeInsets.all(10)),         
                    ),
                    
                    onPressed: () {
                        Navigator.pushNamed(context, 'registrarse');
                    },
                    child: Text('Registrarse',
                      style:
                        TextStyle(
                          color: AppTheme.secondary
                          
                        ),
                        
                      )
                ),
                 SizedBox(height: 200,),
                
              ],
              
              
            )
          )
          
      
      ),
    );
  }
}
