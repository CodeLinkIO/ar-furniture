import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/models/Categories.dart';
import 'package:shimmer_image/shimmer_image.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key key,
    // It means we have  to add category
    @required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize / 2), //20
      child: SizedBox(
        width: defaultSize * 14.5, //205
        child: Column(
          children: <Widget>[
            // This is custom Shape thats why we need to use ClipPath
            AspectRatio(
              aspectRatio: 1,
              child: ClipPath(
                clipper: CategoryCustomShape(),
                child: ProgressiveImage(
                  image: category.image,
	                fit: BoxFit.cover,
	                width: defaultSize * 14.5,
	                height: defaultSize * 14.5,
                ),
              ),
            ),
            SizedBox(height: defaultSize / 2),
            TitleText(title: category.title),
            SizedBox(height: defaultSize / 2),
            Text(
              "${category.numOfProducts}+ Products",
              style: TextStyle(
                color: kTextColor.withOpacity(0.6),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
