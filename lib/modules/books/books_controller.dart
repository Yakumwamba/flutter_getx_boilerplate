import 'dart:io';

import 'package:file_manager/controller/file_manager_controller.dart';
import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_file_manager/flutter_file_manager.dart';
//import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:flutter_getx_boilerplate/api/api.dart';

import 'package:epub_viewer/epub_viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BooksController extends GetxController {
  ///static const Enum = {"FOUDNATU": "ASDAS"};
  var fileManagercontroller;

  ///
  ///
  ///

  @override
  Future<void> onInit() async {
    super.onInit();

    _requestPermission(Permission.storage);
    EpubViewer.setConfig(
        themeColor: Get.theme.dialogBackgroundColor,
        identifier: "iosBook",
        scrollDirection: EpubScrollDirection.VERTICAL,
        allowSharing: true,
        enableTts: true,
        nightMode: false);
    fileManagercontroller = FileManagerController();

    WidgetsBinding.instance!.addPostFrameCallback((_) {});
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();

      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  showEpub(String bookPath) async {
    EpubViewer.open(bookPath);
  }

  @override
  void onReady() {
    super.onReady();
    fileManagercontroller.titleNotifier.addListener(() => {
          fileManagercontroller
              .openDirectory(Directory("/storage/emulated/0/Grade 1"))
        });
  }

  @override
  void onClose() {
    super.onClose();
    fileManagercontroller.dispose();
  }
}
