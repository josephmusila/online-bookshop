import 'dart:convert';

import 'package:http/http.dart' as http;



class AuthService {
  final registrationUrl = Uri.parse("http://127.0.0.1:8000/registration/");
  final loginUrl = Uri.parse("http://127.0.0.1:8000/accounts/login/");

  Future<RegistrationResponse?> registration(
      String username, String password1, String password2, String email) async {
    var response = await http.post(registrationUrl, body: {
      "username": username,
      "password1": password1,
      "password2": password2,
      "email": email,
    });
    // print(response.body);
    return RegistrationResponse.fromJson(jsonDecode(response.body));
  }

  // Future<LoginResponse?> login(String usernameOrEmail, String password) async {
  //   var response = await http.post(loginUrl, body: {
  //     "username": usernameOrEmail,
  //     "password": password,
  //   });
  //   // print(response.body);
  //   return LoginResponse.fromJson(response.body);
  // }
  Future<http.Response> login(String username, String password) async {
    // var body = jsonEncode({'email': email, 'password': password});

    http.Response response = await http
        .post(loginUrl, body: {'username': username, 'password': password});
    // print(response);
    return response;
  }
}

class RegistrationResponse {
  List<dynamic>? non_field_errors;
  List<dynamic>? password1;
  List<dynamic>? username;
  List<dynamic>? email;
  dynamic? key;

  RegistrationResponse(
      {this.email,
      this.key,
      this.non_field_errors,
      this.password1,
      this.username});

  factory RegistrationResponse.fromJson(mapOfBody) {
    return RegistrationResponse(
        email: mapOfBody["email"],
        key: mapOfBody["key"],
        non_field_errors: mapOfBody["non_field_errors"],
        password1: mapOfBody["password1"],
        username: mapOfBody["username"]);
  }
}
