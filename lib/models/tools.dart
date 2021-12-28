import 'dart:convert';

class Tool {
  final String name;
  final String description;
  final double creditPrice;
  final double cryptoPrice;
  final double upgrade;
  Tool({
    this.name,
    this.description,
    this.creditPrice,
    this.cryptoPrice,
    this.upgrade,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'creditPrice': creditPrice,
      'cryptoPrice': cryptoPrice,
      'upgrade': upgrade,
    };
  }

  factory Tool.fromMap(Map<String, dynamic> map) {
    return Tool(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      creditPrice: map['creditPrice']?.toDouble() ?? 0.0,
      cryptoPrice: map['cryptoPrice']?.toDouble() ?? 0.0,
      upgrade: map['upgrade']?.toDouble() ?? 0.0,
    );
  }

 
}
