import 'package:flutter/material.dart';

AppBar NewsListAppBar() => AppBar(
      backgroundColor: Colors.redAccent,
      title: Text("News"),
      actions: <Widget>[
        IconButton(
            icon: Image.asset("assets/images/ic_filter.png"), onPressed: null)
      ],
    );
