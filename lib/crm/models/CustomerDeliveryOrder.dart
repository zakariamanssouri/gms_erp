// To parse this JSON data, do
//
//     final customerDeliveryOrder = customerDeliveryOrderFromJson(jsonString);

import 'dart:convert';

CustomerDeliveryOrder customerDeliveryOrderFromJson(String str) =>
    CustomerDeliveryOrder.fromJson(json.decode(str));

String customerDeliveryOrderToJson(CustomerDeliveryOrder data) =>
    json.encode(data.toJson());

class CustomerDeliveryOrder {
  CustomerDeliveryOrder({
    this.id,
    this.applicationUserId,
    this.address1,
    this.address2,
    this.address3,
    this.customerNo,
    this.city,
    this.customerId,
    this.customerOrderHeaderId,
    this.customerContractId,
    this.companyId,
    this.commissionId,
    this.countryName,
    this.contactPerson,
    this.currencyId,
    this.currencyName,
    this.cashTax,
    this.collectiveInvoiceId,
    this.deliveryDate,
    this.editStateOnCancel,
    this.locationId,
    this.orderNo,
    this.orderDate,
    this.orderStateId,
    this.positionNetAmount,
    this.paymentStateId,
    this.paymentTypeId,
    this.paymentConditionId,
    this.projectId,
    this.receiptNo,
    this.receiptDate,
    this.salutation,
    this.street,
    this.schoolRegistrationId,
    this.totalNetAmount,
    this.totalRebateGrossAmount,
    this.totalRebateAmount,
    this.totalRebatePositionAmount,
    this.totalRebateRel,
    this.holdbackOfGuaranteeRel,
    this.holdbackOfGuaranteeAmount,
    this.holdbackOfGuaranteeDateValuta,
    this.transportCosts,
    this.transportCostsGrossAmount,
    this.transportCostVatRate,
    this.totalVatAmount,
    this.totalGrossAmount,
    this.isPrinted,
    this.isCanceled,
    this.isTotalRebateAmount,
    this.isSplitDeliveryOrder,
    this.isPartialDelivery,
    this.isPrepaidDelivery,
    this.printDate,
    this.textValueHeader,
    this.textValueFooter,
    this.textTemplateHeaderId,
    this.textTemplateFooterId,
    this.insDatime,
    this.updDatime,
    this.insUser,
    this.updUser,
    this.zipCode,
  });

  String? id;
  String? applicationUserId;
  String? address1;
  String? address2;
  String? address3;
  String? customerNo;
  String? city;
  String? customerId;
  String? customerOrderHeaderId;
  String? customerContractId;
  String? companyId;
  String? commissionId;
  String? countryName;
  String? contactPerson;
  String? currencyId;
  String? currencyName;
  String? cashTax;
  String? collectiveInvoiceId;
  DateTime? deliveryDate;
  String? editStateOnCancel;
  String? locationId;
  String? orderNo;
  DateTime? orderDate;
  String? orderStateId;
  String? positionNetAmount;
  String? paymentStateId;
  String? paymentTypeId;
  String? paymentConditionId;
  String? projectId;
  String? receiptNo;
  DateTime? receiptDate;
  String? salutation;
  String? street;
  String? schoolRegistrationId;
  double? totalNetAmount;
  String? totalRebateGrossAmount;
  String? totalRebateAmount;
  String? totalRebatePositionAmount;
  String? totalRebateRel;
  String? holdbackOfGuaranteeRel;
  String? holdbackOfGuaranteeAmount;
  String? holdbackOfGuaranteeDateValuta;
  String? transportCosts;
  String? transportCostsGrossAmount;
  String? transportCostVatRate;
  double? totalVatAmount;
  String? totalGrossAmount;
  String? isPrinted;
  String? isCanceled;
  String? isTotalRebateAmount;
  String? isSplitDeliveryOrder;
  String? isPartialDelivery;
  String? isPrepaidDelivery;
  DateTime? printDate;
  String? textValueHeader;
  String? textValueFooter;
  String? textTemplateHeaderId;
  String? textTemplateFooterId;
  DateTime? insDatime;
  DateTime? updDatime;
  String? insUser;
  String? updUser;
  String? zipCode;

  factory CustomerDeliveryOrder.fromJson(Map<String, dynamic> json) =>
      CustomerDeliveryOrder(
        id: json["id"],
        applicationUserId: json["application_user_id"],
        address1: json["address1"],
        address2: json["address2"],
        address3: json["address3"],
        customerNo: json["customer_no"],
        city: json["city"],
        customerId: json["customer_id"],
        customerOrderHeaderId: json["customer_order_header_id"],
        customerContractId: json["customer_contract_id"],
        companyId: json["company_id"],
        commissionId: json["commission_id"],
        countryName: json["country_name"],
        contactPerson: json["contact_person"],
        currencyId: json["currency_id"],
        currencyName: json["currency_name"],
        cashTax: json["cash_tax"],
        collectiveInvoiceId: json["collective_invoice_id"],
        deliveryDate: DateTime.parse(json["delivery_date"]),
        editStateOnCancel: json["edit_state_on_cancel"],
        locationId: json["location_id"],
        orderNo: json["order_no"],
        orderDate: DateTime.parse(json["order_date"]),
        orderStateId: json["order_state_id"],
        positionNetAmount: json["position_net_amount"],
        paymentStateId: json["payment_state_id"],
        paymentTypeId: json["payment_type_id"],
        paymentConditionId: json["payment_condition_id"],
        projectId: json["project_id"],
        receiptNo: json["receipt_no"],
        receiptDate: DateTime.parse(json["receipt_date"]),
        salutation: json["salutation"],
        street: json["street"],
        schoolRegistrationId: json["school_registration_id"],
        totalNetAmount: double.parse(json["total_net_amount"]),
        totalRebateGrossAmount: json["total_rebate_gross_amount"],
        totalRebateAmount: json["total_rebate_amount"],
        totalRebatePositionAmount: json["total_rebate_position_amount"],
        totalRebateRel: json["total_rebate_rel"],
        holdbackOfGuaranteeRel: json["holdback_of_guarantee_rel"],
        holdbackOfGuaranteeAmount: json["holdback_of_guarantee_amount"],
        holdbackOfGuaranteeDateValuta:
            json["holdback_of_guarantee_date_valuta"],
        transportCosts: json["transport_costs"],
        transportCostsGrossAmount: json["transport_costs_gross_amount"],
        transportCostVatRate: json["transport_cost_vat_rate"],
        totalVatAmount: double.parse(json["total_vat_amount"]),
        totalGrossAmount: json["total_gross_amount"],
        isPrinted: json["is_printed"],
        isCanceled: json["is_canceled"],
        isTotalRebateAmount: json["is_total_rebate_amount"],
        isSplitDeliveryOrder: json["is_split_delivery_order"],
        isPartialDelivery: json["is_partial_delivery"],
        isPrepaidDelivery: json["is_prepaid_delivery"],
        printDate: DateTime.parse(json["print_date"]),
        textValueHeader: json["text_value_header"],
        textValueFooter: json["text_value_footer"],
        textTemplateHeaderId: json["text_template_header_id"],
        textTemplateFooterId: json["text_template_footer_id"],
        insDatime: DateTime.parse(json["ins_datime"]),
        updDatime: DateTime.parse(json["upd_datime"]),
        insUser: json["ins_user"],
        updUser: json["upd_user"],
        zipCode: json["zip_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "application_user_id": applicationUserId,
        "address1": address1,
        "address2": address2,
        "address3": address3,
        "customer_no": customerNo,
        "city": city,
        "customer_id": customerId,
        "customer_order_header_id": customerOrderHeaderId,
        "customer_contract_id": customerContractId,
        "company_id": companyId,
        "commission_id": commissionId,
        "country_name": countryName,
        "contact_person": contactPerson,
        "currency_id": currencyId,
        "currency_name": currencyName,
        "cash_tax": cashTax,
        "collective_invoice_id": collectiveInvoiceId,
        "delivery_date": deliveryDate,
        "edit_state_on_cancel": editStateOnCancel,
        "location_id": locationId,
        "order_no": orderNo,
        "order_date": orderDate,
        "order_state_id": orderStateId,
        "position_net_amount": positionNetAmount,
        "payment_state_id": paymentStateId,
        "payment_type_id": paymentTypeId,
        "payment_condition_id": paymentConditionId,
        "project_id": projectId,
        "receipt_no": receiptNo,
        "receipt_date": receiptDate,
        "salutation": salutation,
        "street": street,
        "school_registration_id": schoolRegistrationId,
        "total_net_amount": totalNetAmount,
        "total_rebate_gross_amount": totalRebateGrossAmount,
        "total_rebate_amount": totalRebateAmount,
        "total_rebate_position_amount": totalRebatePositionAmount,
        "total_rebate_rel": totalRebateRel,
        "holdback_of_guarantee_rel": holdbackOfGuaranteeRel,
        "holdback_of_guarantee_amount": holdbackOfGuaranteeAmount,
        "holdback_of_guarantee_date_valuta": holdbackOfGuaranteeDateValuta,
        "transport_costs": transportCosts,
        "transport_costs_gross_amount": transportCostsGrossAmount,
        "transport_cost_vat_rate": transportCostVatRate,
        "total_vat_amount": totalVatAmount,
        "total_gross_amount": totalGrossAmount,
        "is_printed": isPrinted,
        "is_canceled": isCanceled,
        "is_total_rebate_amount": isTotalRebateAmount,
        "is_split_delivery_order": isSplitDeliveryOrder,
        "is_partial_delivery": isPartialDelivery,
        "is_prepaid_delivery": isPrepaidDelivery,
        "print_date":
            "${printDate!.year.toString().padLeft(4, '0')}-${printDate!.month.toString().padLeft(2, '0')}-${printDate?.day.toString().padLeft(2, '0')}",
        "text_value_header": textValueHeader,
        "text_value_footer": textValueFooter,
        "text_template_header_id": textTemplateHeaderId,
        "text_template_footer_id": textTemplateFooterId,
        "ins_datime": insDatime,
        "upd_datime": updDatime,
        "ins_user": insUser,
        "upd_user": updUser,
        "zip_code": zipCode,
      };
}
