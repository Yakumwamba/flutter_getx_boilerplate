import 'package:flutter_getx_boilerplate/modules/books/books_controller.dart';
import 'package:get/get.dart';

class BooksBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BooksController>(BooksController(), permanent: true);
  }
}
