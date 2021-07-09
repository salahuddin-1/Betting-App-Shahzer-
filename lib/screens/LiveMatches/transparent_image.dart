import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Constants/device_parameters.dart';
import 'package:news_app/Widgets/header.dart';

class TransparentImage extends StatelessWidget {
  final Orientation orientation;

  const TransparentImage({Key key, this.orientation}) : super(key: key);

  height() {
    if (orientation == Orientation.portrait) return Device.height * 0.3;
    return Device.width * 0.3;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(),
      child: Stack(
        children: [
          image(),
          blurryContainer(),
        ],
      ),
    );
  }

  Widget image() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/image2.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    );
  }

  Widget blurryContainer() {
    return BlurryContainer(
      blur: 2,
      bgColor: Colors.purple[900],
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
      child: Container(),
    );
  }
}
