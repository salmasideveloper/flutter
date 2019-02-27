import 'dart:async';

import 'package:base_flutter_app/src/data/model/product.dart';

import 'api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<Product> fetchAllProducts() => apiProvider.fetchProductList();
}
