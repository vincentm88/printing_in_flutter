import 'package:flutter/material.dart';
import 'package:printing_in_flutter/models/animal.dart';
import 'package:printing_in_flutter/widgets/animal_skelenton.dart';
import 'package:printing_in_flutter/widgets/animal_page_view.dart';
import 'package:printing_in_flutter/services/animal_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Animal>>(
          future: loadAnimals(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: AnimalCardSkeleton());
            } else if (snapshot.hasError) {
              return Center(child: AnimalCardSkeleton());
            } else {
              final animals = snapshot.data!;
              return AnimalPageView(animals: animals);
            }
          }),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
