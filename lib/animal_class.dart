import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Animal {
  final String animal;
  final String image;
  final List<String> facts;

  Animal({required this.animal, required this.image, required this.facts});

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      animal: json['animal'],
      image: json['image'],
      facts: List<String>.from(json['facts']),
    );
  }
}

Future<List<Animal>> loadAnimals() async {
  final jsonString = await rootBundle.loadString('assets/animals.json');
  final List<dynamic> jsonResponse = json.decode(jsonString);
  return jsonResponse.map<Animal>((json) => Animal.fromJson(json)).toList();
}
