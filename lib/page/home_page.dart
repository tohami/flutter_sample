
import 'package:flutter/material.dart';
import 'package:sample_one/model/PageInfo.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  //todo define the state

  List<PageInfo> pagesInfo = [
    PageInfo(
        "Home" ,
        "Hi, this is app entry point "
    ) ,
    PageInfo(
        "Market" ,
        "Find our best items with best price"
    ),
    PageInfo(
        "Profile" ,
        "View and edit your profile info"
    )
  ];


  void _setCurrentPage(int pageIndex) {
    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values.
    //todo use setState to update the state and rebuild the widget
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        //todo use the dynamic state to set the valid appBar title based on current tab
        title: Text("Home"),

        actions: <Widget>[
          //todo use the state to show home icon if current tab is not the home
           Container()
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        //todo use the state to set the current selected index
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home) ,
            title: Text("home") ,
          ) ,
          BottomNavigationBarItem(
              icon: Icon(Icons.store) ,
              title: Text("market")
          ) ,
          BottomNavigationBarItem(
              icon: Icon(Icons.person) ,
              title: Text("profile")
          )
        ],
        onTap: (index){
          _setCurrentPage(index) ;
        },
      ),

      body: Center(
        child: Text(
          //todo replace the static text with valid bage discription based on current selected tab
          "Page description",
          style: TextStyle(
              fontSize: 18 ,
              color: Colors.black54
          ),
        ),
      ),
    );
  }
}
