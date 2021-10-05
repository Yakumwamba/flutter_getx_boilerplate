import 'package:flutter_getx_boilerplate/api/api.dart';
import 'package:get/get.dart';

import 'modules/books/books_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider(), permanent: true);
    Get.put(ApiRepository(apiProvider: Get.find()), permanent: true);
    Get.put<BooksController>(BooksController(), permanent: true);
  }
}
