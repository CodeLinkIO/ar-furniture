import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/services/fetchCategories.dart';
import 'package:furniture_app/services/fetchProducts.dart';
import 'package:furniture_app/size_config.dart';

import '../../../constants.dart';
import 'categories.dart';
import 'recommond_products.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    // It enables scrolling
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: defaultSize,
              ),
              buildAppBar(),
              SizedBox(
                height: defaultSize,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TitleText(
                  title: "Browse by Categories",
                ),
              ),
              SizedBox(
                height: defaultSize,
              ),
              FutureBuilder(
                future: fetchCategories(),
                builder: (context, snapshot) => snapshot.hasData
                    ? Categories(categories: snapshot.data)
                    : Center(child: Image.asset("assets/ripple.gif")),
              ),
              SizedBox(
                height: defaultSize,
              ),
              Divider(
                height: 5,
                color: Color(0xFFD5D7D6),
              ),
              SizedBox(
                height: defaultSize,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TitleText(title: "Recommands For You"),
              ),
              SizedBox(
                height: defaultSize,
              ),
              // Right Now product is our demo product
              FutureBuilder(
                future: fetchProducts(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultSize / 2),
                          child: RecommandProducts(products: snapshot.data))
                      : Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/menu.svg",
            height: SizeConfig.defaultSize, //20
          ),
          onPressed: () {},
        ),
        SvgPicture.asset(
          "assets/icons/codelink.svg",
          height: SizeConfig.defaultSize * 2.4,
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/scan.svg",
            height: SizeConfig.defaultSize * 2.4, //24
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
