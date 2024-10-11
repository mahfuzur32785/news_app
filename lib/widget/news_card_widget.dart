
import 'package:flutter/material.dart';

class NewsArticleCard extends StatelessWidget {
  final String article;

  const NewsArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          article,
          style: TextStyle(color: Colors.white, fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
