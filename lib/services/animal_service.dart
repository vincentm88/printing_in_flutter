import 'package:printing_in_flutter/models/animal.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<List<Animal>> loadAnimals() async {
  await Future.delayed(const Duration(seconds: 2));
  final jsonString = await rootBundle.loadString('assets/animals.json');
  final List<dynamic> jsonResponse = json.decode(jsonString);
  return jsonResponse.map<Animal>((json) => Animal.fromJson(json)).toList();
}
