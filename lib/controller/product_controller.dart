import 'package:dukaan/modals/cart_product_modal.dart';
import 'package:flutter/widgets.dart';

import '../helper/login_helper.dart';
import '../modals/product_modals.dart';

class ProductController extends ChangeNotifier {
  ProductController() {
    initData();
  }

  List<Products> favList = [];
  List<CartProductModal> cartList = [];

  Future<void> initData() async {
    favList = await LoginHelper.loginHelper.getFavData();
    cartList = await LoginHelper.loginHelper.getCartData();
    notifyListeners();
  }

  Future<void> favInsertData({required Products productModal}) async {
    await LoginHelper.loginHelper
        .favInsertData(productModal: Products.fromJson(productModal.toJson()));
    initData();
  }

  Future<void> cartInsertData({required CartProductModal cartModal}) async {
    await LoginHelper.loginHelper.cartInsertData(
        cartModal: CartProductModal.fromJson(cartModal.toJson()));
    initData();
  }
}
