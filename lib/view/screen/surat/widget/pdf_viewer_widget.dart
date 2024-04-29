import 'package:flutter/material.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:portal_pns_flutter/view/screen/surat/pages/show_pdf_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerWidget extends StatefulWidget {
  final String url;
  const PdfViewerWidget({Key? key, required this.url}) : super(key: key);

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  PdfViewerController? _pdfViewerController;
  double _pdfHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: Adaptive.h(1), horizontal: Adaptive.w(3)),
          decoration: BoxDecoration(
            color: Colors.grey.shade600.withOpacity(0.9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: Adaptive.w(2)),
                    InkWell(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          Icons.open_in_new_rounded,
                          size: 16.sp,
                          color: Colors.white,
                        ),
                        SizedBox(width: Adaptive.w(2)),
                        Text(
                          'Lihat Dokumen',
                          style: poppinsMedium.copyWith(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => ShowPdfPage(url: widget.url),
                      ),
                    ),
                  ),
                  SizedBox(width: Adaptive.w(5)),
                  InkWell(
                    child: Icon(
                      Icons.download,
                      size: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: Adaptive.w(3)),
                  InkWell(
                    child: Icon(
                      Icons.share,
                      size: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: Adaptive.h(0.5)),
        Container(
          width: double.infinity,
          height: _pdfHeight,
          child: SfPdfViewer.network(
            widget.url,
            controller: _pdfViewerController,
            enableTextSelection: false,
            pageLayoutMode: PdfPageLayoutMode.single,
            onDocumentLoaded: (details) {
              final _height = (details.document.pageSettings.height - 200) / 10;
              print(
                  'document height : ${details.document.pageSettings.height}');
              setState(() {
                _pdfHeight = Adaptive.h(_height);
              });
            },
          ),
        ),
      ],
    );
  }
}
