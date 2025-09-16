import 'package:flutter/material.dart';
import 'package:tilda_recipes/themes/app_theme.dart';

class OnboardinPage extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const OnboardinPage({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              // color: Colors.green,
              image: DecorationImage(image: AssetImage(image)),
            ),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: AppTheme.lightTheme.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: AppTheme.lightTheme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
