import 'package:flutter/material.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/screens/details/details_screen.dart';

import '../../../size_config.dart';
import 'product_card.dart';

class RecommandProducts extends StatelessWidget {
  const RecommandProducts({
    Key key,
    this.products,
  }) : super(key: key);
  // Because our Api provie us list of products
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GridView.builder(
      // We just turn off grid view scrolling
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // just for demo
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            SizeConfig.orientation == Orientation.portrait ? 2 : 4,
        mainAxisSpacing: defaultSize,
        crossAxisSpacing: defaultSize,
        childAspectRatio: SizeConfig.isWeb && SizeConfig.screenWidth > SizeConfig.screenHeight ? 0.77 : 0.7,
      ),
      itemBuilder: (context, index) => ProductCard(
          product: products[index],
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    product: products[index],
                  ),
                ));
          }),
    );
  }
}
