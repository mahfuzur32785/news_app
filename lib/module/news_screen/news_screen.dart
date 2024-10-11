
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/module/news_screen/news_controller.dart';
import 'package:news_app/widget/custom_image.dart';

class NewsScreen extends GetView<NewsController> {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: controller.newsArticles.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.5,
                  child: CustomImage(
                    path: "${controller.newsArticles[index].image}",
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ),

              ],
            ),
            // Bottom Overlay with rounded corners
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.5,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Posted by ${controller.newsArticles[index].postedBy} at ${controller.newsArticles[index].postedDate}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${controller.newsArticles[index].desc}",
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Source: ${controller.newsArticles[index].sourceName}, ${controller.newsArticles[index].postedDate}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: -8,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Colors.grey.shade400,
                                width: 1
                            )
                        ),
                        child: const Text("Daily Topper", style: TextStyle(
                            fontSize: 10,
                            color: Colors.black
                        ),),
                      ))
                ],
              ),
            ),
            Positioned(
              top: 320,
              // bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                child: Text(
                    "${controller.newsArticles[index].title}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
              ),),
          ],
        );
      },
    );
  }
}
