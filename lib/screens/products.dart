import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spar/screens/edit_product.dart';
import 'package:spar/models/product_model.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Orders")),
        ),
        body: (products != null)
            ? ListView.builder(
                padding: EdgeInsets.all(5),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Order reference code ",
                              style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                          Expanded(
                            child: Text(products[index].refCode,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0)),
                          ),
                          Expanded(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditProduct(products[index]),
                                  ),
                                );
                              },
                              color: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("View "),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 20.0,
                                    )
                                  ]),
                            ),
                          )
                        ]),
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
