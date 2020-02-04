import 'package:flutter/material.dart';

class WelcomeToFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: Text(
              "Weclome to flutter" ,
              style: TextStyle(
                fontSize: 24 
              ),
            ),
          )),
    );
  }
}

void main(){
  runApp(WelcomeToFlutter()) ;
}
