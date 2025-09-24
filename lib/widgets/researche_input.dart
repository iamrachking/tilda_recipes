import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tilda_recipes/themes/app_theme.dart';

class ResearchInput extends StatefulWidget {
  const ResearchInput({super.key});

  @override
  State<ResearchInput> createState() => _ResearchInputState();
}

class _ResearchInputState extends State<ResearchInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grisatre,
        hintText: "Search recipes...",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        hintStyle: AppTheme.lightTheme.textTheme.bodyMedium,
        prefixIcon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          size: 18,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
