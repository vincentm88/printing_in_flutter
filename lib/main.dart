import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Printing in Flutter',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 31, 16, 240)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Printing in Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Future<void> printDocument() async {
      final doc = pw.Document();

      doc.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Text('Wow we are printing!'),
            );
          }));

      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Lets print something!',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          printDocument();
        },
        tooltip: 'Print',
        child: const Icon(Icons.print),
      ),
    );
  }
}
