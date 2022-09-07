import 'package:adessua/models/lesson_model.dart';
import 'package:adessua/services/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pdf_render/pdf_render_widgets.dart';



class PdfRender extends StatefulWidget {



  @override
  _PdfRenderState createState() => _PdfRenderState();
}
Stream pdfStream;
class _PdfRenderState extends State<PdfRender> {


  final controller = PdfViewerController();





  @override
  void dispose() {
    controller.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {


        return
        PdfViewer.openFutureFile(
      // Accepting function that returns Future<String> of PDF file path
      () async => (await DefaultCacheManager().getSingleFile(
              'https://firebasestorage.googleapis.com/v0/b/adessua-hub-a532a.appspot.com/o/core-mathematics.pdf?alt=media&token=4828f686-f6e0-4aee-9f9b-70d64ba096a6'


      ))
          .path,
      viewerController: controller,
      onError: (err) => print(err),
      params: PdfViewerParams(
        padding: 10,
        minScale: 1.0,
      ),

    );
  }
}
