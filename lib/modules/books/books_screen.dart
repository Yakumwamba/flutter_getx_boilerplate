import 'dart:io';

import 'package:file_manager/controller/file_manager_controller.dart';
import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/auth.dart';
import 'package:flutter_getx_boilerplate/modules/books/books_controller.dart';
import 'package:flutter_getx_boilerplate/modules/books/components/my_books.dart';
import 'package:flutter_getx_boilerplate/modules/books/components/my_videos.dart';
import 'package:flutter_getx_boilerplate/routes/routes.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';
import 'package:get/get.dart';

import 'components/my_links.dart';

class BooksScreen extends GetView<BooksController> {
  BooksController controller = Get.find();
  // controller.fileManagercontroller.setCurrentPath = "/storage/emulated/0/LSM";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _buildItems(context),
        ),
      ),
    );
  }

  buildFileManager() {
    final FileManagerController fileManagercontroller = FileManagerController();
    //fileManagercontroller.setCurrentPath = "/storage/emulated/0/";
    fileManagercontroller.setCurrentPath = "/storage/emulated/0/GradeR";
    fileManagercontroller
        .openDirectory(Directory(fileManagercontroller.getCurrentPath));

    // controller.openDirectory(directory);
    return FileManager(
      controller: fileManagercontroller,
      builder: (context, snapshot) {
        final List<FileSystemEntity> entities = snapshot;
        return ListView.builder(
          itemCount: entities.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: FileManager.isFile(entities[index])
                    ? Icon(Icons.feed_outlined)
                    : Icon(Icons.folder),
                title: Text(FileManager.basename(entities[index])),
                onTap: () {
                  if (FileManager.isDirectory(entities[index])) {
                    fileManagercontroller
                        .openDirectory(entities[index]); // open directory
                  } else {
                    // Perform file-related tasks.
                  }
                },
              ),
            );
          },
        );
      },
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
