// import 'package:flutter_base_pro/core/constants/apz_api_constants.dart';
// import 'package:flutter_base_pro/core/utils/apz_api_service.dart';
// import 'package:flutter_base_pro/models/product.dart';
// import 'package:flutter_base_pro/data/repositories/apz_product.dart';

// class ProductApiRepository implements ProductRepository {
//   final ApiService _apiService = ApiService();

//   @override
//   Future<List<Product>> getProducts() async {
//     final data = await _apiService.get(ApiConstants.products);
//     return (data as List).map((json) => Product.fromJson(json)).toList();
//   }

//   @override
//   Future<Product> createProduct(Product product) async {
//     final data = await _apiService.post(ApiConstants.createProduct, product.toJson());
//     return Product.fromJson(data);
//   }

//   @override
//   Future<Product> updateProduct(int id, Product product) async {
//     final data = await _apiService.put(ApiConstants.updateProduct(id), product.toJson());
//     return Product.fromJson(data);
//   }

//   @override
//   Future<void> deleteProduct(int id) async {
//     await _apiService.delete(ApiConstants.deleteProduct(id));
//   }
// }


import 'package:Retail_Application/core/constants/apz_api_constants.dart';
import 'package:Retail_Application/core/utils/apz_api_service.dart';
import 'package:Retail_Application/data/enums/apz_api_enums.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository(this.apiService);

  Future<List<dynamic>> getProducts() async {
    final response = await apiService.request(
      url: ApiConstants.getProducts,
      method: HttpMethod.get,
      queryParams: {"category": "electronics", "page": "1"},
      headers: {"Authorization": "Bearer 123abc"},
    );

    return response["products"];
  }

  Future<void> addProduct(Map<String, dynamic> product) async {
    await apiService.request(
      url: ApiConstants.createProduct,
      method: HttpMethod.post,
      body: product,
      headers: {"Authorization": "Bearer 123abc"},
    );
  }
}
