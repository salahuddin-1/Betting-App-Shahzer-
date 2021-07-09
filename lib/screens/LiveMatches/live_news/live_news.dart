import 'package:flutter/material.dart';
import 'package:news_app/Services/api_service.dart';
import 'package:news_app/model/article_model.dart';

import 'live_news_body.dart';

class LiveNews extends StatelessWidget {
  final ApiService _apiService = new ApiService();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 20, bottom: 10),
          child: Text(
            "Latest News",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
        ),
        FutureBuilder(
          future: _apiService.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data;

              return Container(
                height: 400,
                // width: 300,
                child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (ctx, index) {
                    return LiveNewsBody(
                      imageUrl: articles[index].urlToImage,
                      source: articles[index].source.name,
                      headline: articles[index].title,
                    );
                  },
                ),
              );
            }

            return CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
