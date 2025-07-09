import 'package:flutter/material.dart';

import '../custom_widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: LoginForm(
        userNameController: _usernameController,
        passwordController: _passwordController,
      ),
    );
  }
}
