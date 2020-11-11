import 'package:flutter/material.dart';
import 'package:spar/screens2/acceptorder.dart';
import 'package:spar/screens2/deliverypage.dart';
import 'package:spar/screens2/pendingorder.dart';
import 'package:spar/screens2/rejectorder.dart';

class OrderStatus extends StatefulWidget {
  @override
  OrderStatusState createState() => OrderStatusState();
}

class OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(50),
                child: Center(
                  child: Text(
                    "Order Status",
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
                width: 200,
                // padding:
                //     EdgeInsets.only(left: 130, top: 0, right: 130, bottom: 0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PendingOrder()));
                  },
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Pending Orders"),
                      Icon(
                        Icons.send,
                        color: Colors.green,
                        //size: 30.0,
                      ),
                    ],
                  ),
                  textColor: Colors.black,
                ),
              ),
              Container(
                // padding:
                //     EdgeInsets.only(left: 130, top: 0, right: 130, bottom: 0),
                width: 200,

                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AcceptOrder()));
                  },
                  color: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Accepted Orders"),
                      Icon(
                        Icons.send,
                        color: Colors.green,
                        size: 30.0,
                      ),
                    ],
                  ),
                  textColor: Colors.black,
                ),
              ),
              Container(
                width: 200,
                // padding:
                //     EdgeInsets.only(left: 130, top: 0, right: 130, bottom: 0),

                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RejectOrder()));
                  },
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Rejected Orders"),
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
