import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsImage extends StatelessWidget {
  final String imageUrl;

  const NewsImage({Key key, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
        image: DecorationImage(
          image: imageUrl == null
              ? AssetImage("assets/images/image2.jpg")
              : CachedNetworkImageProvider(
                  imageUrl,
                ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
