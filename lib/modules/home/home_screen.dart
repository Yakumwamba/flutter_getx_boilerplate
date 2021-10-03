import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/auth.dart';
import 'package:flutter_getx_boilerplate/modules/books/books_controller.dart';
import 'package:flutter_getx_boilerplate/modules/books/components/my_books.dart';
import 'package:flutter_getx_boilerplate/modules/books/components/my_videos.dart';
import 'package:flutter_getx_boilerplate/routes/routes.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';
import 'package:get/get.dart';

//import 'components/my_links.dart';

class HomeScreen extends GetView<BooksController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: _buildItems(context),
          ),
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage("assets/images/basic_education.jpg"))),
                  width: Get.width,
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/books");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            height: 60,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: ColorConstants.darkGray,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Foundation Phase',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/intermediate_phase");
                      },
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                            height: 60,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: ColorConstants.darkGray,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Intermidate Phase',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          height: 60,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: ColorConstants.darkGray,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Senior Phase',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          height: 60,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: ColorConstants.darkGray,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'FET Phase',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
