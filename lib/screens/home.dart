import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tilda_recipes/themes/app_theme.dart';
import 'package:tilda_recipes/widgets/carousel.dart';
import 'package:tilda_recipes/widgets/categories.dart';
import 'package:tilda_recipes/widgets/researche_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: AppColors.primary),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: AppColors.gris,
              backgroundImage: AssetImage("assets/images/avatar.png"),
              radius: 50,
            ),
          ),
        ),
        title: Image.asset("assets/images/title_img.png", height: 118),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grisatre,
            ),
            child: IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.bell),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            ResearchInput(),
            SizedBox(height: 20),
            AutoCarousel(),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Categories",
                style: AppTheme.lightTheme.textTheme.headlineLarge,
                // textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 20),
            Categories(),
          ],
        ),
      ),
    );
  }
}
