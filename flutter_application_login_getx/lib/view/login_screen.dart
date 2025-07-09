import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                labelText: 'userName',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              enabled: !controller.loginProcess.value,
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String error = await controller.login(
                  userName: userNameController.text,
                  password: passwordController.text,
                );
                if (error != "") {
                  Get.defaultDialog(title: "Login Failed!", middleText: error);
                } else {
                  //Get.to(HomePage());
                  Get.defaultDialog(title: "Login Sucess!", middleText: error);
                }
              },
              child: Text('Login'),
            ),
          ],
        );
      }),
    ),
    );
    
    
  }
}
