import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'deliverydetails.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Delivery Info")),
        actions: [Icon(Icons.more_vert)],
      ),
      body: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future _data;
  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection("products")
        .where('order status', isEqualTo: "Accepted")
        .get();
    return qn.docs;
  }

  navigateToDetails(DocumentSnapshot post) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DeliveryDetails(post: post)));
  }

  @override
  void initState() {
    super.initState();
    _data = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _data,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading..."),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    DocumentSnapshot documentSnapshot = snapshot.data[index];
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 2, child: Text("Order Reference code :")),
                          Expanded(
                              flex: 1,
                              child: Text(documentSnapshot["ref code"])),
                          Expanded(
                            flex: 1,
                            child: FlatButton(
                              onPressed: () =>
                                  navigateToDetails(snapshot.data[index]),
                              color: Colors.blue[300],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Check",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ],
                              ),
                              textColor: Colors.black,
                            ),
                          )
                        ],
                      ),
//                      onTap: () => navigateToDetails(snapshot.data[index]),
                    );
                  });
            }
          }),
    );
  }
}
