import 'package:flutter/material.dart';
import 'package:sample_one/home/widget/round_network_image.dart';
import 'package:sample_one/model/news_item.dart';

class NewsItemWidget extends StatelessWidget {
  final NewsItem _item;
final Function _onItemClicked;
  NewsItemWidget(this._item, this._onItemClicked);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: GestureDetector(
            onTap: ()=> this._onItemClicked(),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white.withAlpha(180),
              margin: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
              child: Container(
                height: 100,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    //news image
                    RoundNetWorkImage(
                      _item.imageUrl,
                      height: 80,
                      width: 80,
                      borderColor: Colors.red,
                      borderWidth: 1,
                    ),
                    SizedBox(
                      width: 20,
                    ),

                    //title and info
                    Expanded(
                      child: Container(
                        height: 80,
                        child: Column(
                          children: <Widget>[
                            //title
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 48),
                                child: Text(
                                  _item.newsTitle,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                            //info
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "Likes(${_item.likes})",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("${_item.numOfViews} Views",
                                    style: TextStyle(color: Colors.redAccent)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        //label
        Positioned(
            right: 10,
            top: 20,
            child: _item.newsType == "85"
                ? Image.asset("assets/images/news_video_label.png", width: 64)
                : Image.asset("assets/images/news_article_label.png",
                    width: 64))
      ],
    );
  }
}
