import 'package:flutter_getx_boilerplate/modules/PhaseScreens/fetScreen.dart';
import 'package:flutter_getx_boilerplate/modules/PhaseScreens/foundationScreen.dart';
import 'package:flutter_getx_boilerplate/modules/PhaseScreens/intermediateScreen.dart';
import 'package:flutter_getx_boilerplate/modules/PhaseScreens/seniorScreen.dart';
import 'package:flutter_getx_boilerplate/modules/auth/auth.dart';
import 'package:flutter_getx_boilerplate/modules/books/book_detail.dart';
import 'package:flutter_getx_boilerplate/modules/books/books_bindings.dart';
import 'package:flutter_getx_boilerplate/modules/books/books_screen.dart';
//import 'package:flutter_getx_boilerplate/modules/gradesScreen/gradesScreen.dart';
import 'package:flutter_getx_boilerplate/modules/home/home_screen.dart';
//import 'package:flutter_getx_boilerplate/modules/home/home.dart';
import 'package:flutter_getx_boilerplate/modules/me/cards/cards_screen.dart';
import 'package:flutter_getx_boilerplate/modules/modules.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      children: [
        GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
        GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
      ],
    ),
    GetPage(
        name: Routes.MY_BOOKS,
        page: () => BooksScreen(),
        binding: BooksBinding()),
    GetPage(name: Routes.HOME, page: () => HomeScreen()),
    GetPage(name: Routes.BOOK_VIEW, page: () => BookViewScreen()),
    GetPage(name: Routes.FOUNDATION_PHASE, page: () => FoundationScreen()),
    GetPage(name: Routes.INTERMEDIATE_PHASE, page: () => IntermediateScreen()),
    GetPage(name: Routes.SENIOR_PHASE, page: () => SeniorScreen()),
    GetPage(name: Routes.FET_PHASE, page: () => FETScreen()),
    // binding: HomeBinding(),
  ];
}
