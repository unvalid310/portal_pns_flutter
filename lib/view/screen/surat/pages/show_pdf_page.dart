import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ShowPdfPage extends StatefulWidget {
  final String url;
  const ShowPdfPage({Key? key, required this.url}) : super(key: key);

  @override
  State<ShowPdfPage> createState() => _ShowPdfPageState();
}

class _ShowPdfPageState extends State<ShowPdfPage> {
  PdfViewerController? _pdfViewerController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xff41403f)),
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.close_rounded,
            size: 18.sp,
          ),
          onPressed: () async {
            Navigator.of(context).pop(true);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: Adaptive.h(85),
        child: SfPdfViewer.network(
          widget.url,
          controller: _pdfViewerController,
          enableTextSelection: false,
          enableDoubleTapZooming: true,
          pageLayoutMode: PdfPageLayoutMode.single,
        ),
      ),
    );
  }
}
