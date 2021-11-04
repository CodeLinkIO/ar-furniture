import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/home/components/body.dart';
import 'package:furniture_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It help us to  make our UI responsive
    SizeConfig().init(context);
    return Scaffold(
//        appBar: buildAppBar(),
      body: Align(
	      alignment: Alignment.topCenter,
        child: Container(
            constraints: BoxConstraints(maxWidth: 1240),
            child: Body()),
      ),
    );
  }
}
