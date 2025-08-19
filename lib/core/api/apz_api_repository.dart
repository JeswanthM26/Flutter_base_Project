// // lib/api/app_repository.dart

// import 'package:flutter_base_pro/api/apz_api_constants.dart';
// import 'package:flutter_base_pro/api/apz_api_response.dart';
// import 'package:flutter_base_pro/api/apz_api_service.dart';
// import 'package:flutter_base_pro/enums/apz_api_enums.dart';
// import 'package:flutter_base_pro/models/product_model.dart';

// class AppRepository {
//   final ApiService _apiService = ApiService.instance;

//   // --- API RECIPE FOR GET ---
//   // How to get a list of all products.
//   Future<ApiResponse<List<Product>>> getProducts() async {
//     return await _apiService.request<List<Product>>(
//       ApiConstants.products,
//       method: HttpMethod.get,
//       fromJson: (json) {
//         // The API returns a list of JSON objects. We need to map
//         // over the list and convert each item into a Product object.
//         final items = json as List;
//         return items.map((item) => Product.fromJson(item)).toList();
//       },
//     );
//   }

//   // --- API RECIPE FOR POST ---
//   // How to create a new product.
//   // The request is taken as a `Product` object.
//   Future<ApiResponse<Product>> createProduct(Product product) async {
//     return await _apiService.request<Product>(
//       ApiConstants.products,
//       method: HttpMethod.post,
//       // We send the product's JSON representation as the request body.
//       data: product.toJson(),
//       // The API returns the newly created product, so we parse it.
//       fromJson: Product.fromJson,
//     );
//   }
// }



import 'package:flutter_base_pro/core/api/apz_api_constants.dart';
import 'package:flutter_base_pro/core/api/apz_api_response.dart';
import 'package:flutter_base_pro/core/api/apz_api_service.dart';
import 'package:flutter_base_pro/data/enums/apz_api_enums.dart';
import '../../data/models/product_model.dart';

class AppRepository {
  final ApiService _apiService = ApiService.instance;

  Future<ApiResponse<List<Product>>> getProducts() async {
    return await _apiService.request<List<Product>>(
      ApiConstants.products,
      method: HttpMethod.get,
      fromJson: (json) {
        final items = json as List;
        // return items.map((item) => Product.fromJson(item)).toList();
       // return items.map((item) => Product.fromJson(item)).toList();
       //  should be changed to: 
       return items.map((item) => Product.fromJson(item as Map<String, dynamic>)).toList();
      },
    );
  }
  Future<ApiResponse<Product>> createProduct(Product product) async {
  return await _apiService.request<Product>(
    ApiConstants.products,
    method: HttpMethod.post,
    
    // The `data` parameter sends the product's JSON representation as the request body.
    data: product.toJson(),
    
    // The FIX is here: We wrap Product.fromJson in a lambda function.
    // This explicitly tells Dart how to handle the 'dynamic' type from the JSON response,
    // resolving the "argument_type_not_assignable" error.
    fromJson: (json) => Product.fromJson(json as Map<String, dynamic>),
  );
}

  // Future<ApiResponse<Product>> createProduct(Product product) async {
  //   return await _apiService.request<Product>(
  //     ApiConstants.products,
  //     method: HttpMethod.post,
  //     data: product.toJson(),
  //    // fromJson: Product.fromJson, should be changed to:
  //      fromJson: (json) => Product.fromJson(json as Map<String, dynamic>),
  //   );
  // }
}
