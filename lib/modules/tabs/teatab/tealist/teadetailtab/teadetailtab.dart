import 'package:flutter/material.dart';
import 'package:myapp/modules/tabs/teatab/tealist/modal/contact.dart';
import 'allrecipes.dart';
import 'friends.dart';
import 'popular.dart';

class TeaDetailTab extends StatefulWidget {
  final ContactModal _contactModal;
  final brandItem;
  TeaDetailTab(this._contactModal, this.brandItem);
  @override
  TeaDetailTabState createState() =>
      new TeaDetailTabState(_contactModal, brandItem);
}

// SingleTickerProviderStateMixin is used for animation
class TeaDetailTabState extends State<TeaDetailTab>
    with SingleTickerProviderStateMixin {
  /*
   *-------------------- Setup Tabs ------------------*
   */
  final ContactModal _contactModal;
  final brandItem;
  TeaDetailTabState(this._contactModal, this.brandItem);
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return new TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.orange,
      tabs: <Tab>[
        new Tab(
          text: "Popular",
        ),
        new Tab(
          text: "All Recipes",
        ),
        new Tab(
          text: "Friends",
        )
      ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return new TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
      physics: new NeverScrollableScrollPhysics()
    );
  }

  /*
   *-------------------- Setup the page by setting up tabs in the body ------------------*
   */
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              _contactModal.fullName,
              style: TextStyle(color: Colors.black),
            ),
            new Text(
              brandItem["title"] + " | " + _contactModal.recipes + " recipes",
              style: TextStyle(color: Colors.black, fontSize: 13),
            )
          ],
        ),
        bottom: new PreferredSize(
          
            child: new Column(
              children: [
                new Container(
                  // padding: EdgeInsets.all(0),
                  height: 0.2,
                  color: Colors.grey,
                ),
                getTabBar()
              ],
            ),
            preferredSize: const Size.fromHeight(50.0)),
        // actions: <Widget>[
        //   // Add 3 lines from here...
        //   new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
        // ],
      ),
      // Set the TabBar view as the body of the Scaffold
      body: getTabBarView(
          <Widget>[new Popular(), new AllRecipes(), new Friends()]),
    );
  }
}
