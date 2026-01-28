import 'package:flutter/foundation.dart';
import 'package:formation_flutter/model/product.dart';

class ProductNotifier extends ChangeNotifier {
  Product? _product;

  ProductNotifier() {
    loadProduct();
  }

  Product? get product => _product;

  Future<void> loadProduct() async {
    // Simuler un délai de chargement
    await Future.delayed(Duration(seconds: 2));

    // Initialiser avec des fausses données
    _product = Product(
      barcode: '3017620422003',
      name: 'Petits pois et carottes',
      altName: 'Petits pois extra fins et jeunes carottes',
      picture:
          'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=1310&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      quantity: '265g',
      brands: ['Cassegrain'],
      manufacturingCountries: ['France'],
      nutriScore: ProductNutriScore.B,
      novaScore: ProductNovaScore.group4,
      greenScore: ProductGreenScore.A,
    );

    // Notifier les listeners que les données ont changé
    notifyListeners();
  }
}
