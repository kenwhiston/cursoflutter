import 'package:flutter_application_login_getx/service/login_api.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  var loginProcess = false.obs;
  var error = "";

  final LoginRepository repository = LoginRepository();

  Future<String> login({required String userName, required String password}) async {
    error = "";
    try {
      
      var loginResp = await repository.login(
        userName, password,
      );
      if (loginResp) {
        //success
        loginProcess(true);
        error = "";
      } else {
        error = "error login failed";
      }
    } finally {
      loginProcess(false);
    }
    return error;
  }

}