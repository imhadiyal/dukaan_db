import 'dart:convert';

import '../modals/product_modals.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  ProductApi._();

  static final ProductApi productApi = ProductApi._();
  String productUri = 'https://dummyjson.com/products';
  List<Products> allProduct = [];

  Future<List<Products>> getAllProduct() async {
    final response = await http.get(Uri.parse(productUri));
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      List data = map['products'];
      allProduct = data.map((e) => Products.fromJson(e)).toList();
    }
    return allProduct;
  }
}
