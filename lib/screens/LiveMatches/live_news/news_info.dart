import 'package:flutter/material.dart';

class NewsInfo extends StatelessWidget {
  final String headline;
  final String time;
  final String source;

  const NewsInfo({
    Key key,
    this.headline,
    this.time,
    this.source,
  }) : super(key: key);

  final grey = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 300,
            
            child: Text(
              headline,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                
              ),
            ),
          ),
          Container(
            // color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1d",
                  style: TextStyle(
                    color: grey,
                    
                  ),
                ),
                Text(
                  source,
                  style: TextStyle(
                    color: grey,
                    
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // width: 100,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
    );
  }
}
