import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:controldegastosapp/providers/loginformprovider.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);

    return Form(
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
            CircularProgressIndicator(),
          if (!loginFormProvider.isLoading)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
                if (!loginFormProvider.isValidForm()) return;

                loginFormProvider.isLoading = true;

                await attemptSignInWithRetry(
                  email: loginFormProvider.email,
                  password: loginFormProvider.password,
                  onError: (message) {
                    print("Error de autenticación: $message");
                  },
                  onSuccess: (userCredential) {
                    print("Usuario autenticado: ${userCredential.user?.email}");
                    Navigator.pushReplacementNamed(context, 'home');
                  },
                );

                loginFormProvider.isLoading = false;
              },
              child: Text('Login'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Future<void> attemptSignInWithRetry({
    required String email,
    required String password,
    required Function(String message) onError,
    required Function(UserCredential userCredential) onSuccess,
    int maxAttempts = 5,
  }) async {
    int attempt = 0;
    int delay = 1;

    while (attempt < maxAttempts) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        onSuccess(userCredential);
        return;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'too-many-requests') {
          attempt++;
          if (attempt >= maxAttempts) {
            onError('Demasiados intentos fallidos. Inténtelo de nuevo más tarde.');
            return;
          }
          await Future.delayed(Duration(seconds: delay));
          delay *= 2; // Incrementa el retraso exponencialmente
        } else {
          onError(e.message ?? 'Error desconocido');
          return;
        }
      }
    }
  }
}
