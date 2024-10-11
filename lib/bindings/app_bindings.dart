import 'package:get/get.dart';
import 'package:news_app/module/news_screen/news_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<NewsController>(() => NewsController());
  }

}
