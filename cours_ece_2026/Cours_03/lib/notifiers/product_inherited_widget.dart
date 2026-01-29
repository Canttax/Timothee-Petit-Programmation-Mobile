import 'package:flutter/material.dart';
import 'package:formation_flutter/model/product.dart';

class ProductInheritedWidget extends InheritedWidget {
  final Product product;

  const ProductInheritedWidget({
    required this.product,
    required super.child,
    super.key,
  });

  static Product of(BuildContext context) {
    final ProductInheritedWidget? result = context
        .dependOnInheritedWidgetOfExactType<ProductInheritedWidget>();
    assert(result != null, 'No ProductInheritedWidget found in context');
    return result!.product;
  }

  @override
  bool updateShouldNotify(ProductInheritedWidget oldWidget) {
    return oldWidget.product != product;
  }
}
