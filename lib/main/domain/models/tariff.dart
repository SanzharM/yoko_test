import 'dart:convert';

class Tariff {
  final int? id;
  final String? name;
  final bool enabled;
  final double? price;
  final bool priceEnabled;
  final String? currency;

  const Tariff({
    this.id,
    this.name,
    this.enabled = false,
    this.price,
    this.priceEnabled = false,
    this.currency,
  });

  Tariff copyWith({
    int? id,
    String? name,
    bool? enabled,
    double? price,
    bool? priceEnabled,
    String? currency,
  }) {
    return Tariff(
      id: id ?? this.id,
      name: name ?? this.name,
      enabled: enabled ?? this.enabled,
      price: price ?? this.price,
      priceEnabled: priceEnabled ?? this.priceEnabled,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    result.addAll({'enabled': enabled});
    if (price != null || currency != null) {
      final priceInfo = <String, dynamic>{};
      if (price != null) {
        result.addAll({'price': price});
      }
      result.addAll({'priceEnabled': priceEnabled});
      if (currency != null) {
        result.addAll({'currency': currency});
      }
      result.addAll(priceInfo);
    }

    return result;
  }

  factory Tariff.fromMap(Map<String, dynamic> map) {
    return Tariff(
      id: map['id']?.toInt(),
      name: map['nameRu'] ?? map['nameKk'] ?? map['nameEn'],
      enabled: map['enabled'] ?? false,
      price: map['priceInfo']['price']?.toDouble(),
      priceEnabled: map['priceInfo']['enabled'] ?? false,
      currency: map['priceInfo']['currency'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tariff.fromJson(String source) => Tariff.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tariff(id: $id, name: $name, enabled: $enabled, price: $price, priceEnabled: $priceEnabled, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tariff &&
        other.id == id &&
        other.name == name &&
        other.enabled == enabled &&
        other.price == price &&
        other.priceEnabled == priceEnabled &&
        other.currency == currency;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ enabled.hashCode ^ price.hashCode ^ priceEnabled.hashCode ^ currency.hashCode;
  }
}
