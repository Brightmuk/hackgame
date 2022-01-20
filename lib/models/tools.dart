import 'dart:convert';



class Tool {
  final String id;
  final String name;
  final String description;
  final double creditPrice;
  final double cryptoPrice;
  final int level;
  final double upgrade;
  final Map meta;

  Tool({
    this.id,
    this.name,
    this.description,
    this.creditPrice,
    this.cryptoPrice,
    this.level,
    this.upgrade,
    this.meta
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name': name,
      'level':1,
      'price':{
        'credit':creditPrice,
        'crypto':cryptoPrice,
        'upgrade': upgrade,
      },
      'meta':null,
      'description': description,
    };
  }

  factory Tool.fromMap(Map<String, dynamic> map) {
    return Tool(
      id:map['id']??'',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      creditPrice: map['price']['credit']?.toDouble() ?? 0.0,
      cryptoPrice: map['price']['crypto']?.toDouble() ?? 0.0,
      level: map['level']??1,
      upgrade: map['price']['upgrade']?.toDouble() ?? 0.0,
      meta: map['meta']??{'enabled':true}
    );
  }
 
}
