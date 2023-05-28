import 'package:dio/dio.dart';

class DioManager {
  static DioManager? _instance;

  static DioManager get instance {
    if (_instance != null) return _instance!;
    _instance = DioManager._init();
    return _instance!;
  }

  final String _baseUrl = 'https://dummyjson.com/';
  // final String _baseUrl = 'http://143.244.197.131/api';
  late final Dio dio;

  DioManager._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
      headers: { 'Content-Type': 'application/json' }
      //  followRedirects: true,
      ),
    );
  }
}
