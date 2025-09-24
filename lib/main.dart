import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tilda_recipes/providers/category_provider.dart';
import 'package:tilda_recipes/screens/home.dart';
import 'package:tilda_recipes/screens/onboarding.dart';
import 'package:tilda_recipes/themes/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool("onboarding_seen") ?? false;
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CategoryProvider())],
      child: MyApp(seenOnboarding: seenOnboarding),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;
  const MyApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: seenOnboarding ? HomeScreen() : Onboarding(),
    );
  }
}
