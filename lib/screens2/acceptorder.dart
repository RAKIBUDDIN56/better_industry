import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AcceptOrder extends StatefulWidget {
  @override
  _AcceptOrderState createState() => _AcceptOrderState();
}

class _AcceptOrderState extends State<AcceptOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Accepted Orders")),
        actions: [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    decoration: new InputDecoration(
                      prefixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                          onPressed: () {}),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      labelText: 'Search',
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    Expanded(flex: 2, child: Text(" ")),
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Code",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.center,
                            child: Text("Accepted",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)))),
                  ],
                ),
              ),
              StreamBuilder(
                stream: Firestore.instance
                    .collection("products")
                    .where('order status', isEqualTo: "Accepted")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data.documents[index];
                        return Row(
                          children: [
                            Expanded(
                                flex: 2, child: Text("Order Reference code :")),
                            Expanded(
                                flex: 1,
                                child: Text(documentSnapshot["item code"])),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 30.0,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
