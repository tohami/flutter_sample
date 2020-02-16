import 'package:flutter/material.dart';
import 'package:sample_one/api/api.dart';
import 'package:sample_one/details/details_page.dart';
import 'package:sample_one/details/nav_args.dart';
import 'package:sample_one/home/widget/news_item.dart';
import 'package:sample_one/home/widget/news_list_app_bar.dart';
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
    _changeStatus(DataState(status: Status.LOADING));

    getNewsList().then((data) {
      _changeStatus(DataState(status: Status.SUCCESS, data: data));
    }).catchError((_) {
      _changeStatus(
          DataState(status: Status.ERROR, error: "Something went wrong!!"));
    });
  }

  void _changeStatus(DataState<List<NewsItem>> status) {
    setState(() {
      _status = status;
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
      appBar: NewsListAppBar(),
      drawer: Container(),
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
                      return NewsItemWidget(item , ()=> navigateToDetails(item));
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

  navigateToDetails(NewsItem item) {
    var args = DetailsPageNavArgs(item.nid , item.imageUrl , item.newsTitle) ;
    Navigator.of(context).pushNamed(DetailsPage.ROUTE_NAME , arguments: args) ;
  }
}
