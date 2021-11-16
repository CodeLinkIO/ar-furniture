import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/screens/web/web_screen.dart';
import 'package:furniture_app/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

// Thats means we have to  pass it
  const DetailsScreen({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Align(alignment: Alignment.topCenter, child: Body(product: product)),
    );
  }
}
