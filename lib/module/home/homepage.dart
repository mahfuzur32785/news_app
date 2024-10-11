import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/values/app_colors.dart';
import 'package:news_app/module/home/home_controller.dart';
import 'package:news_app/module/news_screen/news_controller.dart';
import 'package:news_app/widget/custom_image.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () => controller.onBackPressed(context),
          child: Scaffold(
            key: scaffoldKey,
            drawer: HomeDrawer(),
            backgroundColor: Colors.white,
            body: PageView(
              controller: controller.pageController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              children: controller.screenList,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              backgroundColor: AppColors.mainColor,
              fixedColor: Colors.white,
              unselectedItemColor: Colors.white60,
              elevation: 3,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.white60),
              onTap: (index) {
                  if (index == 3) {
                    scaffoldKey.currentState!.openDrawer();
                  }else{
                    controller.changePage(index);
                    controller.pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }

              },
              currentIndex: controller.pageIndex,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: AppColors.mainColor,
                  icon: const Icon(Icons.home),
                  label: "",
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColors.mainColor,
                  icon: const Icon(Icons.library_books_sharp),
                  label: "",
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColors.mainColor,
                  icon: const Icon(Icons.notifications),
                  label: "",
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColors.mainColor,
                  icon: const Icon(Icons.person),
                  label: "",
                ),
                // BottomNavigationBarItem(
                //   backgroundColor: AppColors.mainColor,
                //   icon: const Icon(Icons.account_circle_rounded),
                //   label: "Settings",
                // ),
              ],
            ),
            extendBodyBehindAppBar: false,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Container(
              height: 70,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(image: AssetImage("assets/images/ad_image.png"), fit: BoxFit.cover)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Paris Olympiad 2024",style: TextStyle(
                        color: Colors.white,fontSize: 14, fontWeight: FontWeight.bold
                      ),),
                      Text("Related News",style: TextStyle(
                        color: Colors.white,fontSize: 10, fontWeight: FontWeight.normal
                      ),),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white,)
                ],
              ),

            ),
          ),
        );
      },
    );
  }
}


class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final HomeController homeCardsController = Get.find();

  final NewsController newsController = Get.find();

  CarouselSliderController carouselController = CarouselSliderController();
  final int initialPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color: const Color(0xFFFFFFFF),
        height: MediaQuery.of(context).size.height,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Daily Topper",
                            style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Stay on race",
                            style: TextStyle(color: Colors.black54, fontSize: 10, fontStyle: FontStyle.italic),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.trending_up,color: Colors.grey.shade900,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Trending",
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.star,color: Colors.grey.shade900,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Top 10 Today",
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.bookmark,color: Colors.grey.shade900,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Archived News",
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.edit_note,color: Colors.grey.shade900,),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Market News",
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.normal,
                        fontSize: 16
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.normal,
                        fontSize: 18
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.normal,
                            fontSize: 16
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 18,)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),

            Container(
              height: 100,
              child: CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  height: 360,
                  initialPage: initialPage,
                  autoPlay: false,
                  viewportFraction: 0.35,
                  onPageChanged: callbackFunction,
                  padEnds : false,
                ),
                items: newsController.newsArticles.map((i) {
                  return Container(
                    height: 50,
                    width: 100,
                    child: ClipRRect(borderRadius:BorderRadius.circular(5),child: CustomImage(path: i.image, fit: BoxFit.cover,)),
                  );
                }).toList(),
              )
              /*ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: newsController.newsArticles.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          width: 100,
                          child: CustomImage(path: newsController.newsArticles[index].image, fit: BoxFit.cover,),
                        );

                      },
                    )*/,
            ),

            SizedBox(height: 20,),

            Expanded(
              // height: 400,
              child: PageView.builder(
                itemBuilder: (context, index) {
                return ListView.builder(
                  itemCount: newsController.newsArticles.length,
                  itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CustomImage(path: "${newsController.newsArticles[i].image}", height: 40, width: 60, fit: BoxFit.cover,),
                            SizedBox(width: 10,),
                            Text(newsController.newsArticles[i].title??"",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width,
                      )
                    ],
                  );
                },);
              },),
            )
          ],
        ),
      ),
    );
  }

  int currentIndex = 0;

  void callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {
      currentIndex = index;
    });
  }
}
