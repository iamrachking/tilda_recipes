import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tilda_recipes/providers/category_provider.dart';
import 'package:tilda_recipes/themes/app_theme.dart';
import 'package:tilda_recipes/utils/global_variable.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryProvider>();
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: 200,
          width: double.infinity,
          child: categoryProvider.isloading
              ? Center(child: CircularProgressIndicator.adaptive())
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryProvider.categories.length,
                  itemBuilder: (context, index) {
                    final category = categoryProvider.categories[index];
                    return Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: AppColors.grisatre,
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                fixImageUrl(category.imageUrl),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          category.name,
                          style: AppTheme.lightTheme.textTheme.bodyLarge,
                        ),
                      ],
                    );
                  },
                ),
        );
      },
    );
  }
}
