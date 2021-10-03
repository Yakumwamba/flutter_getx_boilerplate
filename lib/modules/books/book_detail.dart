import 'dart:io';

import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/auth.dart';
import 'package:flutter_getx_boilerplate/modules/books/books_controller.dart';
import 'package:flutter_getx_boilerplate/routes/routes.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class BookViewScreen extends GetView<BooksController> {
  bool loading = false;
  //Dio dio = new Dio();

  // download() async {
  //   if (Platform.isIOS) {
  //     print('download');
  //     await downloadFile();
  //   } else {
  //     loading = false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: loading
              ? CircularProgressIndicator()
              : FlatButton(
                  onPressed: () async {
                    Directory appDocDir =
                        await getApplicationDocumentsDirectory();
                    print('$appDocDir');

                    String iosBookPath = '${appDocDir.path}/chair.epub';
                    print(iosBookPath);
                    print(iosBookPath);
                    String androidBookPath = 'file:///android_asset/test.epub';
                    EpubViewer.setConfig(
                        themeColor: Theme.of(context).primaryColor,
                        identifier: "iosBook",
                        scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                        allowSharing: true,
                        enableTts: true,
                        nightMode: true);
//                    EpubViewer.open(
//                      Platform.isAndroid ? androidBookPath : iosBookPath,
//                      lastLocation: EpubLocator.fromJson({
//                        "bookId": "2239",
//                        "href": "/OEBPS/ch06.xhtml",
//                        "created": 1539934158390,
//                        "locations": {
//                          "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
//                        }
//                      }),
//                    );

                    await EpubViewer.openAsset(
                      'assets/test.epub',
                    );
                    // get current locator
                    // EpubViewer.locatorStream.listen((locator) {
                    //   print(
                    //       'LOCATOR: ${EpubLocator.fromJson(jsonDecode(locator))}');
                    // });
                  },
                  child: Container(
                    child: Text('open epub'),
                  ),
                ),
        ),
      ),
    );
  }
}
