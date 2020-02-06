import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

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
    setState(() {
      this._currentPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( pagesInfo[_currentPageIndex].title ),
        actions: <Widget>[
          _currentPageIndex !=0 ? IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              _setCurrentPage(0) ;
            },
          ) : Container()
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
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
          pagesInfo[_currentPageIndex].description,
          style: TextStyle(
            fontSize: 18 ,
            color: Colors.black54
          ),
        ),
      ),
    );
  }
}

class PageInfo {
  String title ;
  String description ;

  PageInfo(String title, String description){
    this.title = title ;
    this.description = description ;
  }
}
