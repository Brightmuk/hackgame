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
      'level':1,
      'price':{
        'credit':creditPrice,
        'crypto':cryptoPrice,
        'upgrade': upgrade,
      },
      'description': description,
    };
  }

  factory Tool.fromMap(Map<String, dynamic> map) {
    return Tool(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      creditPrice: map['price']['credit']?.toDouble() ?? 0.0,
      cryptoPrice: map['price']['crypto']?.toDouble() ?? 0.0,
      upgrade: map['price']['upgrade']?.toDouble() ?? 0.0,
    );
  }

 
}
