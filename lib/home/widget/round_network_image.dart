
import 'package:flutter/material.dart';

class RoundNetWorkImage extends StatelessWidget {
  final String url;
  final double borderWidth ;
  final Color borderColor ;
  final double width ;
  final double height;


  RoundNetWorkImage(this.url , {this.borderWidth , this.borderColor , this.width , this.height}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
          Border.all(color: borderColor, width: borderWidth),
          image: DecorationImage(
              image: NetworkImage(url))),
    );
  }
}
