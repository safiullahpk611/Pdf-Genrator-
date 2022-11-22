import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

import 'pdf_generator.dart';
class EnterData extends StatefulWidget {
  const EnterData({Key? key}) : super(key: key);

  @override
  State<EnterData> createState() => _EnterDataState();
}

class _EnterDataState extends State<EnterData> {
  PrintingInfo? printingInfo;
  @override
  void initState(){
super.initState();
_init();
  }
  Future<void>_init()async{
    final info= await Printing.info();
    setState(() {
      printingInfo=info;
    });
  }
  Widget build(BuildContext context) {
    pw.RichText.debug=true;
    final action=<PdfPreviewAction>[
if(!kIsWeb)
  const PdfPreviewAction(icon: Icon(Icons.save), onPressed:saveAsFile)

    ];
    return Scaffold(
      appBar: AppBar(title: Text("Proposal Generator"),),
      body: PdfPreview(
      maxPageWidth: 800,
        actions: action,
        onPrinted: showPrintestoast,
        onShared: showsharedtoast,

        ///
        /// calling to generate pdf file
        build: generatedPdf,



      ),

    );
  }
}
