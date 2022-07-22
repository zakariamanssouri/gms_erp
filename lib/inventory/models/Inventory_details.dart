class InventoryDetails {
  final String id;
  final String batchNo;
  final String batchStatusName;
  final String inventoryHeaderId;
  final String differenceRel;
  final String insDatime;
  final String insUser;
  final String inventoryId;
  final String inventoryNumber;
  final String inventoryStatusName;
  final String isBookedToStock;
  final String isPharmaProduct;
  final String isDone;
  final String measureId;
  final String measureName;
  final String posNo;
  final String packtypeName;
  final String packtypeNameEn;
  final String productActive;
  final String productId;
  final String productName1;
  final String productName2;
  final String productName3;
  final String productNo;
  final String pzn;
  final double qty;
  final String qtyDifference;
  final String qtyOrig;
  final String qtyPacktype;
  final String qtyPerPacktype;
  final String stockGroundId;
  final String stockGroundName;
  final String stockLocationId;
  final String stockLocationName;
  final double singlePrice;
  final String standardSinglePrice;
  final String stockBookingQtyId;
  final String teamId;
  final String teamName;
  final String updDatime;
  final String updUser;
  String validTo;

  InventoryDetails(
      {required this.id,
      required this.batchNo,
      required this.batchStatusName,
      required this.inventoryHeaderId,
      required this.differenceRel,
      required this.insDatime,
      required this.insUser,
      required this.inventoryId,
      required this.inventoryNumber,
      required this.inventoryStatusName,
      required this.isBookedToStock,
      required this.isPharmaProduct,
      required this.isDone,
      required this.measureId,
      required this.measureName,
      required this.posNo,
      required this.packtypeName,
      required this.packtypeNameEn,
      required this.productActive,
      required this.productId,
      required this.productName1,
      required this.productName2,
      required this.productName3,
      required this.productNo,
      required this.pzn,
      required this.qty,
      required this.qtyDifference,
      required this.qtyOrig,
      required this.qtyPacktype,
      required this.qtyPerPacktype,
      required this.stockGroundId,
      required this.stockGroundName,
      required this.stockLocationId,
      required this.stockLocationName,
      required this.singlePrice,
      required this.standardSinglePrice,
      required this.stockBookingQtyId,
      required this.teamId,
      required this.teamName,
      required this.updDatime,
      required this.updUser,
      required this.validTo});

  factory InventoryDetails.fromJson(Map<String, dynamic> json) =>
      InventoryDetails(
        id: json["id"],
        batchNo: json["batch_no"],
        batchStatusName: json["batch_status_name"],
        inventoryHeaderId: json["inventory_header_id"],
        differenceRel: json["difference_rel"],
        insDatime: json["ins_datime"],
        insUser: json["ins_user"],
        inventoryId: json["inventory_id"],
        inventoryNumber: json["inventory_number"],
        inventoryStatusName: json["inventory_status_name"],
        isBookedToStock: json["is_booked_to_stock"],
        isPharmaProduct: json["is_pharma_product"],
        isDone: json["is_done"],
        measureId: json["measure_id"],
        measureName: json["measure_name"],
        posNo: json["pos_no"],
        packtypeName: json["packtype_name"],
        packtypeNameEn: json["packtype_name_en"],
        productActive: json["product_active"],
        productId: json["product_id"],
        productName1: json["product_name1"],
        productName2: json["product_name2"],
        productName3: json["product_name3"],
        productNo: json["product_no"],
        pzn: json["pzn"],
        qty: double.parse(json["qty"]),
        qtyDifference: json["qty_difference"],
        qtyOrig: json["qty_orig"],
        qtyPacktype: json["qty_packtype"],
        qtyPerPacktype: json["qty_per_packtype"],
        stockGroundId: json["stock_ground_id"],
        stockGroundName: json["stock_ground_name"],
        stockLocationId: json["stock_location_id"],
        stockLocationName: json["stock_location_name"],
        singlePrice: double.parse(json["single_price"]),
        standardSinglePrice: json["standard_single_price"],
        stockBookingQtyId: json["stock_booking_qty_id"],
        teamId: json["team_id"],
        teamName: json["team_name"],
        updDatime: json["upd_datime"],
        updUser: json["upd_user"],
        validTo: json["valid_to"],
      );

// create function Map<String, dynamic> toJson()
  Map<String, dynamic> toJson() => {
        "id": id,
        "batch_no": batchNo,
        "batch_status_name": batchStatusName,
        "inventory_header_id": inventoryHeaderId,
        "difference_rel": differenceRel,
        "ins_datime": insDatime,
        "ins_user": insUser,
        "inventory_id": inventoryId,
        "inventory_number": inventoryNumber,
        "inventory_status_name": inventoryStatusName,
        "is_booked_to_stock": isBookedToStock,
        "is_pharma_product": isPharmaProduct,
        "is_done": isDone,
        "measure_id": measureId,
        "measure_name": measureName,
        "pos_no": posNo,
        "packtype_name": packtypeName,
        "packtype_name_en": packtypeNameEn,
        "product_active": productActive,
        "product_id": productId,
        "product_name1": productName1,
        "product_name2": productName2,
        "product_name3": productName3,
        "product_no": productNo,
        "pzn": pzn,
        "qty": qty,
        "qty_difference": qtyDifference,
        "qty_orig": qtyOrig,
        "qty_packtype": qtyPacktype,
        "qty_per_packtype": qtyPerPacktype,
        "stock_ground_id": stockGroundId,
        "stock_ground_name": stockGroundName,
        "stock_location_id": stockLocationId,
        "stock_location_name": stockLocationName,
        "single_price": singlePrice,
        "standard_single_price": standardSinglePrice,
        "stock_booking_qty_id": stockBookingQtyId,
        "team_id": teamId,
        "team_name": teamName,
        "upd_datime": updDatime,
        "upd_user": updUser,
        "valid_to": validTo,
      };
}
