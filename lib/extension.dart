import 'package:flutter/material.dart';

extension Sizeviw on int {
  Widget get ofHeight => SizedBox(
        height: toDouble(),
      );
  Widget get ofWidth => SizedBox(
        width: toDouble(),
      );
}
