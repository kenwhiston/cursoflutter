import 'package:flutter/material.dart';
import 'package:flutter_application_pattern_bloc_login/service/login_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/login_bloc.dart';
import 'ui/login_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final LoginRepository _loginRepository = LoginRepository();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => LoginBloc(loginRepository: _loginRepository),
        child: LoginScreen(),
      ),
    );
  }
}
