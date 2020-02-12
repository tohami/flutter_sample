import 'package:flutter/material.dart';
import 'package:sample_one/details/nav_args.dart';
import 'package:sample_one/home/widget/round_network_image.dart';

class DetailsPage extends StatefulWidget {
  static const String ROUTE_NAME = "/details";

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //todo extract the nav args data

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("News Details"),
      ),
      drawer: Container(),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/news_list_bg.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            // todo display the title and image
          ],
        ),
      ),
    );
  }
}
