import 'package:flutter/material.dart';
import 'package:printing_in_flutter/widgets/animal_card.dart';
import 'package:printing_in_flutter/models/animal.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;

class AnimalPageView extends StatefulWidget {
  final List<Animal> animals;

  const AnimalPageView({super.key, required this.animals});

  @override
  _AnimalPageViewState createState() => _AnimalPageViewState();
}

class _AnimalPageViewState extends State<AnimalPageView> {
  int currentPage = 0;

  void _onButtonPressed() {
    final selectedAnimal = widget.animals[currentPage];
    printDocument(selectedAnimal);
  }

  Future<void> printDocument(animal) async {
    final imageResponse = await http.get(Uri.parse(animal.image));
    final imageBytes = imageResponse.bodyBytes;
    final image = pw.MemoryImage(imageBytes);
    final doc = pw.Document();
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              children: [
                pw.Image(image, width: 300, height: 300),
                pw.Text(animal.animal,
                    style: pw.TextStyle(
                        fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.Text(animal.facts[0]),
                pw.Text(animal.facts[1]),
                pw.Text(animal.facts[2]),
                pw.Text(animal.facts[3]),
                pw.Text(animal.facts[4]),
              ],
            ),
          );
        }));

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save(),
      name: 'Printing In Flutter ${animal.animal}.pdf',
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.animals.length,
      controller: PageController(viewportFraction: 0.8),
      onPageChanged: (int index) {
        setState(() {
          currentPage = index;
        });
      },
      itemBuilder: (context, index) {
        return AnimalCard(
          animal: widget.animals[index],
          onButtonPressed: _onButtonPressed,
        );
      },
    );
  }
}
