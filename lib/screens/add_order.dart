import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spar/models/product_model.dart';
import 'package:spar/provider/product_provider.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:spar/UI/login/common_styles.dart';
import 'package:spar/screens/products.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Order extends StatefulWidget {
  final Product product;

  Order([this.product]);
  @override
  State<StatefulWidget> createState() {
    return OrderState();
  }
}

class OrderState extends State<Order> {
  final refCodeController = TextEditingController();
  final itemCodeController = TextEditingController();
  final quantityController = TextEditingController();
  final totalPriceController = TextEditingController();
  final deliveryAddressController = TextEditingController();
  final supplierAddressController = TextEditingController();
  final statusController = TextEditingController();
  TextEditingController dateCtl = TextEditingController();

  String dropDownValueItemName = "Select a item";
  String dropDownValueUnit = "Select an unit";
  String dropDownValueSiteName = "Select a site name";
  String dropDownValueSupplierName = "Select a supplier name";

  List<String> itemNameList = [
    'Stones',
    'Brick',
    'Concrete',
    'Cement',
    'Mortal',
    'Rod'
  ];
  List<String> supplierNameList = [
    'Kabir',
    'Sutharshan',
    'Pirathi',
    'Ashvini',
    'Rakib',
    'Rakesh'
  ];
  List<String> unitList = [
    'Cubes',
    'Kilogram',
    'Mole',
  ];
  List<String> siteNameList = [
    'Vonlan Constructions Private Limited',
    'Nawaloka Construction (Road Project Office)',
    'Nawaloka Construction Company',
    'International Construction Consortium (Pvt)',
    'Maga Engineering (Pvt) Ltd',
  ];
  //DateTime selectedDate = DateTime.now();
  String selectedDate = "";
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2021, 10),
        firstDate: DateTime(2011, 8),
        lastDate: DateTime(2122));
    if (picked.toIso8601String() != null &&
        picked.toIso8601String() != selectedDate)
      setState(() {
        selectedDate = picked.toIso8601String();
      });
  }

  @override
  void dispose() {
    refCodeController.dispose();
    itemCodeController.dispose();
    quantityController.dispose();
    totalPriceController.dispose();
    deliveryAddressController.dispose();
    supplierAddressController.dispose();
    statusController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    if (widget.product == null) {
      refCodeController.text = "";
      itemCodeController.text = "";
      quantityController.text = "";
      totalPriceController.text = "";
      deliveryAddressController.text = "";
      supplierAddressController.text = "";
      statusController.text = "";

      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        productProvider.loadValues(Product());
      });
    } else {
      refCodeController.text = widget.product.refCode;
      dropDownValueItemName = widget.product.itemName;
      itemCodeController.text = widget.product.itemCode;

      dropDownValueUnit = widget.product.unit;

      quantityController.text = widget.product.quantity.toString();
      totalPriceController.text = widget.product.totPrice.toString();
      dropDownValueSiteName = widget.product.siteName;
      deliveryAddressController.text = widget.product.deliAddress;
      dropDownValueSupplierName = widget.product.supplierName;
      supplierAddressController.text = widget.product.supplierAddress;
      selectedDate = widget.product.date;
      statusController.text = widget.product.orderStatus;

      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        productProvider.loadValues(widget.product);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    String date = selectedDate.toString();
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Center(child: Text("Add Order")),
        ),
        body: ListView(padding: const EdgeInsets.all(15), children: <Widget>[
          Padding(padding: EdgeInsets.all(5.5)),
          TextField(
            //textAlign: TextAlign.center,
            controller: refCodeController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            decoration: CommonStyles.textFormFieldStyle("Reference code", ""),
            onChanged: (value) {
              productProvider.changeRefCode(value);
              //Navigator.of(context).pop();
            },
          ),
          Padding(padding: new EdgeInsets.all(5.5)),
          DropdownButton(
            hint: dropDownValueUnit == null
                ? Text(
                    'Please choose an item name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  )
                : Text(
                    dropDownValueItemName,
                    style: TextStyle(color: Colors.blueAccent),
                  ),
            isExpanded: true,
            iconSize: 40.0,
            underline: Container(
              alignment: Alignment.center,
              height: 2,
              color: Colors.greenAccent,
            ),
            style: TextStyle(
              color: Colors.blueAccent,
            ),
            items: itemNameList.map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                () {
                  dropDownValueItemName = val;
                  productProvider.changeItemName(dropDownValueItemName);
                },
              );
            },
          ),
          TextField(
            controller: itemCodeController,
            //textAlign: TextAlign.center,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            decoration: CommonStyles.textFormFieldStyle("Item code", ""),
            onChanged: (value) {
              productProvider.changeItemCode(value);
            },
          ),
          DropdownButton(
            hint: dropDownValueUnit == null
                ? Text(
                    'Please choose an Unit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  )
                : Text(
                    dropDownValueUnit,
                    style: TextStyle(color: Colors.blue),
                  ),
            isExpanded: true,
            iconSize: 30.0,
            underline: Container(
              alignment: Alignment.center,
              height: 2,
              color: Colors.greenAccent,
            ),
            style: TextStyle(color: Colors.blue),
            items: unitList.map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                () {
                  dropDownValueUnit = val;
                  productProvider.changeUnit(dropDownValueUnit);
                },
              );
            },
          ),
          TextField(
            controller: quantityController,
            //textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: CommonStyles.textFormFieldStyle("Quantity", ""),
            onChanged: (value) {
              productProvider.changeQuantity(value);
            },
          ),
          TextFormField(
            controller: totalPriceController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: CommonStyles.textFormFieldStyle("Total price", ""),
            onChanged: (value) {
              productProvider.changeTotPrice(value);
            },
          ),
          DropdownButton(
            hint: dropDownValueUnit == null
                ? Text(
                    'Please choose an site name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  )
                : Text(
                    dropDownValueSiteName,
                    style: TextStyle(color: Colors.blue),
                  ),
            isExpanded: true,
            iconSize: 30.0,
            underline: Container(
              alignment: Alignment.center,
              height: 2,
              color: Colors.greenAccent,
            ),
            style: TextStyle(color: Colors.blue),
            items: siteNameList.map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                () {
                  dropDownValueSiteName = val;
                  productProvider.changeSiteName(dropDownValueSiteName);
                },
              );
            },
          ),
          TextFormField(
            controller: deliveryAddressController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            decoration:
                CommonStyles.textFormFieldStyle("Delivery address ", ""),
            onChanged: (value) {
              productProvider.changeDeliAddress(value);
            },
          ),
          DropdownButton(
            hint: dropDownValueUnit == null
                ? Text(
                    'Please choose an supplier name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  )
                : Text(
                    dropDownValueSupplierName,
                    style: TextStyle(color: Colors.blue),
                  ),
            isExpanded: true,
            iconSize: 30.0,
            underline: Container(
              alignment: Alignment.center,
              height: 2,
              color: Colors.greenAccent,
            ),
            style: TextStyle(color: Colors.blue),
            items: supplierNameList.map(
              (val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val),
                );
              },
            ).toList(),
            onChanged: (val) {
              setState(
                () {
                  dropDownValueSupplierName = val;
                  productProvider.changeSullierName(dropDownValueSupplierName);
                },
              );
            },
          ),
          TextFormField(
            controller: supplierAddressController,
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
            decoration:
                CommonStyles.textFormFieldStyle("Supplier address ", ""),
            onChanged: (value) {
              productProvider.changeSupplierAddress(value);
            },
          ),
          Container(
            child: TextFormField(
              controller: dateCtl,
              decoration: InputDecoration(
                labelText: "Pick a date",
                hintText: "Ex. Date",
              ),
              onTap: () async {
                DateTime date = DateTime(1900);
                FocusScope.of(context).requestFocus(new FocusNode());

                date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));

                dateCtl.text = date.toIso8601String();
                selectedDate = dateCtl.text;
                productProvider.changeDate(selectedDate);
              },
            ),
          ),
          // TextFormField(
          //   controller: statusController,
          //   keyboardType: TextInputType.name,
          //   textInputAction: TextInputAction.next,
          //   decoration: CommonStyles.textFormFieldStyle(" Order Status", ""),
          //   onChanged: (value) {
          //     productProvider.changeOrderStatus(value);
          //   },
          // ),
          Padding(padding: new EdgeInsets.all(10.5)),
          Row(
            children: [
              //width: 20.0,
              Padding(padding: new EdgeInsets.only(left: 120)),
              RaisedButton(
                onPressed: () {
                  if (refCodeController.text.isEmpty ||
                      itemCodeController.text.isEmpty ||
                      quantityController.text.isEmpty ||
                      totalPriceController.text.isEmpty ||
                      deliveryAddressController.text.isEmpty ||
                      supplierAddressController.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Enter all fields",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    productProvider.saveProduct();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Products(),
                        ));
                  }
                },
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0)),
                child: Text(
                  "Create Order",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),

              Padding(padding: new EdgeInsets.all(10.5)),
            ],
          ),
        ]));
  }
}
