import 'dart:convert';

import 'package:http/http.dart' as http;

main() async {
 
}



agetin() async {
  AuthService authService = AuthService();
  final logoutUrl = Uri.parse("http://127.0.0.1:8000/accounts/logout/");
  var response = await http.get(
    logoutUrl,
    headers: {
      "Authorization": "Token c400d3a5ddccbde94ac41d7810caeab51595e0f0"
    },
  );
  // var response = await http.get(
  //   Uri.parse("http://127.0.0.1:8000/accounts/user/"),
  //   headers: {
  //     "Authorization": "Token c400d3a5ddccbde94ac41d7810caeab51595e0f0"
  //   },
  // );
  print(response.body);

  // print(response.body);
  // RegistrationResponse? registrationResponse = await authService.registration(
  // "jela", "Test@1234", "Test@1234", "musilajela@gmail.com");
  // if (registrationResponse != null) {
  //   if (registrationResponse.email != null) {
  //     registrationResponse.email!.forEach((element) {
  //       print(element);
  //     });
  //   }
  //   if (registrationResponse.username != null) {
  //     registrationResponse.username!.forEach((element) {
  //       print(element);
  //     });
  //   }
  //   if (registrationResponse.non_field_errors != null) {
  //     registrationResponse.non_field_errors!.forEach((element) {
  //       print(element);
  //     });
  //   }
  //   if (registrationResponse.password1 != null) {
  //     registrationResponse.password1!.forEach((element) {
  //       print(element);
  //     });
  //   }
  //   if (registrationResponse.key != null) {
  //     print(registrationResponse.key!);
  //   }
  // }
  // print(response);
  // LoginResponse? loginResponse =
  //     await authService.login("musilajela@gmail.com", "Tesrt@1f234");

  // if (loginResponse != null) {
  //   if (loginResponse.key != null) print(loginResponse.key);
  //   if (loginResponse.non_field_errors != null) {
  //     loginResponse.non_field_errors!.forEach((element) {
  //       print(element);
  //     });
  //   }

  // }
// {"key":"c400d3a5ddccbde94ac41d7810caeab51595e0f0"}

  // var response = await authService.login("josemusila03@gmail.com", "Test@1234");
  // print(response.body);
}

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

// {"key":"5350fc8374c8188b779d7e74bfdabad5db98cf5c"}
// {"username":["A user with that username already exists."],"email":["A user is already registered with this e-mail address."]}
// {"username":["A user with that username already exists."],"email":["A user is already registered with this e-mail address."],"password1":["This password is too short. It must contain at least 8 characters.","This password is too common.","This password is entirely numeric."]}?

class LoginResponse {
  dynamic? key;
  List<dynamic>? non_field_errors;
  LoginResponse({this.key, this.non_field_errors});

  factory LoginResponse.fromJson(mapOfBody) {
    return LoginResponse(
      key: (mapOfBody['key']),
      non_field_errors: mapOfBody['non_field_errors'],
    );
  }
}
