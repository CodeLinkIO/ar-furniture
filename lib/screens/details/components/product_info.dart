import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));
    return Container(
      // color: Colors.black45,
	    height:  defaultSize * 28, //378,
      child: SafeArea(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(product.category.toUpperCase(), style: lightTextStyle),
              SizedBox(height: defaultSize),
              Text(
                product.title,
                style: TextStyle(
                  fontSize: defaultSize * 2.4, //24
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.8,
                  height: 1.4,
                ),
              ),
              SizedBox(height: defaultSize * 2),
              Text("Form", style: lightTextStyle),
              Text(
                "\$${product.price}",
                style: TextStyle(
                  fontSize: defaultSize * 1.6, //16
                  fontWeight: FontWeight.bold,
                  height: 1.6,
                ),
              ),
              SizedBox(height: defaultSize * 2), //20
              Text("Available Colors", style: lightTextStyle),
              Row(
                children: <Widget>[
                  buildColorBox(
                    defaultSize,
                    color: Color(0xFF7BA275),
                    isActive: true,
                  ),
                  buildColorBox(
                    defaultSize,
                    color: Color(0xFFD7D7D7),
                  ),
                  buildColorBox(
                    defaultSize,
                    color: kTextColor,
                  ),
                ],
              ),
	            
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              height: defaultSize * 28, //378
              width: defaultSize * 28,
              child: Hero(
                tag: product.id,
                child: EasyWebView(
                  src: "https://ar-furniture-ac1b7.web.app/chair.html",
                  // width: 100,
                  // height: 100,
                ),
//                  child: ModelViewer(
//                    backgroundColor: Colors.white,
//                    src: 'https://ar-furniture-ac1b7.web.app/chair.glb',
//                    alt: "A 3D model of an astronaut",
//                    ar: true,
//                    autoRotate: true,
//                    cameraControls: true,
//                    iosSrc: 'assets/3d_models/scene.gltf',
//                  ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Container buildColorBox(double defaultSize,
      {Color color, bool isActive = false}) {
    return Container(
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      // For  fixed value we can use cont for better performance
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: isActive ? SvgPicture.asset("assets/icons/check.svg") : SizedBox(),
    );
  }
}
