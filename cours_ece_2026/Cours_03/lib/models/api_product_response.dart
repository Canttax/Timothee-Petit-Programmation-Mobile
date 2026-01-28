import 'package:formation_flutter/model/product.dart';

/// Classe représentant la réponse de l'API formation-flutter
class ApiProductResponse {
  final String barcode;
  final String? name;
  final String? altName;
  final String? picture;
  final String? quantity;
  final List<String>? brands;
  final List<String>? manufacturingCountries;
  final String? nutriScore;
  final String? novaScore;
  final String? greenScore;

  ApiProductResponse({
    required this.barcode,
    this.name,
    this.altName,
    this.picture,
    this.quantity,
    this.brands,
    this.manufacturingCountries,
    this.nutriScore,
    this.novaScore,
    this.greenScore,
  });

  /// Crée une instance à partir du JSON reçu de l'API
  ApiProductResponse.fromJSON(Map<String, dynamic> json)
    : this._fromResponse(json['response'] ?? json);

  ApiProductResponse._fromResponse(Map<String, dynamic> response)
    : barcode = response['barcode'] as String? ?? '',
      name = response['name'] as String?,
      altName = response['altName'] as String?,
      picture = _extractPicture(response['pictures']),
      quantity = response['quantity'] as String?,
      brands = response['brands'] != null
          ? List<String>.from(response['brands'] as List)
          : null,
      manufacturingCountries = response['manufacturingCountries'] != null
          ? List<String>.from(response['manufacturingCountries'] as List)
          : null,
      nutriScore = response['nutriScore'] as String?,
      novaScore = response['novaScore']?.toString(),
      greenScore = response['ecoScoreGrade'] as String?;

  static String? _extractPicture(dynamic pictures) {
    if (pictures is Map<String, dynamic>) {
      return pictures['front'] as String? ?? pictures['product'] as String?;
    }
    return null;
  }

  /// Convertit la réponse API en objet Product
  Product toProduct() {
    return Product(
      barcode: barcode,
      name: name,
      altName: altName,
      picture: picture,
      quantity: quantity,
      brands: brands,
      manufacturingCountries: manufacturingCountries,
      nutriScore: _parseNutriScore(nutriScore),
      novaScore: _parseNovaScore(novaScore),
      greenScore: _parseGreenScore(greenScore),
    );
  }

  ProductNutriScore _parseNutriScore(String? score) {
    if (score == null) return ProductNutriScore.unknown;
    final upperScore = score.toUpperCase();
    print('[DEBUG] Parsing nutriScore: "$score" → "$upperScore"');
    final result = switch (upperScore) {
      'A' => ProductNutriScore.A,
      'B' => ProductNutriScore.B,
      'C' => ProductNutriScore.C,
      'D' => ProductNutriScore.D,
      'E' => ProductNutriScore.E,
      _ => ProductNutriScore.unknown,
    };
    print('[DEBUG] Résultat: $result');
    return result;
  }

  ProductNovaScore _parseNovaScore(String? score) {
    if (score == null) return ProductNovaScore.unknown;
    final scoreStr = score.toString().toLowerCase();
    print('[DEBUG] Parsing novaScore: "$score" → "$scoreStr"');
    final result = switch (scoreStr) {
      '1' || 'group1' => ProductNovaScore.group1,
      '2' || 'group2' => ProductNovaScore.group2,
      '3' || 'group3' => ProductNovaScore.group3,
      '4' || 'group4' => ProductNovaScore.group4,
      _ => ProductNovaScore.unknown,
    };
    print('[DEBUG] Résultat: $result');
    return result;
  }

  ProductGreenScore _parseGreenScore(String? score) {
    if (score == null) return ProductGreenScore.unknown;
    final upperScore = score.toUpperCase();
    print('[DEBUG] Parsing greenScore: "$score" → "$upperScore"');
    final result = switch (upperScore) {
      'A+' || 'APLUS' => ProductGreenScore.APlus,
      'A' => ProductGreenScore.A,
      'B' => ProductGreenScore.B,
      'C' => ProductGreenScore.C,
      'D' => ProductGreenScore.D,
      'E' => ProductGreenScore.E,
      'F' => ProductGreenScore.F,
      _ => ProductGreenScore.unknown,
    };
    print('[DEBUG] Résultat: $result');
    return result;
  }
}
