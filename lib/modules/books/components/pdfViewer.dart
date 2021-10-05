// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewer extends StatelessWidget {
  File fileToLoad;
  PDFViewer({required this.fileToLoad}) : super();

  @override
  Widget build(BuildContext context) {
    print(fileToLoad);
    return SafeArea(
      child: Container(
        height: Get.height,
        width: Get.width,
        child: Expanded(
          child: Flexible(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.green,
                                  size: 50,
                                ),
                                tooltip: 'Go back',
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                      width: Get.width, child: SfPdfViewer.file(fileToLoad)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
