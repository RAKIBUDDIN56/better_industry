import 'package:flutter/material.dart';
import 'package:spar/screens2/deliverypage.dart';

class DeliveryLoggings extends StatefulWidget {
  @override
  _DeliveryLoggingsState createState() => _DeliveryLoggingsState();
}

class _DeliveryLoggingsState extends State<DeliveryLoggings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(50),
                child: Center(
                  child: Text(
                    "DeliveryLoggings",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Container(
                  height: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/dl.png'),
                      )),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 130, top: 0, right: 130, bottom: 0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DeliveryPage()));
                  },
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Go Here"),
                      Icon(
                        Icons.send,
                        color: Colors.green,
                        size: 30.0,
                      ),
                    ],
                  ),
                  textColor: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
