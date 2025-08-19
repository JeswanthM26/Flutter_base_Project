import 'package:dio/dio.dart';
import 'package:flutter_base_pro/core/api/apz_api_constants.dart';
import 'package:flutter_base_pro/core/api/apz_api_response.dart';
import 'package:flutter_base_pro/data/enums/apz_api_enums.dart';

class ApiService {
  final Dio _dio;

  ApiService._(this._dio) {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  static final instance = ApiService._(Dio());

  Future<ApiResponse<T>> request<T>(
    String path, {
    required HttpMethod method,
    dynamic data,
    T Function(dynamic json)? fromJson,
  }) async {
    try {
      Response response;
      switch (method) {
        case HttpMethod.get:
          response = await _dio.get(path);
          break;
        case HttpMethod.post:
          response = await _dio.post(path, data: data);
          break;
        default:
          throw Exception("Unsupported HTTP method");
      }

      if (fromJson != null) {
        return ApiResponse(data: fromJson(response.data));
      } else {
        return ApiResponse(data: response.data);
      }
    } on DioException catch (e) {
      return ApiResponse(errorMessage: e.message ?? "Network error");
    } catch (e) {
      return ApiResponse(errorMessage: e.toString());
    }
  }
}
