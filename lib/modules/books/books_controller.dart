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

  ///
  ///
  ///

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

  getPhaseDirectory() async {
    Directory directory = Directory("/");
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory())!;
          print(directory.path);
          //storage/emulated/0/Android/data/com.example.flutter_getx_boilerplate/files
          String newPath = "";

          List<String> folders = directory.path.split("/");
          for (int x = 1; x < folders.length; x++) {
            String folder = folders[x];

            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          print(directory.listSync());
          newPath = newPath + "/LSM";
          directory = Directory(newPath);
          print(directory.path);
        }
      }

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      if (await directory.exists()) {
        //  File book = File(directory.path + "/test.pdf");
        // File.fromUri(Uri.directory(directory.path + "/test.pdf"));
      }
    } catch (e) {}

    // '${dir?.path}/material'
    // await new Io.Directory("/storage/emulated/0/Download/Materials")
    //     .create(recursive: true);

    // if (await _requestPermission(Permission.storage)) {
    //   // Either the permission was already granted before or the user just granted it.
    //   // await new Io.Directory("/storage/emulated/0/Download/Materials")
    //   //     .create(recursive: true);

    //   print("Permission was granteed now what?");
    //   Io.Directory downloadDir = await getApplicationDocumentsDirectory();

    //   List<Io.FileSystemEntity> folders = downloadDir.listSync();

    //   // var dir = await FileManager(root: downloadDir).walk().toList();
    //   print(folders);
    // } else {
    //   print("Not granted");
    //   await Permission.storage.request();
    // }
    // print(dir);
    // return tempDir;
  }

  Future<List> _filePlanSort({required String location}) async {
    var root = await Directory("/storage/emulated/0/Download/learner$location");

    List data = [];
    // try {
    //   if (root.existsSync()) {
    //     var dir = await FileManager(root: root).walk().toList();
    //     if (location.split('/').last == "ebooks-large") {
    //       for (int i = 0; i < dir.length; i++) {
    //         FileSystemEntity folder = dir[i];
    //         if (folder is Directory) {
    //           data.add(folder);
    //         }
    //       }
    //     } else if (location.split('/').last == "ebooks") {
    //       data = dir;
    //     }
    //   }
    // } catch (e) {
    //   print("THISSSS ${e.toString()}");
    // }

    return data;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    print("Path to the download is : ");
    // getPhaseDirectory();
    EpubViewer.setConfig(
        themeColor: Get.theme.primaryColor,
        identifier: "iosBook",
        scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
        allowSharing: true,
        enableTts: true,
        nightMode: true);

    //await Directory("/storage/emulated/0/LSM");

    //fileManagercontroller.setCurrentPath = "/storage/emulated/0/LSM";
    //await Permission.storage.request();

// You can can also directly ask the permission about its status.
    // if (await Permission.location.isRestricted) {
    //   // The OS restricts access, for example because of parental controls.
    // }
  }

  showEpub() async {
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // String iosBookPath = '${appDocDir.path}/chair.epub';

    // String androidBookPath = 'file:///android_asset/test.epub';
    // EpubViewer.setConfig(
    //     themeColor: Get.theme.primaryColor,
    //     identifier: "iosBook",
    //     scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
    //     allowSharing: true,
    //     enableTts: true,
    //     nightMode: true);
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
