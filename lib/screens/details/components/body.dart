import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/size_config.dart';
import 'package:model_viewer/model_viewer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'product_description.dart';
import 'product_info.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool loaded = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        loaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
	    physics: NeverScrollableScrollPhysics(),
	    child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: Column(
          children: [
          	SizedBox(height: defaultSize,),
	          buildAppBar(context),
            ProductInfo(product: widget.product),
            SizedBox(height: defaultSize* 2,),
            ProductDescription(
              product: widget.product,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
	  return AppBar(
		  leading: IconButton(
			  icon: SvgPicture.asset("assets/icons/arrow-long-left.svg"),
			  onPressed: () {
				  Navigator.pop(context);
			  },
		  ),
		  title: SvgPicture.asset(
			  "assets/icons/codelink.svg",
			  height: SizeConfig.defaultSize * 2.4,
		  ),
	  );
  }
}
