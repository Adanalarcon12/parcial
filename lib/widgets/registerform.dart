import 'package:controldegastosapp/temas/apptemas.dart';
import 'package:flutter/material.dart';

class RegisterFormScreen extends StatefulWidget {
   
  //const RegisterFormScreen({Key? key}) : super(key: key);

  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
  
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.only(
        top: 5,
        bottom: 30
      ),
      
      decoration:  BoxDecorations.authBoxDecoration(),
      child: SingleChildScrollView(
        
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 80),
        child: 
          Form(
            
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Juan Perez',
                    labelText: 'Nombre y Apellido'
                  ),
                  autofocus: true,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'correo@gmail.com',
                    labelText: 'Correo'
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '+595 --- --- ---',
                    labelText: 'Numero de telefono'
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '*******',
                    labelText: 'Contraseña'
                  ),
                ),
                
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '*******',
                    labelText: 'Confirmar contraseña'
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Al continuar aceptas los Terminos y Condiciones',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.secondary
                  ),),

                SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(AppTheme.primary)          
                    ),

                    onPressed: () {
                        Navigator.pushNamed(context, 'home');
                    },
                    child: Text('Registrarme',
                      style:TextStyle(
                        color: AppTheme.secondary
                      ),)
                ),
                
                TextButton(
                  onPressed: ()=>{Navigator.pushNamed(context, 'login')},
                  child: Text('Ya tienes una cuenta',
                      style: TextStyle(
                        color: AppTheme.Onsecondary,
                        fontSize: 12,
                      ),
                    )
                  ),

                  
                 SizedBox(height: 80,),
                
              ],
              
              
            )
          )
          
      
      ),
    );
  }
  
}