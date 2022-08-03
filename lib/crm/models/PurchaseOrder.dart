import 'dart:convert';

PurchaseOrder purchaseOrderFromJson(String str) =>
    PurchaseOrder.fromJson(json.decode(str));

String purchaseOrderToJson(PurchaseOrder data) => json.encode(data.toJson());

class PurchaseOrder {
  PurchaseOrder({
    required this.id,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.countryName,
    required this.city,
    required this.contactPerson,
    required this.currencyName,
    required this.deliveryDate,
    required this.street,
    required this.receiptNo,
    required this.receiptDate,
    required this.orderStateName,
    required this.orderStateId,
    required this.projectNo,
    required this.positionCount,
    required this.paymentStateName,
    required this.paymentStateId,
    required this.purchasePaymentBookingStateId,
    required this.purchasePaymentBookingStateName,
    required this.totalGrossAmount,
    required this.totalNetAmount,
    required this.totalRebateAmount,
    required this.totalVatAmount,
    required this.deliveryValue,
    required this.user,
    required this.vendorId,
    required this.vendorNo,
    required this.vendorName1,
    required this.vendorName2,
    required this.vendorName3,
    required this.zipCode,
  });

  String id;
  String address1;
  String? address2;
  String? address3;
  String countryName;
  String city;
  String contactPerson;
  String currencyName;
  DateTime? deliveryDate;
  dynamic street;
  String receiptNo;
  DateTime? receiptDate;
  String orderStateName;
  String orderStateId;
  dynamic projectNo;
  String positionCount;
  String paymentStateName;
  String paymentStateId;
  String purchasePaymentBookingStateId;
  String purchasePaymentBookingStateName;
  String totalGrossAmount;
  String totalNetAmount;
  String totalRebateAmount;
  String totalVatAmount;
  String deliveryValue;
  String user;
  String vendorId;
  String vendorNo;
  String vendorName1;
  dynamic vendorName2;
  dynamic vendorName3;
  dynamic zipCode;

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) => PurchaseOrder(
        id: json["id"] == null ? null : json["id"],
        address1: json["address1"] == null ? null : json["address1"],
        address2: json["address2"] == null ? null : json["address2"],
        address3: json["address3"],
        countryName: json["country_name"] == null ? null : json["country_name"],
        city: json["city"] == null ? null : json["city"],
        contactPerson:
            json["contact_person"] == null ? null : json["contact_person"],
        currencyName:
            json["currency_name"] == null ? null : json["currency_name"],
        deliveryDate: json["delivery_date"] == null
            ? null
            : DateTime.parse(json["delivery_date"]),
        street: json["street"],
        receiptNo: json["receipt_no"] == null ? null : json["receipt_no"],
        receiptDate: json["receipt_date"] == null
            ? null
            : DateTime.parse(json["receipt_date"]),
        orderStateName:
            json["order_state_name"] == null ? null : json["order_state_name"],
        orderStateId:
            json["order_state_id"] == null ? null : json["order_state_id"],
        projectNo: json["project_no"],
        positionCount:
            json["position_count"] == null ? null : json["position_count"],
        paymentStateName: json["payment_state_name"] == null
            ? null
            : json["payment_state_name"],
        paymentStateId:
            json["payment_state_id"] == null ? null : json["payment_state_id"],
        purchasePaymentBookingStateId:
            json["purchase_payment_booking_state_id"] == null
                ? null
                : json["purchase_payment_booking_state_id"],
        purchasePaymentBookingStateName:
            json["purchase_payment_booking_state_name"] == null
                ? null
                : json["purchase_payment_booking_state_name"],
        totalGrossAmount: json["total_gross_amount"] == null
            ? null
            : json["total_gross_amount"],
        totalNetAmount:
            json["total_net_amount"] == null ? null : json["total_net_amount"],
        totalRebateAmount: json["total_rebate_amount"] == null
            ? null
            : json["total_rebate_amount"],
        totalVatAmount:
            json["total_vat_amount"] == null ? null : json["total_vat_amount"],
        deliveryValue:
            json["delivery_value"] == null ? null : json["delivery_value"],
        user: json["user"] == null ? null : json["user"],
        vendorId: json["vendor_id"] == null ? null : json["vendor_id"],
        vendorNo: json["vendor_no"] == null ? null : json["vendor_no"],
        vendorName1: json["vendor_name1"] == null ? null : json["vendor_name1"],
        vendorName2: json["vendor_name2"],
        vendorName3: json["vendor_name3"],
        zipCode: json["zip_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "address1": address1 == null ? null : address1,
        "address2": address2 == null ? null : address2,
        "address3": address3,
        "country_name": countryName == null ? null : countryName,
        "city": city == null ? null : city,
        "contact_person": contactPerson == null ? null : contactPerson,
        "currency_name": currencyName == null ? null : currencyName,
        "delivery_date": deliveryDate == null
            ? null
            : "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate?.day.toString().padLeft(2, '0')}",
        "street": street,
        "receipt_no": receiptNo == null ? null : receiptNo,
        "receipt_date": receiptDate == null
            ? null
            : "${receiptDate!.year.toString().padLeft(4, '0')}-${receiptDate!.month.toString().padLeft(2, '0')}-${receiptDate?.day.toString().padLeft(2, '0')}",
        "order_state_name": orderStateName == null ? null : orderStateName,
        "order_state_id": orderStateId == null ? null : orderStateId,
        "project_no": projectNo,
        "position_count": positionCount == null ? null : positionCount,
        "payment_state_name":
            paymentStateName == null ? null : paymentStateName,
        "payment_state_id": paymentStateId == null ? null : paymentStateId,
        "purchase_payment_booking_state_id":
            purchasePaymentBookingStateId == null
                ? null
                : purchasePaymentBookingStateId,
        "purchase_payment_booking_state_name":
            purchasePaymentBookingStateName == null
                ? null
                : purchasePaymentBookingStateName,
        "total_gross_amount":
            totalGrossAmount == null ? null : totalGrossAmount,
        "total_net_amount": totalNetAmount == null ? null : totalNetAmount,
        "total_rebate_amount":
            totalRebateAmount == null ? null : totalRebateAmount,
        "total_vat_amount": totalVatAmount == null ? null : totalVatAmount,
        "delivery_value": deliveryValue == null ? null : deliveryValue,
        "user": user == null ? null : user,
        "vendor_id": vendorId == null ? null : vendorId,
        "vendor_no": vendorNo == null ? null : vendorNo,
        "vendor_name1": vendorName1 == null ? null : vendorName1,
        "vendor_name2": vendorName2,
        "vendor_name3": vendorName3,
        "zip_code": zipCode,
      };
}
