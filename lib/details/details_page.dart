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

    final DetailsPageNavArgs args = ModalRoute.of(context).settings.arguments;

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
            RoundNetWorkImage(
              args.image,
              height: 160,
              width: 160,
              borderColor: Colors.red,
              borderWidth: 1,
            ),
            SizedBox(height: 10,) ,

            Text(args.title , textAlign: TextAlign.center , style: TextStyle(
              color: Colors.white , fontSize: 20
            ),)
          ],
        ),
      ),
    );
  }
}
