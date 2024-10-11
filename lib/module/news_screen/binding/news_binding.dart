import 'package:get/get.dart';
import 'package:news_app/module/home/home_controller.dart';
import 'package:news_app/module/news_screen/news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController());
  }

}
