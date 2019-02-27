import 'dart:async';
import 'dart:convert';

import 'package:base_flutter_app/src/data/model/product.dart';
import 'package:base_flutter_app/src/util/ConstantUtil.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();
  final int _okStatusCode = 200;
  final String _apiKey = "802b2c4b88ea1183e50e6b285a27696e";

  Future<Product> fetchProductList() async {
    final response = await client.get(ConstantUtil.BASE_URL + _apiKey);
    print(response.body.toString());
    print("statusCode: "+'$response.statusCode');
    if (response.statusCode == _okStatusCode) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
