import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import '../../../../core/constants/enums/auth_enums.dart';
import '../model/auth_model.dart';
import '../service/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(const AuthState.unknown()) {
    on<AppStarted>((event, emit) async {
      try {
        if (await authService.isLoggedIn()) {
          await authService.updateTokenFromStorage();
          emit(const AuthState.authenticated());
        } else {
          emit((await authService.isFirstEntry())
              ? const AuthState.firstEntry()
              : const AuthState.guest());
        }
      } on SocketException {
        emit(const AuthState.error(error: AuthError.hostUnreachable));
      } catch (e) {
        log(e.toString());
        emit(const AuthState.error());
      }
    });

    on<LoginRequested>(
      (event, emit) async {
        emit(const AuthState.checking());
       try {
          final AuthModel response = await authService.login(
              email: event.email, password: event.password);
          // emit(const AuthState.authenticated());
          print("hhhhhhhhhhhhhhhhh 1");
          if (response.token.isNotEmpty) {
            log(response.token);
            print("hhhhhhhhhhhhhhhhh 2");
            await authService.updateToken(response.token);
            await authService.updateLoggedIn(true);
            emit(const AuthState.authenticated());
          } else {
            print("hhhhhhhhhhhhhhhhh");
            emit(const AuthState.error(error: AuthError.wrongEmailOrPassword));
          }
       }on DioError catch (e) {
         emit(const AuthState.error(error: AuthError.unknown));
         if(e.response!.statusCode == 404){
        print(e.response!.statusCode);
        }else{
        print(e.message);
        print(e.requestOptions.uri);
        }
      }
      },
    );

    on<LogoutRequested>((event, emit) async {
      try {
        await authService.signOut();
        emit(const AuthState.guest());
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
