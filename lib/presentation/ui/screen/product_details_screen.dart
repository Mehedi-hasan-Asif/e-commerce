import 'package:crafty_bay/presentation/ui/widgets/colors_picker.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/size_picker.dart';
import 'package:crafty_bay/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildProductDetails(),
          ),
          _buildPriceAndAddToCardSection()
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProductImageSlider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameAndQuantitySection(),
                const SizedBox(
                  height: 4,
                ),
                _buildRatingAndReviewSystem(),
                const SizedBox(
                  height: 8,
                ),
                ColorPicker(
                  colors: const [
                    Colors.yellow,
                    Colors.blue,
                    Colors.red,
                    Colors.green
                  ],
                  onSelectedColors: (color) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                SizePicker(
                  sizes: const ['M', 'L', 'XL', 'XXL'],
                  onSizeSelected: (String selectedSize) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildDescriptionSection(),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  '''Step into effortless style and comfort with our Stylish Comfort Sneakers. Perfect for everyday wear, these shoes combine modern design with practical features, making them your go-to footwear for any occasion.Made with lightweight, breathable materials to keep your feet cool.Extra padding for all-day comfort, perfect for long walks or standing.Non-slip rubber sole for excellent traction on various surfaces.Feel free to adjust any details to better fit your brand or product! If you have specific features or a target audience in mind, I can refine the description further. ''',
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  Row _buildNameAndQuantitySection() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Nike Shoe 2024 latest model-New year special deal',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ItemCount(
            initialValue: 1,
            minValue: 1,
            maxValue: 20,
            decimalPlaces: 0,
            color: AppColors.themeColor,
            onChanged: (value) {}),
      ],
    );
  }

  Widget _buildRatingAndReviewSystem() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              '4.9',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
            )
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Reviews',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: AppColors.themeColor),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Card(
          color: AppColors.themeColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.favorite_border_outlined,
              size: 16,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPriceAndAddToCardSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price'),
              Text(
                '\$100',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor),
              )
            ],
          ),
          SizedBox(
              width: 140,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Add to Cart')))
        ],
      ),
    );
  }
}
