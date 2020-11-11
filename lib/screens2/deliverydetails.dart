import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeliveryDetails extends StatefulWidget {
  final DocumentSnapshot post;
  DeliveryDetails({this.post});
  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();

  getRemainingQuantity(double totalquantity, double predeliveryquantity) {
    return totalquantity - predeliveryquantity;
  }
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  TextEditingController _num1controller = new TextEditingController();
  TextEditingController num1controller = new TextEditingController();
  Future showdialogSuccess(BuildContext context) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: Center(child: new Text("Succefully Added")),
          actions: [
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 100,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            new FlatButton(
                onPressed: () => Navigator.pop(context), child: new Text("OK")),
          ],
        ));
  }

  String x = "0";
  double a = 0;
  String productId = " ";
  bool val = true;
  bool isSwitched = false;

  double getRemainingQuantity(
      double totalquantity, double predeliveryquantity) {
    return totalquantity - predeliveryquantity;
  }

//  void getva(){
//    if(a)
//  }

  readData() {
    DocumentReference documentReference =
        Firestore.instance.collection("DeliveryLoggings").document(productId);
    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data()["complete"]);
      print(datasnapshot.data()["remaining"]);
    });
  }

  createData() {
    DocumentReference documentReference =
        Firestore.instance.collection("DeliveryLoggings").document(productId);

    Map<String, dynamic> students = {
      "complete": isSwitched,
      "predelivery": x,
      "productId": productId,
      "remaining": a
    };
    documentReference
        .setData(students)
        .whenComplete(() => {print("$productId updated")});
  }

  updateData() {
    DocumentReference documentReference =
        Firestore.instance.collection("products").document(productId);

    Map<String, dynamic> students = {
      "remaining": a,
      "completed": isSwitched,
    };
    documentReference
        .setData(students)
        .whenComplete(() => {print("$productId Updated")});
  }

//  double x = this.post.data()["studentGPA"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Delivery Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  height: 200,
                  color: Colors.blue[100],
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 2, child: Text("Order Reference code :")),
                            Expanded(
                                flex: 1,
                                child: Text(widget.post.data()["ref code"])),
//                  Text(widget.post.data()["studentGPA"].toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(flex: 2, child: Text("Item Code :")),
                            Expanded(
                                flex: 1,
                                child: Text(widget.post.data()["item code"])),
//                  Text(widget.post.data()["studentGPA"].toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(flex: 2, child: Text("Item Name :")),
                            Expanded(
                                flex: 1,
                                child: Text(widget.post.data()["item name"])),
//                  Text(widget.post.data()["studentGPA"].toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(flex: 2, child: Text("Quantity :")),
                            Expanded(
                                flex: 1,
                                child: Text(
                                    widget.post.data()["qunatity"].toString())),
//                  Text(widget.post.data()["studentGPA"].toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(flex: 2, child: Text("Standard Unit :")),
                            Expanded(
                                flex: 1,
                                child: Text(widget.post.data()["unit"])),
//                  Text(widget.post.data()["studentGPA"].toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(flex: 2, child: Text("Supplier Name :")),
                            Expanded(
                                flex: 1,
                                child:
                                    Text(widget.post.data()["supplier name"])),
//                  Text(widget.post.data()["studentGPA"].toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  height: 160,
                  color: Colors.red[100],
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(flex: 2, child: Text("Order Quantity :")),
                            Expanded(
                                flex: 1,
                                child: Text(
                                    widget.post.data()["qunatity"].toString())),
//                  Text(widget.post.data()["studentGPA"].toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text("Pre Delivery Quantity :")),
                            Expanded(
                                flex: 1,
                                child: TextField(
                                  controller: num1controller,
                                  decoration: new InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                    ),
                                    labelText: 'Enter Value',
                                  ),
                                )),

//                  Text(widget.post.data()["studentGPA"].toString()),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 50, top: 0, right: 50, bottom: 0),
                        child: Center(
                          child: FlatButton(
                            onPressed: () {
                              double tot = 0;
                              double y = widget.post.data()["qunatity"];
//                              print("y" + y.toString());
                              double predeliver =
                                  double.parse(num1controller.text);
                              tot = getRemainingQuantity(y, predeliver);
                              setState(() {
                                x = num1controller.text;
                                a = tot;
                                productId = widget.post.data()["productId"];
                              });
                              print(num1controller.text);
                              print(tot);
//                              createData();
                            },
                            color: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Calculate amount to be delivered",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            textColor: Colors.black,
                          ),
                        ),
                      ),
//
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  height: 130,
                  color: Colors.blue[100],
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 2, child: Text("Remaining Quantity :")),
                            Expanded(flex: 1, child: Text(a.toString())),
//                  Text(widget.post.data()["studentGPA"].toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text("Total Delivery quantity :")),
                            Expanded(flex: 1, child: Text(x)),
//                  Text(widget.post.data()["studentGPA"].toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text("Comfirm Order Completed :")),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;

                                      print(isSwitched);
                                    });
                                  },
                                  activeTrackColor: Colors.green,
                                  activeColor: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

//
                    ],
                  ),
                ),
              ),
//              Container(
//                child: StreamBuilder(
//                  stream: Firestore.instance
//                      .collection("DeliveryLoggings")
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (snapshot.hasData) {
//                      return ListView.builder(
//                        shrinkWrap: true,
//                        itemCount: snapshot.data.documents.length,
//                        itemBuilder: (context, index) {
//                          DocumentSnapshot documentSnapshot =
//                              snapshot.data.documents[index];
//                          return Padding(
//                            padding: EdgeInsets.all(10.0),
//                            child: Container(
//                              height: 130,
//                              color: Colors.blue[100],
//                              child: Column(
//                                children: [
//                                  Padding(
//                                    padding: EdgeInsets.all(8.0),
//                                    child: Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.spaceEvenly,
//                                      children: [
//                                        Expanded(
//                                            flex: 2,
//                                            child:
//                                                Text("Remaining Quantity :")),
//                                        Expanded(
//                                            flex: 1,
//                                            child: Text(
//                                                documentSnapshot["remaining"]
//                                                    .toString())),
////                  Text(widget.post.data()["studentGPA"].toString()),
//                                      ],
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: EdgeInsets.all(8.0),
//                                    child: Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.spaceEvenly,
//                                      children: [
//                                        Expanded(
//                                            flex: 2,
//                                            child: Text(
//                                                "Total Delivery quantity :")),
//                                        Expanded(
//                                            flex: 1,
//                                            child: Text(
//                                                documentSnapshot["predelivery"]
//                                                    .toString())),
////                  Text(widget.post.data()["studentGPA"].toString()),
//                                      ],
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: EdgeInsets.all(8.0),
//                                    child: Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.spaceEvenly,
//                                      children: [
//                                        Expanded(
//                                            flex: 2,
//                                            child: Text(
//                                                "Comfirm Order Completed :")),
//                                        Expanded(
//                                          flex: 1,
//                                          child: Center(
//                                            child: Switch(
//                                              value: isSwitched,
//                                              onChanged: (value) {
//                                                setState(() {
//                                                  isSwitched = value;
//
//                                                  print(isSwitched);
//                                                });
//                                              },
//                                              activeTrackColor: Colors.green,
//                                              activeColor: Colors.green,
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//
////
//                                ],
//                              ),
//                            ),
//                          );
//                        },
//                      );
//                    } else {
//                      return Align(
//                        alignment: FractionalOffset.bottomCenter,
//                        child: CircularProgressIndicator(),
//                      );
//                    }
//                  },
//                ),
//              ),
              Container(
                padding:
                    EdgeInsets.only(left: 130, top: 0, right: 130, bottom: 0),
                child: Center(
                  child: FlatButton(
                    onPressed: () {
                      createData();

                      showdialogSuccess(context);
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Submit",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    textColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
