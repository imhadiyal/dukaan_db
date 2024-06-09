import 'package:dukaan/services/product_api.dart';
import 'package:flutter/cupertino.dart';

import '../modals/product_modals.dart';

class Api extends ChangeNotifier {
  Api() {
    getAllProductApi();
  }
  List<Products> allProduct = [];
  Future<void> getAllProductApi() async {
    allProduct = await ProductApi.productApi.getAllProduct();
    notifyListeners();
  }
}
