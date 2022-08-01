class InventoryDetails {
  String id;
  String batchNo;
  String inventoryId;
  String inventoryNumber;
  String inventoryStatusName;
  String isDone;
  String measureName;
  String productId;
  String productName1;
  String productName2;
  String productName3;
  String productNo;
  double qty;
  String qtyOrig;
  String stockLocationName;
  double singlePrice;
  String validTo;

  InventoryDetails(
      {required this.id,
      required this.batchNo,
      required this.inventoryId,
      required this.inventoryNumber,
      required this.inventoryStatusName,
      required this.isDone,
      required this.measureName,
      required this.productId,
      required this.productName1,
      required this.productName2,
      required this.productName3,
      required this.productNo,
      required this.qty,
      required this.qtyOrig,
      required this.stockLocationName,
      required this.singlePrice,
      required this.validTo});

  factory InventoryDetails.fromJson(Map<String, dynamic> json) =>
      InventoryDetails(
        id: json["id"],
        batchNo: json["batch_no"],
        inventoryId: json["inventory_id"],
        inventoryNumber: json["inventory_number"],
        inventoryStatusName: json["inventory_status_name"],
        isDone: json["is_done"],
        measureName: json["measure_name"],
        productId: json["product_id"],
        productName1: json["product_name1"],
        productName2: json["product_name2"],
        productName3: json["product_name3"],
        productNo: json["product_no"],
        qty: double.parse(json["qty"]),
        qtyOrig: json["qty_orig"],
        stockLocationName: json["stock_location_name"],
        singlePrice: double.parse(json["single_price"]),
        validTo: json["valid_to"],
      );

// create function Map<String, dynamic> toJson()
  Map<String, dynamic> toJson() => {
        "id": id,
        "qty": qty.toString(),
        "valid_to": validTo,
        "single_price": singlePrice.toString(),
      };
}
