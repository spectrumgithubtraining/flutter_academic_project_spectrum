import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class DataToPdf extends StatefulWidget {
  @override
  State<DataToPdf> createState() => _DataToPdfState();
}

class _DataToPdfState extends State<DataToPdf> {
  List<List<String>> tableData = [
    ['Subject 1', 'Subject 2', 'Subject 3'],
    ['Data 1', 'Data 2', 'Data 3'],
    ['Data 4', 'Data 5', 'Data 6'],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Table to PDF Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('Subject 1')),
                  DataColumn(label: Text('Subject 2')),
                  DataColumn(label: Text('Subject 3')),
                ],
                rows: tableData
                    .map((row) => DataRow(
                  cells: row.map((cell) => DataCell(Text(cell))).toList(),
                ))
                    .toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  generateTablePdf().then((pdfBytes) {
                    Printing.layoutPdf(onLayout: (format) {
                      return pdfBytes;
                    });
                  });
                },
                child: Text('Generate PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Uint8List> generateTablePdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Table(
          border: pw.TableBorder.all(),
          children: [
            pw.TableRow(
              children: tableData[0].map((header) {
                return pw.Container(
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    header,
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
            for (var row in tableData.sublist(1))
              pw.TableRow(
                children: row.map((cell) {
                  return pw.Container(
                    alignment: pw.Alignment.center,
                    child: pw.Text(cell),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );

    return pdf.save();
  }
}
