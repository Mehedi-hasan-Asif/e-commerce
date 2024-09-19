import 'package:crafty_bay/presentation/stateholder/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/stateholder/category_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circullarProgress_indicator.dart';


import 'package:crafty_bay/presentation/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/all_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            SearchTextField(textEditingController: TextEditingController()),
            const SizedBox(
              height: 16,
            ),
            const HomeBannerSlider(),
            const SizedBox(
              height: 16,
            ),
            _buildCategoriesSection(),
            _buildProductPopularSection(),
            const SizedBox(
              height: 16,
            ),
            _buildProductNewSection(),
            const SizedBox(
              height: 16,
            ),
            _buildProductSpecialSection(),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductPopularSection() {
    return Column(children: [
      SectionHeader(
        title: 'Popular',
        onTap: () {},
      ),
      const SizedBox(
        height: 180,
        child: HorizontalProductListView(),
      )
    ]);
  }

  Widget _buildProductNewSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'New',
          onTap: () {},
        ),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(),
        )
      ],
    );
  }

  Widget _buildProductSpecialSection() {
    return Column(
      children: [
        SectionHeader(
          title: 'Special',
          onTap: () {},
        ),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(),
        )
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
        const SizedBox(
          height: 8,
        ),
         SizedBox(height: 120, child: GetBuilder<CategoryListController>(
          builder: (categoryListController) {
            return Visibility(
              visible: !categoryListController.inProgress,
              replacement: const CenterCircullarprogressIndicator(),
              child: HorizontalCategoriesListView(
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
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          iconData: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          iconData: Icons.notifications_active_outlined,
          onTap: () {},
        )
      ],
    );
  }
}
