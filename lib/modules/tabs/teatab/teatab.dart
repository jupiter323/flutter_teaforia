import 'package:flutter/material.dart';
import 'package:myapp/modules/tabs/teatab/tealist/contact_list.dart';
import 'package:myapp/modules/tabs/teatab/tealist/modal/contact.dart';

class TeatabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new TeaList());
  }
}

class TeaList extends StatelessWidget {
  var recentBrandIndex = 3;
  final brandList = [
    {"url": 'assets/imgs/brand1.png', "title": "Adagioteas"},
    {"url": 'assets/imgs/brand2.png', "title": "Davids Tea"},
    {"url": 'assets/imgs/brand3.png', "title": "Mighty Leaf"},
    {"url": 'assets/imgs/brand4.png', "title": "NuMi Organic Tea"},
    {
      "url": 'assets/imgs/brand5.png',
      "title": "Rishi Organic Tea & Botanicals"
    },
    {"url": 'assets/imgs/brand6.png', "title": "Stash"},
    {"url": 'assets/imgs/brand7.png', "title": "The Tea Spot"},
    {"url": 'assets/imgs/brand8.png', "title": "Upton Tea Imports"},
    {"url": 'assets/imgs/brand9.png', "title": "Other"}
  ];
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromRGBO(77, 77, 79, 1)),
                  ),
                  Text(
                    "My Recipes",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromRGBO(244, 115, 64, 1)),
                  ),
                ],
              )),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: GestureDetector(
                      onTap: () {
                        goTealistItems(context, brandList[recentBrandIndex]);
                      },
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              blurRadius: 25,
                              color: Colors.grey,
                              offset: new Offset(-10, 5)),
                        ]),
                        child: Image.asset(brandList[recentBrandIndex]["url"]),
                      ))),
              Expanded(
                flex: 5,
                child: Container(),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Brands",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromRGBO(77, 77, 79, 1)),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("d");
                    },
                    child: Text(
                      "+Add Tea",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromRGBO(244, 115, 64, 1)),
                    ),
                  )
                ],
              )),
          Expanded(
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this would produce 2 rows.

              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 5.0,
              // Generate 100 Widgets that display their index in the List
              children: List.generate(9, (index) {
                return Center(
                  child: GestureDetector(
                      onTap: () {
                        goTealistItems(context, brandList[index]);
                      },
                      child: Image.asset(
                        brandList[index]["url"],
                        // height: 110.0,
                        fit: BoxFit.cover,
                      )),
                );
              }),
            ),
          )
        ]),
      ),
    );
  }

  void goTealistItems(BuildContext context, brandItem) {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
                iconTheme: IconThemeData(
                  color: Colors.grey, //change your color here
                ),
                title: Text(
                  brandItem['title'],
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                actions: [
                  GestureDetector(
                      onTap: () {
                        print("d");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "+Add Tea",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromRGBO(244, 115, 64, 1)),
                        ),
                      ))
                ]),
            body: new TealistItems(brandItem),
          ); // ... to here.
        },
      ), // ... to here.
    );
  }
}

class TealistItems extends StatelessWidget {
  final brandItem;
  TealistItems(this.brandItem);
  _buildContactList() {
    return <ContactModal>[
      const ContactModal(
          fullName: 'Mango Fruit Punch',
          recipes: "1",
          imgurl: "assets/imgs/food.png"),
      const ContactModal(
          fullName: 'Moringa Mermaid',
          recipes: "2",
          imgurl: "assets/imgs/food.png"),
      const ContactModal(
          fullName: 'Rhubarb Cream Soda',
          recipes: "6",
          imgurl: "assets/imgs/food.png"),
      const ContactModal(
          fullName: 'Strawberry Lemonade',
          recipes: "6",
          imgurl: "assets/imgs/food.png"),
      const ContactModal(
          fullName: 'Frozen Rasberry',
          recipes: "6",
          imgurl: "assets/imgs/food.png"),
      const ContactModal(
          fullName: 'Nishant Srivastava',
          recipes: "6",
          imgurl: "assets/imgs/food.png"),
      const ContactModal(
          fullName: 'Romain Hoogmoed',
          recipes: "6",
          imgurl: "assets/imgs/food.png"),
      const ContactModal(
          fullName: 'Emilie Olsen',
          recipes: "6",
          imgurl: "assets/imgs/food.png"),
      const ContactModal(
          fullName: 'Nishant Srivastava',
          recipes: "6",
          imgurl: "assets/imgs/food.png"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new ContactsList(_buildContactList(), brandItem));
  }
}
