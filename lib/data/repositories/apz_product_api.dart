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
