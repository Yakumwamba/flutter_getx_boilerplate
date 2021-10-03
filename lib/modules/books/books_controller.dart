import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/api/api.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';

class BooksController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print("I am inside the books controller");
  }

  showEpub() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String iosBookPath = '${appDocDir.path}/chair.epub';

    String androidBookPath = 'file:///android_asset/test.epub';
    EpubViewer.setConfig(
        themeColor: Get.theme.primaryColor,
        identifier: "iosBook",
        scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
        allowSharing: true,
        enableTts: true,
        nightMode: true);
    EpubViewer.openAsset('assets/test.epub');
  }

  var files;

  // void getFiles() async {
  //   //asyn function to get list of files
  //   List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
  //   var root = storageInfo[0]
  //       .rootDir; //storageInfo[1] for SD card, geting the root directory
  //   var fm = FileManager(root: Directory(root)); //
  //   files = await fm.filesTree(
  //       //set fm.dirsTree() for directory/folder tree list
  //       excludedPaths: [
  //         "/storage/emulated/0/Android"
  //       ], extensions: [
  //     "png",
  //     "pdf"
  //   ] //optional, to filter files, remove to list all,
  //       //remove this if your are grabbing folder list
  //       );
  //   setState(() {}); //update the UI
  // }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
