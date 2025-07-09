import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepository {
  final String _baseUrl = 'http://demo5587976.mockable.io/login';

  Future<bool> login(String userName, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'userName': userName, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Assuming the API returns a JSON object with a 'success' field
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data.values.first;
      } else {
        return false;
      }
    } catch (e) {
      print('Login failed: $e');
      return false;
    }
  }
}
