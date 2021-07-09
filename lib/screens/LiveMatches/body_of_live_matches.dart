import 'package:flutter/material.dart';
import 'package:news_app/Constants/device_parameters.dart';
import 'package:news_app/Widgets/header.dart';
import 'package:news_app/screens/LiveMatches/match_card/match_card.dart';

import 'live_news/live_news.dart';
import 'sports_card_list.dart';
import 'transparent_image.dart';

class BodyOfLiveMatches extends StatelessWidget {
  containers(Orientation orientation) {
    if (orientation == Orientation.portrait) return (Device.height);
    return (Device.width);
  }

  sportsCardPosition(Orientation orientation) {
    if (orientation == Orientation.portrait) return (Device.height * 0.3) - 54;
    return (Device.width * 0.3) - 54;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Container(
          height: Device.height,
          width: Device.width,
          child: ListView(
            padding: EdgeInsets.only(top: 0),
            children: [
              Container(
                height: 500,
                // color: Colors.green,
                child: Stack(
                  children: [
                    TransparentImage(
                      orientation: orientation,
                    ),
                    Positioned(
                      top: 40,
                      left: 10,
                      child: Header(
                        isLoginRegistration: false,
                      ),
                    ),
                    Positioned(
                      top: sportsCardPosition(orientation),
                      child: SportsCardList(),
                    ),
                    Positioned(
                      top: 290,
                      child: MatchCard(),
                    ),
                  ],
                ),
              ),
              LiveNews()
            ],
          ),
        );
      },
    );
  }
}
