import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/news_model.dart';

class NewsController extends GetxController {

  PageController? pageController;


  final List<NewsModel> newsArticles = [
    NewsModel(
      image: "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg",
      title: "New Tech Advances in 2024",
      desc: "A look at the latest technology trends this year. "
          "From AI innovations to advancements in renewable energy, "
          "the tech world is buzzing with new developments. "
          "Experts believe these changes could reshape industries. "
          "Stay updated with what’s on the horizon in 2024.",
      postedBy: "John Doe",
      postedDate: DateTime.now(),
      sourceName: "Tech World",
    ),
    NewsModel(
      image: "https://media.istockphoto.com/id/1470127912/photo/pick-me-up.jpg?s=612x612&w=0&k=20&c=iXwxzhFNG8FjuzNrWmVBGTxKtKn4yKVC9yOdYZG2xTo=",
      title: "Global Markets Today",
      desc: "Stock markets see a major shift amid global events. "
          "Investors are closely watching geopolitical tensions "
          "and economic policy changes. Analysts suggest caution "
          "as the market reacts to these unpredictable changes. "
          "Read more about today’s market movements.",
      postedBy: "Jane Smith",
      postedDate: DateTime.now(),
      sourceName: "Financial Times",
    ),
    NewsModel(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc9APxkj0xClmrU3PpMZglHQkx446nQPG6lA&s",
      title: "Climate Change: What You Can Do",
      desc: "Climate change is a pressing global issue. "
          "Small actions by individuals can make a big difference. "
          "From reducing waste to conserving water, everyone has a role. "
          "Learn practical tips for a more sustainable lifestyle. "
          "Together, we can help combat climate change.",
      postedBy: "Green Earth",
      postedDate: DateTime.now(),
      sourceName: "Eco News",
    ),
    NewsModel(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_FWF2judaujT30K9sMf-tZFhMWpgP6xCemw&s",
      title: "Travel Tips for 2024",
      desc: "Top destinations and travel hacks for your next trip. "
          "Explore new places without breaking the bank. "
          "From packing tips to finding affordable stays, "
          "these expert suggestions will make your travels smoother. "
          "Get ready for your next adventure with confidence.",
      postedBy: "Travel Guru",
      postedDate: DateTime.now(),
      sourceName: "Wanderlust Weekly",
    ),
    NewsModel(
      image: "https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d5f8845dc.jpeg",
      title: "The Future of Electric Cars",
      desc: "Electric vehicles are no longer a concept of the future. "
          "With major automakers joining the EV revolution, "
          "there’s a range of options for consumers. "
          "This article explores the latest models and features, "
          "and how they could transform the automotive industry.",
      postedBy: "Auto Insider",
      postedDate: DateTime.now(),
      sourceName: "Car & Drive",
    ),
    NewsModel(
      image: "https://pixlr.com/images/generator/text-to-image.webp",
      title: "Healthy Eating Habits",
      desc: "Nutrition tips for a balanced lifestyle are essential. "
          "Understanding what to eat can lead to better health. "
          "This guide breaks down the importance of various nutrients, "
          "suggesting meal ideas for every diet. "
          "Embrace healthier choices for a better you.",
      postedBy: "Health Matters",
      postedDate: DateTime.now(),
      sourceName: "Wellness Daily",
    ),
    NewsModel(
      image: "https://thumbs.dreamstime.com/b/falling-drop-rain-blue-earth-image-water-splash-crown-shape-water-splash-crown-shape-falling-drop-earth-140453719.jpg",
      title: "AI and the Job Market",
      desc: "Artificial intelligence is reshaping the job landscape. "
          "While some fear job losses, others see new opportunities. "
          "This article discusses how AI is impacting various industries, "
          "and what skills are becoming increasingly valuable. "
          "Stay ahead of the curve with insights into the future of work.",
      postedBy: "Tech Innovators",
      postedDate: DateTime.now(),
      sourceName: "Digital Today",
    ),
    NewsModel(
      image: "https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455_1280.jpg",
      title: "The Rise of E-Sports",
      desc: "E-sports are becoming a global phenomenon. "
          "From tournaments to professional leagues, "
          "gamers are now competing for million-dollar prizes. "
          "This article explores the growth of e-sports and its impact on the industry. "
          "Is it the future of entertainment? Find out here.",
      postedBy: "Gaming Hub",
      postedDate: DateTime.now(),
      sourceName: "Game World",
    ),
  ];

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
