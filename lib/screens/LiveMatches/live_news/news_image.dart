<<<<<<< HEAD
import 'package:flutter/material.dart';

class NewsImage extends StatelessWidget {

=======
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsImage extends StatelessWidget {
>>>>>>> 2892b94 (Second commit)
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
<<<<<<< HEAD
          image: imageUrl == null ? AssetImage("assets/images/image2.jpg") : NetworkImage(imageUrl),
=======
          image: imageUrl == null
              ? AssetImage("assets/images/image2.jpg")
              : CachedNetworkImageProvider(
                  imageUrl,
                ),
>>>>>>> 2892b94 (Second commit)
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
