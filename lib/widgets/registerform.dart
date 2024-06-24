import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:controldegastosapp/temas/apptemas.dart';

class RegisterFormScreen extends StatefulWidget {
  @override
  State<RegisterFormScreen> createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        print("Usuario registrado: ${userCredential.user?.email}");
        Navigator.pushNamed(context, 'home');
      } on FirebaseAuthException catch (e) {
        print("Error de registro: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 5, bottom: 30),
        decoration: BoxDecorations.authBoxDecoration(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 80),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Juan Perez',
                    labelText: 'Nombre y Apellido',
                  ),
                  autofocus: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'correo@gmail.com',
                    labelText: 'Correo',
                  ),
                  validator: (value) {
                    String pattern = r'^[^@]+@[^@]+\.[^@]+';
                    RegExp regExp = RegExp(pattern);
                    if (value == null || !regExp.hasMatch(value)) {
                      return 'Ingrese un email válido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '+595 --- --- ---',
                    labelText: 'Número de teléfono',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '*******',
                    labelText: 'Contraseña',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '*******',
                    labelText: 'Confirmar contraseña',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                const Text(
                  'Al continuar aceptas los Términos y Condiciones',
                  style: TextStyle(fontSize: 13, color: AppTheme.secondary),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(AppTheme.primary),
                  ),
                  onPressed: _register,
                  child: const Text(
                    'Registrarme',
                    style: TextStyle(color: AppTheme.secondary),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: const Text(
                    'Ya tienes una cuenta',
                    style: TextStyle(
                      color: AppTheme.Onsecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
