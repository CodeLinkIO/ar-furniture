import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize * 14.5, //145
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: product.id == '1'
                      ? Image.asset(
                          'assets/images/chair2.png',
                        )
                      : FadeInImage.assetNetwork(
                          placeholder: "assets/spinner.gif",
                          image: product.image,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            SizedBox(height: defaultSize / 2),
            TitleText(title: product.title),
            SizedBox(height: defaultSize / 2),
            Text("\$${product.price}"),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
