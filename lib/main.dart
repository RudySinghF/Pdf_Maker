import 'package:flutter/material.dart';
import 'package:pdfstyle/pdf.dart';
import 'package:printing/printing.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPdf _pdf = MyPdf();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PDF Preview Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('Hello World!'),
            ),
            ElevatedButton(
              onPressed: () async {
                // final data = await _pdf.generatePdf(format, title);
                // _pdf.savePdfFile("Profile", data);
                await Printing.layoutPdf(
                    onLayout: (format) => _pdf.generatePdf(format));
              },
              child: Text('Generate PDF and Preview'),
            ),
          ],
        ),
      ),
    );
  }
}
