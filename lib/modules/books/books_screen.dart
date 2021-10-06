import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';

import 'package:flutter_getx_boilerplate/modules/books/books_controller.dart';
import 'package:flutter_getx_boilerplate/modules/books/components/my_books.dart';
import 'package:flutter_getx_boilerplate/modules/books/components/my_videos.dart';
import 'package:flutter_getx_boilerplate/modules/books/components/pdfViewer.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'components/my_links.dart';

class BooksScreen extends GetView<BooksController> {
  // controller.fileManagercontroller.setCurrentPath = "/storage/emulated/0/LSM";
  @override
  Widget build(BuildContext context) {
    // controller.fileManagercontroller.setCurrentPath =
    //     '/storage/emulated/0/GradeR';

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _buildItems(context),
        ),
      ),
    );
  }

  buildFileManager() {
    //fileManagercontroller.setCurrentPath = "/storage/emulated/0/";

    //print(fileManagercontroller);

    // fileManagercontroller.openDirectory(Directory("GradeR"));
// WidgetsBinding.instance!.addPostFrameCallback((_){

//   // Add Your Code here.

// });
    return Container(
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ValueListenableBuilder<String>(
          //     valueListenable: controller.fileManagercontroller.titleNotifier,
          //     builder: (context, title, _) => Text(title),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 0.1)],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              /* Clear the search field */
                            },
                          ),
                          hintText: 'Search...',
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
          ),
          FileManager(
            controller: controller.fileManagercontroller,
            builder: (context, snapshot) {
              final List<FileSystemEntity> entities = snapshot;

              return Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: entities.length,
                    itemBuilder: (context, index) {
                      print(FileManager.basename(entities[index]));
                      // if (FileManager.basename(entities[index]) == "GradeR") {
                      //   fileManagercontroller.openDirectory(entities[index]);
                      //   return Text("Found");
                      // }

                      print(entities[index].statSync().type);
                      String strippedString = entities[index].path.toString();

                      if (strippedString != null &&
                          strippedString.length >= 4) {
                        var fileType = entities[index].path;
                        final extension = p.extension(fileType);

                        if (extension == '.epub') {
                          // controller.showEpub(entities[index].path);
                          strippedString = strippedString.substring(
                              0, strippedString.length - 5);

                          print("url path " + strippedString.split("/").last);
                        }

                        if (extension == '.pdf') {
                          // Get.to(() => PDFViewer(
                          //     fileToLoad: File(entities[index].path)));

                          strippedString = strippedString.substring(
                              0, strippedString.length - 4);
                          print("url path " +
                              strippedString +
                              "/imgs/" +
                              strippedString.split("/").last +
                              ".PNG");
                        }
                      }
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            if (FileManager.isFile(entities[index])) {
                              var fileType = entities[index].path;
                              final extension =
                                  p.extension(fileType); // '.dart'
                              print("the extension is  :" + extension);
                              if (extension == '.epub') {
                                controller.showEpub(entities[index].path);
                              }

                              if (extension == '.pdf') {
                                Get.to(() => PDFViewer(
                                    fileToLoad: File(entities[index].path)));
                              }

                              print("Is file");
                              return;
                            }
                            controller.fileManagercontroller
                                .openDirectory(entities[index]);
                          },
                          child: Container(
                              height: 100,
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                        height: 100,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            // image: DecorationImage(
                                            //   image: AssetImage(
                                            //       'assets/images/books.png'),
                                            // ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Image.asset("assets/images/" +
                                            strippedString
                                                .split("/")
                                                .last
                                                .replaceAll(' ', '') +
                                            ".png")),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Get.width,
                                            child: Text(
                                              FileManager.basename(
                                                  entities[index]),
                                              softWrap: false,
                                              style: TextStyle(
                                                overflow: TextOverflow.fade,
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'PDF',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItems(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text('Learner Support Material',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            DefaultTabController(
                length: 5, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: TabBar(
                            isScrollable: true,
                            labelColor: Colors.green,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.bookmarks),
                                      Text("Books")
                                    ],
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.video_library),
                                      Text("Videos")
                                    ],
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [Icon(Icons.link), Text("URLS")],
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.assessment),
                                      Text("Assessments")
                                    ],
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.plus_one),
                                      Text("Other Materials")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          height: Get.height - 140, //height of TabBarView
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: TabBarView(children: <Widget>[
                            Container(
                              child: Container(child: buildFileManager()),
                            ),
                            Container(child: MyVideos()),
                            Container(child: MyLinks()),
                            Container(
                              child: Center(
                                child: Text('My Books ',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(height: Get.height, child: MyBooks()),
                          ]))
                    ])),
          ]),
    );
  }
}
