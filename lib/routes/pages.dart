import 'package:get/get.dart';
import 'package:news_app/module/home/binding/home_binding.dart';
import 'package:news_app/module/home/homepage.dart';
import 'package:news_app/routes/routes.dart';

class Pages {
  static final pages = [
    GetPage(
        name: Routes.initial,
        page: () => Homepage(),
        binding: HomeBinding()
    ),
  ];
}
