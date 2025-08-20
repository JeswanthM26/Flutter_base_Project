import 'package:flutter_base_pro/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> createProduct(Product product);
  Future<Product> updateProduct(int id, Product product);
  Future<void> deleteProduct(int id);
}
