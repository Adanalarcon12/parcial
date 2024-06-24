import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:controldegastosapp/providers/loginformprovider.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: _RegisterForm(),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: loginFormProvider.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              onChanged: (value) => loginFormProvider.email = value,
              validator: (value) {
                String pattern = r'^[^@]+@[^@]+\.[^@]+';
                RegExp regExp = RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ingrese un email válido';
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              onChanged: (value) => loginFormProvider.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe tener al menos 6 caracteres';
              },
            ),
            const SizedBox(height: 20),
            if (loginFormProvider.isLoading)
              const CircularProgressIndicator(),
            if (!loginFormProvider.isLoading)
              ElevatedButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (!loginFormProvider.isValidForm()) return;

                  loginFormProvider.isLoading = true;
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: loginFormProvider.email,
                      password: loginFormProvider.password,
                    );
                    print("Usuario registrado: ${userCredential.user?.email}");
                    loginFormProvider.isLoading = false;
                  } on FirebaseAuthException catch (e) {
                    print("Error de registro: $e");
                    loginFormProvider.isLoading = false;
                  }
                },
                child: Text('Registrar'),
              ),
          ],
        ),
      ),
    );
  }
}