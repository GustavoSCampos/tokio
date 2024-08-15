import 'package:firebase_auth/firebase_auth.dart';
import 'package:tokio_test/util/notifications.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

getUserDisplayName() {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return user.displayName;
  }
}

getUserId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("user_id");
}

Future<void> signInWithCpfAndPassword(
    String _cpf, String _password, BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String cpf = _cpf.trim();
  String password = _password.trim();
  String email = "$cpf@tokio.com";

  print("Attempting to sign in with email: $email and password: $password");

  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    await prefs.setString('user_id', userCredential.user!.uid);
    sucessNotification('Logado com sucesso!', context);
    Navigator.pushNamed(context, '/dashboard');
  } catch (e) {
    errorNotification('Erro ao realizar login!', context);
    print("Erro na autenticação: $e");
  }
}

Future<void> registerWithCpfAndPassword(_cpf, _password, name, context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String cpf = _cpf.trim();
  String password = _password.trim();
  String email = "$cpf@example.com";

  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await prefs.setString('user_id', userCredential.user!.uid);
    User? user = userCredential.user;
    if (user != null) {
      await user.updateProfile(displayName: name);
      await user.reload();
    }
    sucessNotification('Cadastrado com sucesso!', context);
    Navigator.pushNamed(context, '/dashboard');
  } catch (e) {
    errorNotification('Erro ao se cadastrar!', context);
    print("Erro no registro: $e");
  }
}
