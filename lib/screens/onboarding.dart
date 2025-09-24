import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tilda_recipes/screens/home.dart';
import 'package:tilda_recipes/themes/app_theme.dart';
import 'package:tilda_recipes/widgets/onboarding_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPage = 0;
  final PageController controller = PageController();
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding_1_r.png",
      "title": "Discover Delicious Recipes",
      "text":
          "Explore a world of culinary delights with Tilda. Find recipes for every occasion, from quick weeknight dinners to gourmet feasts.",
    },
    {
      "image": "assets/images/onboarding_2_r.png",
      "title": "Share Your Culinary Creations",
      "text":
          "Connect with fellow food enthusiasts and share your favorite recipes with the world.",
    },
    {
      "image": "assets/images/onboarding_4_r.png",
      "title": "Unleash Your Inner Chef",
      "text":
          "Discover, create, and share your culinary masterpieces with a vibrant community of food enthusiasts.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) => {
              setState(() {
                currentPage = index;
              }),
            },
            itemBuilder: (context, index) {
              return OnboardinPage(
                image: onboardingData[index]['image']!,
                title: onboardingData[index]['title']!,
                text: onboardingData[index]['text']!,
              );
            },
          ),
          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  spacing: 6,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      // margin: EdgeInsets.symmetric(horizontal: 5),
                      width: currentPage == index ? 20 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: currentPage == index
                            ? AppColors.primary
                            : AppColors.gris,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(0),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (currentPage < onboardingData.length - 1) {
                        controller.nextPage(
                          duration: Duration(microseconds: 300),
                          curve: Curves.ease,
                        );
                      } else {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('onboarding_seen', true);
                        if (!mounted) return;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomeScreen()),
                        );
                      }
                    },
                    child: Text(
                      currentPage == onboardingData.length - 1
                          ? "Get Started"
                          : "Next",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
