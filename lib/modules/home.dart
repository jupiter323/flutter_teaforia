import 'package:flutter/material.dart';
import 'package:myapp/modules/tabs/first.dart';
import 'package:myapp/modules/tabs/teatab/teatab.dart';
import 'package:myapp/modules/tabs/third.dart';
import 'package:myapp/modules/tabs/fourth.dart';

class HomeScreen extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  /*
   *-------------------- Setup Tabs ------------------*
   */
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  Container getTabBar() {
    return new Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              // bottomLeft
              offset: Offset(-2.5, -2.5),
              color: Color(0xffe8e8e8)),
          BoxShadow(
              // bottomRight
              offset: Offset(2.5, -2.5),
              color: Color(0xffe8e8e8)),
          BoxShadow(
              // topRight
              offset: Offset(2.5, 2.5),
              color: Color(0xffe8e8e8)),
          BoxShadow(
              // topLeft
              offset: Offset(-2.5, 2.5),
              color: Color(0xffe8e8e8))
        ]),
        child: TabBar(
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          indicatorWeight: 0.1,
          tabs: <Tab>[
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.favorite, color: Colors.grey),
              text: "FAVORITES",
            ),
            new Tab(
              icon: new Icon(Icons.invert_colors, color: Colors.grey),
              text: "TEAS",
            ),
            new Tab(
              icon: new Icon(Icons.account_box, color: Colors.grey),
              text: "ACCOUNT",
            ),
            new Tab(
              icon: new Icon(Icons.settings, color: Colors.grey),
              text: "SETTINGS",
            )
          ],
          // setup the controller
          controller: controller,
        ));
  }

  TabBarView getTabBarView(var tabs) {
    return new TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  /*
   *-------------------- Setup the page by setting up tabs in the body ------------------*
   */
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // Appbar
        // appBar: new AppBar(
        //   // Title
        //   // title: new Text("Davids Tea"),
        //   // Set the background color of the App Bar
        //   backgroundColor: Colors.blue,
        //   // Set the bottom property of the Appbar to include a Tab Bar)
        // ),
        // Set the TabBar view as the body of the Scaffold
        body: getTabBarView(
            <Widget>[new First(), new TeatabPage(), new Third(), new Fourth()]),
        bottomNavigationBar: getTabBar());
  }
}
