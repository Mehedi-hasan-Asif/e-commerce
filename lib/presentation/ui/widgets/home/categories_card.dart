import 'package:crafty_bay/data/models/category_model.dart';
import 'package:crafty_bay/presentation/ui/screen/product_list_screen.dart';
import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    super.key, required this.categoryModel,
  });
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () =>  ProductListScreen(CategoryName: categoryModel.categoryName ?? ''),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Image.network(categoryModel.categoryImg ?? '')
          ),
          const SizedBox(
            height: 4,
          ),
           Text(
            categoryModel.categoryName ?? '',
            style:const  TextStyle(color: AppColors.themeColor),
          )
        ],
      ),
    );
  }
}
