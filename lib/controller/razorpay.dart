import 'package:flutter/cupertino.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayController extends ChangeNotifier {
  final Razorpay _razorpay = Razorpay();

  void init() {
    notifyListeners();
    _razorpay.clear();
    notifyListeners();
  }
}
