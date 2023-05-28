import 'dart:convert';
import 'dart:io';

import '../../../../core/constants/enums/network_enums.dart';
import '../../../../core/init/network/dio_manager.dart';
import '../model/auth_model.dart';

class AuthService  {
  final DioManager dioManager;
  AuthService(this.dioManager);

   Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
 var row = {
   "email": email,
   "password": password,
 };
 var  body  = {

     "username": 'kminchelle',
     "password": '0lelplR',
     // expiresInMins: 60, // optional
   };
    var response = await dioManager.dio.post(
      NetworkEnums.login.path,
      data:jsonEncode(body)  ,
    );

    print("url ${response.requestOptions.uri}");
    print("resone");
    print(response);
    print(response.statusCode );
    if (response.statusCode! >= 200) {
      print("888888");
      return AuthModel.fromJson(response.data);
    } else {
      return AuthModel(id: 0, username: "", email: "", firstName: "", lastName: "", gender: "", image: "", token: "") ;
    }
  }

   Future<bool> isFirstEntry() async {
    return true;
  }

   Future<bool> isLoggedIn() async {
    return false;
  }

   Future<void> signOut() async {}

   Future<void> updateFirstEntry() async {}

   Future<void> updateLoggedIn(bool isLoggedIn) async {}

   Future<void> updateToken(String? token) async {}

   Future<void> updateTokenFromStorage() async {}

   Future<AuthModel> signUp(
      {required String email, required String password}) async {
    var response = await dioManager.dio.post(
      NetworkEnums.login.path,
      data: {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      return AuthModel.fromJson(response.data);
    } else {
      return throw Exception();
    }
  }
}
