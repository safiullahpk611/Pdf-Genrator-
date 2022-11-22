import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';

import 'package:printing/printing.dart';

import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:proposal_generator/ui/home_screen/home_screen.dart';

import '../home_screen/home_screen_provider.dart';

Future<Uint8List> generatedPdf(final PdfPageFormat format) async {
  // final font = await rootBundle.load("assets/OpenSans-Regular.ttf");
  // final ttf = pw.Font.ttf(font);
  final doc = pw.Document(title: 'Project Proposal');
  final pageTheme = await _pageTheme(format);

  ///
  ///
  /// adding first page of Documents
  doc.addPage(
    pw.MultiPage(
        pageTheme: pageTheme,
        build: (context) {
          return [
            pw.Container(
                decoration: (pw.BoxDecoration()),
                child: pw.Column(children: [
                  pw.Padding(
                      padding: pw.EdgeInsets.only(left: 280),
                      child: pw.Column(children: [
                        pw.Text(
                          dateinput.text.trim(),
                          style: pw.TextStyle(
                            fontSize: 22,
                            color: PdfColor.fromHex("#0000FF"),
                          ),
                          textAlign: pw.TextAlign.right,
                          textDirection: pw.TextDirection.rtl,
                        ),
                        pw.SizedBox(height: 120),
                        pw.Text(
                          controller.text.trim(),
                          style: pw.TextStyle(
                            fontSize: 22,
                            color: PdfColor.fromHex("#0000FF"),
                          ),
                          textAlign: pw.TextAlign.right,
                          textDirection: pw.TextDirection.rtl,
                        ),
                      ])),
                  pw.SizedBox(height: 10),
                  pw.Padding(
                      padding: pw.EdgeInsets.only(left: 140),
                      child: pw.Text("Project Cost and Educational Document",
                          style: pw.TextStyle(
                            fontSize: 18,
                          ))),
                  pw.SizedBox(height: 100),
                  pw.Padding(
                      padding: pw.EdgeInsets.only(left: 200),
                      child: pw.Text(fillBycontroller.text.trim(),
                          style: pw.TextStyle(
                            fontSize: 25,
                          )))
                ]))
          ];
        }),
  );

  ///
  /// adding second page to document
  doc.addPage(
    pw.MultiPage(
        build: (final context) => [
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("BRIEF OVERVIEW",
                        style: pw.TextStyle(
                            fontSize: 22,
                            background: pw.BoxDecoration(
                              color: PdfColor.fromHex("#87CEEB"),
                            ))),
                    pw.SizedBox(height: 10),
                    pw.Text(briefOverview.text.trim(),
                        style: pw.TextStyle(
                          fontSize: 14,
                        )),
                    pw.SizedBox(height: 20),
                    pw.Text("COST ALLOCATION SHEET",
                        style: pw.TextStyle(
                            fontSize: 21,
                            background: pw.BoxDecoration(
                                color: PdfColor.fromHex("#D7A1F9")))),
                    pw.SizedBox(height: 20),
                    pw.Text("MOBILE APPLICATION AND WESBSITE DEVELOPMENT",
                        style: pw.TextStyle(
                            fontSize: 18,
                            background: pw.BoxDecoration(
                                color: PdfColor.fromHex("#D7A1F9")))),
                    pw.SizedBox(height: 30),
                    pw.Row(children: [
                      pw.Text("Timeline estimation:"),
                      pw.SizedBox(width: 5),
                      pw.Text("${timelineestimation.text.trim()} Days",
                          style: pw.TextStyle(
                            decoration: pw.TextDecoration.underline,
                          )),
                    ]),
                    pw.SizedBox(height: 20),
                    pw.Row(children: [
                      pw.Text("Overall Cost:"),
                      pw.SizedBox(width: 5),
                      pw.Text("${budgetController.text.trim()}  USD",
                          style: pw.TextStyle(
                            decoration: pw.TextDecoration.underline,
                          )),
                    ]),
                    pw.SizedBox(height: 20),
                    pw.GridView(
                      crossAxisCount: 3,
                      childAspectRatio: 2/3,
                      crossAxisSpacing: 3,


                      children: [

                        pw.Table(

                            border: pw.TableBorder.all(
                                color: PdfColor.fromHex("#000000"),
                                style: pw.BorderStyle.solid,
                                width: 2),
                            children: [
                              pw.TableRow(children: [
                                pw.Text(
                                  'SNO ',
                                  style: pw.TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  'Item Description',
                                  style: pw.TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  'Price (USD)',
                                  style: pw.TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ]),







                              tableRow(
                                  sNo: sNoController.text, itemDes: featureController.text, price: budgetController.text),



                            ]),





                      ]

                    ),
                    pw.Container(
                        padding: pw.EdgeInsets.symmetric(vertical: 20),
                        child: pw.Table(

                            border: pw.TableBorder.all(
                                color: PdfColor.fromHex("#000000"),
                                style: pw.BorderStyle.solid,
                                width: 2),
                            children: [
                              pw.TableRow(children: [
                                pw.Text(
                                  'SNO ',
                                  style: pw.TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  'Item Description',
                                  style: pw.TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                  textAlign: pw.TextAlign.center,
                                ),
                                pw.Text(
                                  'Price (USD)',
                                  style: pw.TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ]),







                                tableRow(
                                    sNo: sNoController.text, itemDes: featureController.text, price: budgetController.text),



                            ]),
                    )
                  ])
            ]),
  );

  ///
  /// adding third page to document
  doc.addPage(pw.MultiPage(
      build: (final context) => [
            pw.Row(children: [
              pw.Text("Filled By:",
                  style: pw.TextStyle(
                    fontSize: 16,
                  )),
              pw.SizedBox(width: 5),
              pw.Text(fillBycontroller.text.trim(),
                  style: pw.TextStyle(
                      decoration: pw.TextDecoration.underline,
                      color: PdfColor.fromHex("#0000FF"),
                      fontSize: 18)),
              pw.SizedBox(height: 10),
            ]),
            pw.SizedBox(height: 20),
            pw.Text("DEVELOPMENT PROCEDURE",
                style: pw.TextStyle(
                  fontSize: 22,
                  background: pw.BoxDecoration(
                    color: PdfColor.fromHex("#87CEEB"),
                  ),
                )),
            pw.Text(
              developmentProcedure.text.trim(),
            ),
            pw.SizedBox(height: 20),
            pw.Text("Future Services",
                style: pw.TextStyle(
                  fontSize: 22,
                  background: pw.BoxDecoration(
                    color: PdfColor.fromHex("#87CEEB"),
                  ),
                )),
            pw.Text(
              futureServices.text.trim(),
            ),
            pw.SizedBox(height: 20),
            pw.Text("COPYRIGHT AND LICENSING",
                style: pw.TextStyle(
                  fontSize: 22,
                  background: pw.BoxDecoration(
                    color: PdfColor.fromHex("#87CEEB"),
                  ),
                )),
            pw.Text(
              copyLinenceAndRight.text.trim(),
            ),
            pw.SizedBox(height: 20),
            pw.Text("Kinds Regards",
                style: pw.TextStyle(
                  fontSize: 16,
                )),
            pw.SizedBox(height: 15),
            pw.Text(fillBycontroller.text.trim(),
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                )),
          ]));

  return doc.save();
}

/// adding new row to the table
///
///
///
///

pw.TableRow tableRow({final sNo, final itemDes, final price}) {
  return pw.TableRow(children: [
    pw.Text(
      '${sNo} ',
      style: pw.TextStyle(
        fontSize: 18.0,
      ),
      textAlign: pw.TextAlign.center,
    ),
    pw.Text(
      '${itemDes}',
      style: pw.TextStyle(
        fontSize: 18.0,
      ),
      textAlign: pw.TextAlign.center,
    ),
    pw.Text(
      '${price}',
      style: pw.TextStyle(
        fontSize: 18.0,
      ),
      textAlign: pw.TextAlign.center,
    ),
  ]);
}

///
/// page Theme
Future<pw.PageTheme> _pageTheme(PdfPageFormat format) async {
  return pw.PageTheme(
      margin: pw.EdgeInsets.symmetric(
        horizontal: 1 * PdfPageFormat.cm,
        vertical: 0.5 * PdfPageFormat.cm,
      ),
      textDirection: pw.TextDirection.ltr,
      orientation: pw.PageOrientation.portrait,
      buildBackground: (final context) => pw.FullPage(
          ignoreMargins: true,
          child: pw.Watermark(
              angle: 20,
              child: pw.Opacity(
                opacity: 0.5,
              ))));
}

///
/// save file Method
Future<void> saveAsFile(final BuildContext context, final LayoutCallback build,
    final PdfPageFormat pageFormat) async {
  final bytes = build(pageFormat);
  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final file = File("$appDocPath/document.pdf");
  print('save as file${file.path}-------');
  await file.writeAsBytes(bytes as List<int>);
  await OpenFile.open(file.path);
}

///
/// messageed on printing

void showPrintestoast(final BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("printed sucessfully")));
}

///
/// messaged on sharing
void showsharedtoast(final BuildContext context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("shared sucessfully")));
}
