import 'package:flutter/material.dart';
import 'package:printing_in_flutter/models/animal.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  final VoidCallback onButtonPressed;

  const AnimalCard(
      {super.key, required this.animal, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(animal.image,
                  width: 300, height: 300, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16.0),
            Text(
              animal.animal,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: animal.facts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(animal.facts[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            const Center(
                child: Text(
              'scroll to see more...',
              style: TextStyle(color: Colors.grey),
            )),
            const SizedBox(height: 16.0),
            FilledButton(
              onPressed: onButtonPressed,
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.print),
                  SizedBox(width: 8.0),
                  Text('Print'),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
