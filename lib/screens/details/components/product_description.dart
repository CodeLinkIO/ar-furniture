import 'package:flutter/material.dart';
import 'package:furniture_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      padding: EdgeInsets.only(
        top: defaultSize * 2, //90
        left: defaultSize * 2, //20
        right: defaultSize * 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultSize * 1.2),
          topRight: Radius.circular(defaultSize * 1.2),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                product.subTitle,
                style: TextStyle(
                  fontSize: defaultSize * 1.8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: defaultSize * 2),
              Text(
                product.description,
                style: TextStyle(
                  color: kTextColor.withOpacity(0.7),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
