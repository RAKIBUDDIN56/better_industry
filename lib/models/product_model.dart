class Product {
  final String productId;

  final String refCode;
  final String itemName;
  final String itemCode;
  final String unit;
  final double quantity;
  final double totPrice;
  final String siteName;
  final String deliAddress;
  final String supplierName;
  final String supplierAddress;
  final String date;
  final String orderStatus;

  Product(
      {this.productId,
      this.refCode,
      this.itemName,
      this.itemCode,
      this.unit,
      this.quantity,
      this.totPrice,
      this.siteName,
      this.deliAddress,
      this.supplierName,
      this.supplierAddress,
      this.date,
      this.orderStatus});

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'ref code': refCode,
      'item name': itemName,
      'item code': itemCode,
      'unit': unit,
      'qunatity': quantity,
      'total price': totPrice,
      'site name': siteName,
      'delivery address': deliAddress,
      'supplier name': supplierName,
      'supplier address': supplierAddress,
      'date': date,
      'order status': orderStatus,
    };
  }

  Product.fromFirestore(Map<String, dynamic> firestore)
      : productId = firestore['productId'],
        refCode = firestore['ref code'],
        itemName = firestore['item name'],
        itemCode = firestore['item code'],
        unit = firestore['unit'],
        quantity = firestore['quantity'],
        totPrice = firestore['total price'],
        siteName = firestore['site name'],
        deliAddress = firestore['delivery address'],
        supplierName = firestore['supplier name'],
        supplierAddress = firestore['supplier address'],
        date = firestore['date'],
        orderStatus = firestore['order status'];
}
