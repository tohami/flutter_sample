import 'package:flutter/material.dart';
import 'package:sample_one/api/api.dart';
import 'package:sample_one/model/DataStatus.dart';
import 'package:sample_one/model/news_item.dart';
import 'package:sample_one/model/status.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataState<List<NewsItem>> _status = DataState(status: Status.IDLE);

  void _getData() {
    getNewsList().then((data) {
      setState(() {
        _status = DataState(status: Status.SUCCESS, data: data);
      });
    }).catchError((_) {
      setState(() {
        _status =
            DataState(status: Status.ERROR, error: "Something Went wrong");
      });
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News List"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/news_list_bg.png"),
                fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            //result
            _status.status == Status.SUCCESS
                ? ListView.builder(
                    itemCount: _status.data.length,
                    itemBuilder: (context, index) {
                      var item = _status.data[index];
                      return Stack(
                        children: <Widget>[
                          Container(
                            child: Card(
                              elevation: 6,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              margin: EdgeInsets.only(
                                  top: 10, right: 20, left: 20, bottom: 10),
                              child: Container(
                                height: 100,
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    //news image
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.red, width: 1),
                                          image: DecorationImage(
                                              image: NetworkImage(item.imageUrl))),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),

                                    //title and info
                                    Expanded(
                                      child: Container(
                                        height: 80,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            //title
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.only(right: 48),
                                                child: Text(
                                                  item.newsTitle,
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),

                                            //info
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text("Likes(${item.likes})"),
                                                Text("${item.numOfViews} Views"),
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
                          Positioned(
                            right: 10,
                              top:20,
                              child: item.newsType == "85"
                                  ?Image.asset("assets/images/news_video_label.png" , width: 64 )
                                  :Image.asset("assets/images/news_article_label.png" , width: 64 )
                          )
                        ],
                      );
                    })
                : Container(),

            //error
            _status.status == Status.ERROR
                ? Center(
                    child: Text(_status.error),
                  )
                : Container(),

            //loading
            _status.status == Status.LOADING
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
