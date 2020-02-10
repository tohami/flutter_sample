import 'package:flutter/material.dart';
import 'package:sample_one/details/details_page.dart';

import 'home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/" : (context) => HomePage() ,
        DetailsPage.ROUTE_NAME : (context) => DetailsPage() ,
      },
    );
  }
}