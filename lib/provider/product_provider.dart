import 'package:spar/models/product_model.dart';
//import 'package:firestore_crud/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:spar/services/firestore_service.dart';
import 'package:uuid/uuid.dart';
import 'package:email_validator/email_validator.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  String _refCode;
  String _itemName;
  String _itemCode;
  String _unit;
  double _quantity;
  double _totPrice;
  String _siteName;
  String _deliAddress;
  String _supplierName;
  String _supplierAddress;
  String _date;
  //String _orderStatus;
  String _productId;

  var uuid = Uuid();

  //Getters
  String get refCode => _refCode;
  String get itemName => _itemName;
  String get itemCode => _itemCode;
  String get unit => _unit;
  double get quantity => _quantity;
  double get totPrice => _totPrice;
  String get siteName => _siteName;
  String get deliAddress => _deliAddress;
  String get supplierName => _supplierName;
  String get supplierAddress => _supplierAddress;
  String get date => _date;
  String get orderStatus => "Pending";

  bool get canSubmit => _itemName.length > 3;

  //Setters
  changeRefCode(String value) {
    _refCode = value;
    notifyListeners();
  }

  changeItemName(String value) {
    _itemName = value;
    notifyListeners();
  }

  changeItemCode(String value) {
    _itemCode = value;
    notifyListeners();
  }

  changeUnit(String value) {
    _unit = value;
    notifyListeners();
  }

  changeQuantity(String value) {
    _quantity = double.parse(value);
    notifyListeners();
  }

  changeTotPrice(String value) {
    _totPrice = double.parse(value);
    notifyListeners();
  }

  changeSiteName(String value) {
    _siteName = value;
    notifyListeners();
  }

  changeDeliAddress(String value) {
    _deliAddress = value;
    notifyListeners();
  }

  changeSullierName(String value) {
    _supplierName = value;
    notifyListeners();
  }

  changeSupplierAddress(String value) {
    _supplierAddress = value;
    notifyListeners();
  }

  changeDate(String value) {
    _date = value;
    notifyListeners();
  }

  // changeOrderStatus(String value) {
  //   _orderStatus = value;
  //   notifyListeners();
  // }

  loadValues(Product product) {
    _refCode = product.refCode;
    _itemName = product.itemName;
    _itemCode = product.itemCode;
    _unit = product.unit;
    _quantity = product.quantity;
    _totPrice = product.totPrice;
    _siteName = product.siteName;
    _deliAddress = product.deliAddress;
    _siteName = product.supplierName;
    _supplierAddress = product.supplierAddress;
    _date = product.date;
    // _orderStatus = product.orderStatus;

    _productId = product.productId;
  }

  saveProduct() {
    //print(_price);
    if (_productId == null) {
      var newProduct = Product(
          refCode: refCode,
          itemName: itemName,
          itemCode: itemCode,
          unit: unit,
          quantity: quantity,
          totPrice: totPrice,
          siteName: siteName,
          deliAddress: deliAddress,
          supplierName: supplierName,
          supplierAddress: supplierAddress,
          date: date,
          orderStatus: orderStatus,
          productId: uuid.v4());
      firestoreService.saveProduct(newProduct);
    } else {
      //Update
      var updatedProduct = Product(
          refCode: _refCode,
          itemName: _itemName,
          itemCode: _itemCode,
          unit: _unit,
          quantity: _quantity,
          totPrice: _totPrice,
          siteName: _siteName,
          deliAddress: _deliAddress,
          supplierName: _supplierName,
          supplierAddress: _supplierAddress,
          date: _date,
          orderStatus: "Pending",
          productId: _productId);
      firestoreService.saveProduct(updatedProduct);
    }
  }

  removeProduct(String productId) {
    firestoreService.removeProduct(productId);
  }
}
