import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/values/app_colors.dart';
import 'package:news_app/module/news_screen/news_screen.dart';

class HomeController extends GetxController {

  int pageIndex = 0;
  var pageController = PageController(
    initialPage: 0,
  );

  void changePage(int index){
    pageIndex = index;
    update();
  }

  List<Widget> screenList = [
    NewsScreen(),
    Container(child: Center(child: Text("1")),),
    Container(child: Center(child: Text("2")),),
    Container(child: Center(child: Text("3")),),
  ];

  Future<bool> onBackPressed(context) async {
    if (pageIndex != 0) {
      changePage(0);
      pageController.jumpToPage(0);
      return false;
    } else {
      return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
          title: const Text('Are you sure you want to close application?',style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w400),),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'No',
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )),
          ],
        ),
      )) ??
          false;
    }
  }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
