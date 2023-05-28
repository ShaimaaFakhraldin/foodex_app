import 'dart:io';

import '../../../../core/constants/enums/network_enums.dart';
import '../model/auth_model.dart';
import 'i_auth_service.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    var response = await dioManager.dio.post(
      NetworkEnums.login.path,
      data:  {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      return AuthModel.fromJson(response.data);
    } else {
      return throw Exception();
    }
  }

  @override
  Future<bool> isFirstEntry() async {
    return true;
  }

  @override
  Future<bool> isLoggedIn() async {
    return false;
  }

  @override
  Future<void> signOut() async {}

  @override
  Future<void> updateFirstEntry() async {}

  @override
  Future<void> updateLoggedIn(bool isLoggedIn) async {}

  @override
  Future<void> updateToken(String? token) async {}

  @override
  Future<void> updateTokenFromStorage() async {}

  @override
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
