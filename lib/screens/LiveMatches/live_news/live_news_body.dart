import 'package:flutter/material.dart';

import 'news_image.dart';
import 'news_info.dart';

class LiveNewsBody extends StatelessWidget {
  final String imageUrl;
  final String headline;
  // final String time;
  final String source;


  const LiveNewsBody({Key key, this.imageUrl, this.source,this.headline}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 150,
            child: Row(
              children: [
                NewsImage(
                  imageUrl: imageUrl,
                ),
                Expanded(
                  child: NewsInfo(
                    headline: this.headline,
                    source: this.source,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 30,
            thickness: 0.3,
          ),
        ],
      ),
    );
  }
}
