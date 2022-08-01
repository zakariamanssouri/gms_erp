

// To parse this JSON data, do
//
//     final stock = stockFromJson(jsonString);

import 'dart:convert';

class Stock {
    Stock({
        this.id,
        this.eanCode,
        this.productId,
        this.productNo,
        this.productName1,
        this.productName2,
        this.productName3,
        this.locationName,
        this.groundName,
        this.purchasePrice,
    });

    String ? id;
    String ? eanCode;
    String ? productId;
    String ? productNo;
    String ? productName1;
    String ? productName2;
    String ? productName3;
    String ? locationName;
    String ? groundName;
    String ? purchasePrice;

    factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        id: json["id"],
        productId: json["product_id"],
        productNo: json["product_no"],
        productName1: json["product_name1"],
        productName2: json["product_name2"],
        productName3: json["product_name3"],
        eanCode: json["ean_code"],
        locationName: json["location_name"],
        groundName: json["ground_name"],
        purchasePrice: json["purchase_price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_no": productNo,
        "product_name1": productName1,
        "product_name2": productName2,
        "product_name3": productName3,
        "ean_code": eanCode,
        "location_name": locationName,
        "ground_name": groundName,
        "purchase_price": purchasePrice,
    };
}
