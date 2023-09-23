import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:giants_free_lunch/models/app_model.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://giants-food-backend-production.up.railway.app',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ));

  Future<dynamic> getLogin(
    String email,
    String password,
  ) async {
    //  List getData = [];
    try {
      final response = await _dio.post(
        '/api/auth/login',
        data: {
          "email": email,
          "password_hash": password,
        },
      );

      print("Respond: $response");
      print("----------------- success ${response.statusCode}");

      if (response.statusCode == 200) {
        print("----------------- success ${response.statusCode}");
        return response.data;
      } else if (response.statusCode == 401) {
        print("###### ${response.statusCode}");
        return "Incorrect email or password";
      } else {
        throw Exception(
            "API request failed with status code ${response.statusCode}");
      }
    } catch (e) {
      log(e.toString());
      rethrow; // Re-throw the DioError
    }
  }
}
