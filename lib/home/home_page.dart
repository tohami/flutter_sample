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

  //home page status  with idle as initial state
  DataState<List<NewsItem>> _status = DataState(status: Status.IDLE);

  void _getData() {
    //todo get the data from api
  }

  void _changeStatus(DataState<List<NewsItem>> status) {
    //change the state
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
            //display list od news when success
            _status.status == Status.SUCCESS
                ? ListView.builder(
                    itemCount: _status.data.length,
                    itemBuilder: (context, index) {
                      var item = _status.data[index];
                      return NewsItemWidget(item , ()=> onListItemClicked(item));
                    })
                : Container(),

            //display error if status is error
            _status.status == Status.ERROR
                ? Center(
                    child: Text(_status.error),
                  )
                : Container(),

            //display loading is status is loading
            _status.status == Status.LOADING
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container()

            //no case for idle , so if status is idle the stack will be empty

          ],
        ),
      ),
    );
  }

  //handle list item click
  onListItemClicked(NewsItem item) {
    //todo on list item clicked navigate to details screen
  }
}
