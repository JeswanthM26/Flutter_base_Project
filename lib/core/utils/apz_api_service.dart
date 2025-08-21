// import 'package:dio/dio.dart';
// import 'package:flutter_base_pro/core/configs/apz_app_config.dart';

// class ApiService {
//   final Dio _dio = Dio();
//   final String _baseUrl = AppConfig.baseUrl;

//   ApiService() {
//     _dio.options.baseUrl = _baseUrl;
//     _dio.options.headers['Content-Type'] = 'application/json';
//   }



//   Future<dynamic> get(String endpoint) async {
//     try {
//       final response = await _dio.get(endpoint);
//       return response.data;
//     } on DioException catch (e) {
//       throw Exception("GET $endpoint failed: ${e.message}");
//     }
//   }

//   Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
//     try {
//       final response = await _dio.post(endpoint, data: body);
//       return response.data;
//     } on DioException catch (e) {
//       throw Exception("POST $endpoint failed: ${e.message}");
//     }
//   }

//   Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
//     try {
//       final response = await _dio.put(endpoint, data: body);
//       return response.data;
//     } on DioException catch (e) {
//       throw Exception("PUT $endpoint failed: ${e.message}");
//     }
//   }

//   Future<dynamic> delete(String endpoint) async {
//     try {
//       final response = await _dio.delete(endpoint);
//       return response.data;
//     } on DioException catch (e) {
//       throw Exception("DELETE $endpoint failed: ${e.message}");
//     }
//   }
// }


// import 'dart:convert';
// import 'package:dio/dio.dart' as http;
// import 'package:flutter_base_pro/data/enums/apz_api_enums.dart';
// import 'package:http/http.dart' as http;

// class ApiService {
//   final String? apiKey;

//   ApiService({this.apiKey});

//   Future<dynamic> request({
//     required String url,
//     required HttpMethod method,
//     Map<String, String>? headers,
//     Map<String, dynamic>? queryParams,
//     dynamic body,
//   }) async {
//     // Merge headers
//     final finalHeaders = {
//       "Content-Type": "application/json",
//       "Accept": "application/json",
//       if (apiKey != null) "x-api-key": apiKey!,
//       if (headers != null) ...headers,
//     };

//     // Build final URL with query params
//     final uri = Uri.parse(url).replace(queryParameters: queryParams);

//     http.Response response;

//     switch (method) {
//       case HttpMethod.get:
//         response = await http.get(uri, headers: finalHeaders);
//         break;
//       case HttpMethod.post:
//         response = await http.post(uri, headers: finalHeaders, body: jsonEncode(body));
//         break;
//       case HttpMethod.put:
//         response = await http.put(uri, headers: finalHeaders, body: jsonEncode(body));
//         break;
//       case HttpMethod.delete:
//         response = await http.delete(uri, headers: finalHeaders);
//         break;
//     }

//     // Handle response
//     if (response.statusCode! >= 200 && response.statusCode! < 300) {
//       return jsonDecode(response.body);
//     } else {
//       throw Exception(
//         "Request failed: ${response.statusCode} ${response.body}",
//       );
//     }
//   }
// }


import 'dart:convert';
import 'package:Retail_Application/data/enums/apz_api_enums.dart';
import 'package:http/http.dart' as http;

//enum HttpMethod { get, post, put, delete }

class ApiService {
  Future<Map<String, dynamic>> request({
    required String url,
    required HttpMethod method,
    Map<String, String>? headers,
    Map<String, String>? queryParams,
    dynamic body,
  }) async {
    try {
      // Build query string if queryParams exist
      final uri = Uri.parse(url).replace(queryParameters: queryParams);

      http.Response response;

      switch (method) {
        case HttpMethod.get:
          response = await http.get(uri, headers: headers);
          break;
        case HttpMethod.post:
          response = await http.post(
            uri,
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        case HttpMethod.put:
          response = await http.put(
            uri,
            headers: headers,
            body: jsonEncode(body),
          );
          break;
        case HttpMethod.delete:
          response = await http.delete(uri, headers: headers);
          break;
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception(
            "API Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      throw Exception("Request failed: $e");
    }
  }
}
