import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/models/api_product_response.dart';

class ProductNotifier extends ChangeNotifier {
  Product? _product;
  late final Dio _dio;

  ProductNotifier() {
    _dio = Dio();
    loadProduct();
  }

  Product? get product => _product;

  Future<void> loadProduct() async {
    try {
      // Faire un appel GET à l'API
      final response = await _dio.get(
        'https://api.formation-flutter.fr/v2/getProduct',
        queryParameters: {
          'barcode': '5000159484695', // Code-barres de test
        },
      );

      // Vérifier que la requête a réussi
      if (response.statusCode == 200) {
        print('\n=== RÉPONSE API ===');
        print('✓ Status: ${response.statusCode}');
        print('✓ Data type: ${response.data.runtimeType}');
        print('✓ Raw data: ${response.data}\n');

        // Convertir la réponse en Map (jsonDecode convertit String en Map)
        final jsonMap = response.data is String
            ? jsonDecode(response.data as String) as Map<String, dynamic>
            : response.data as Map<String, dynamic>;

        print('=== DONNÉES PARSÉES ===');
        print('barcode: ${jsonMap['barcode']}');
        print('name: ${jsonMap['name']}');
        print('picture: ${jsonMap['picture']}');
        print('nutriScore: ${jsonMap['nutriScore']}');
        print('novaScore: ${jsonMap['novaScore']}');
        print('greenScore: ${jsonMap['greenScore']}\n');

        // Créer l'objet ApiProductResponse à partir du JSON
        final apiResponse = ApiProductResponse.fromJSON(jsonMap);
        print('=== API RESPONSE OBJECT ===');
        print('apiResponse.nutriScore: ${apiResponse.nutriScore}');
        print('apiResponse.novaScore: ${apiResponse.novaScore}');
        print('apiResponse.greenScore: ${apiResponse.greenScore}\n');

        // Convertir en objet Product
        _product = apiResponse.toProduct();
        print('=== PRODUCT OBJECT ===');
        print('Product name: ${_product?.name}');
        print('Product barcode: ${_product?.barcode}');
        print('Product picture: ${_product?.picture}');
        print('Product nutriScore: ${_product?.nutriScore}');
        print('Product novaScore: ${_product?.novaScore}');
        print('Product greenScore: ${_product?.greenScore}\n');

        // Notifier les listeners que les données ont changé
        notifyListeners();
      }
    } catch (e) {
      print('\n❌ ERREUR lors du chargement du produit: $e');
      print('Stack trace: ${StackTrace.current}');
      // En cas d'erreur, on pourrait initialiser avec des données par défaut
      // ou laisser _product à null pour afficher un message d'erreur
    }
  }
}
