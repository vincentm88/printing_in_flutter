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
