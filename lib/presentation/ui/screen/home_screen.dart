import 'package:crafty_bay/presentation/stateholder/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/stateholder/category_list_controller.dart';
import 'package:crafty_bay/presentation/stateholder/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/stateholder/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/stateholder/special_product_list_controller.dart';

import 'package:crafty_bay/presentation/ui/widgets/center_circullarProgress_indicator.dart';

import 'package:crafty_bay/presentation/ui/widgets/home/app_bar_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/horizontal_categories_listview.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/horizontal_product_listview.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/search_text_field.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/section_header.dart';
import 'package:crafty_bay/presentation/ui/widgets/home_banner_slider.dart';
import 'package:crafty_bay/presentation/utils/assets_path.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              SearchTextField(textEditingController: TextEditingController()),
              const SizedBox(height: 16),
              const HomeBannerSlider(),
              const SizedBox(height: 16),
              _buildCategoriesSection(),
              _buildPopularProductsSection(),
              const SizedBox(height: 16),
              _buildNewProductsSection(),
              const SizedBox(height: 16),
              _buildSpecialProductsSection(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularProductsSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Popular',
          onTap: () {},
        ),
        SizedBox(
          height: 180,
          child: GetBuilder<PopularProductListController>(
              builder: (popularProductListController) {
            return Visibility(
              visible: !popularProductListController.inProgress,
              replacement: const CenteredCircularProgressIndicator(),
              child: HorizontalProductListView(
                productList: popularProductListController.productList,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildNewProductsSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'New',
          onTap: () {},
        ),
        SizedBox(
          height: 180,
          child: GetBuilder<NewProductListController>(
              builder: (newProductListController) {
            return Visibility(
              visible: !newProductListController.inProgress,
              replacement: const CenteredCircularProgressIndicator(),
              child: HorizontalProductListView(
                productList: newProductListController.productList,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSpecialProductsSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Special',
          onTap: () {},
        ),
        SizedBox(
          height: 180,
          child: GetBuilder<SpecialProductListController>(
              builder: (specialProductListController) {
            return Visibility(
              visible: !specialProductListController.inProgress,
              replacement: const CenteredCircularProgressIndicator(),
              child: HorizontalProductListView(
                productList: specialProductListController.productList,
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Categories',
          onTap: () {
            Get.find<BottomNavBarController>().selectCategory();
          },
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: GetBuilder<CategoryListController>(
              builder: (categoryListController) {
            return Visibility(
              visible: !categoryListController.inProgress,
              replacement: const CenteredCircularProgressIndicator(),
              child: HorizontalCategoryListView(
                categoryList: categoryListController.categoryList,
              ),
            );
          }),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions: [
        AppBarIconButton(
          iconData: Icons.person,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          iconData: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          iconData: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}
