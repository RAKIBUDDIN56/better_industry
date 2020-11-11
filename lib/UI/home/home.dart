import 'package:flutter/material.dart';

import 'package:spar/UI/login/login.dart';

import 'package:spar/UI/aboutus.dart';

import 'package:spar/screens/add_order.dart';

import 'package:spar/screens/products.dart';
import 'package:spar/registration/firebaseAuthDemo.dart';
import 'package:spar/screens2/deliveryloggings.dart';
import 'package:spar/screens2/order_status.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Center(child: Text("Home")),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              currentAccountPicture: new CircleAvatar(
                // margin: const EdgeInsets.only(bottom: 40.0),
                // width: 10.0,
                // height: 10.0,
                radius: 50.0,
                backgroundColor: const Color(0xFF778899),
                backgroundImage: AssetImage("images/businessman.png"),
              ),
              accountName: Container(
                  child: Text(
                "Rakib Uddin",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
              accountEmail: Text(
                "rsrakib404@gmail.com",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              title: Text(
                'About Us ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Aboutus()));

                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Log Out ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 320,
              transform: Matrix4.translationValues(0.0, -10.0, 0.0),
              child: Center(
                child: Image(
                  image: AssetImage('images/office.jpg'),
                  // height: 250,
                  // width: 280,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Order()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.blue),
                            borderRadius: BorderRadius.circular(5.0)),
                        height: 120,
                        width: 150,
                        child: Card(
                            color: Colors.red,
                            child: Container(
                                alignment: Alignment.center,
                                color: Colors.greenAccent,
                                child: Text(
                                  "Place new order",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ),
                    ),
                  ]),
                  Stack(children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Products()));
                      },
                      child: Container(
                        height: 130,
                        width: 160,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.blue),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Card(
                            color: Colors.red,
                            child: Container(
                                alignment: Alignment.center,
                                color: Colors.greenAccent,
                                child: Text(
                                  "View orders",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ))),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OrderStatus()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.blue),
                            borderRadius: BorderRadius.circular(5.0)),
                        height: 130,
                        width: 160,
                        child: Card(
                            color: Colors.red,
                            child: Container(
                                alignment: Alignment.center,
                                color: Colors.greenAccent,
                                child: Text(
                                  "View order status",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ))),
                      ),
                    ),
                  ]),
                  Stack(children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DeliveryLoggings()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.blue),
                            borderRadius: BorderRadius.circular(5.0)),
                        height: 130,
                        width: 160,
                        child: Card(
                            color: Colors.red,
                            child: Container(
                                alignment: Alignment.center,
                                color: Colors.greenAccent,
                                child: Text(
                                  "Delivery Loggin",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ))),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
