class CustomerInvoice {
  String? id;
  String? orderTypeId;
  String? orderTypeName;
  String? customerNo;
  String? customerId;
  String? companyId;
  String? address1;
  String? address2;
  String? address3;
  String? countryName;
  String? zipCode;
  String? city;
  String? street;
  String? contactPerson;
  String? invoiceNo;
  String? orderNo;
  String? orderDate;
  String? deliveryNo;
  String? bookingNo;
  String? customerContractNo;
  String? entityId;
  String? invoiceDate;
  String? deliveryDate;
  String? holdbackOfGuaranteeRel;
  String? holdbackOfGuaranteeAmount;
  String? holdbackOfGuaranteeDateValuta;
  String? openAmount;
  String? isClosed;
  String? isCanceled;
  String? isApproved;
  String? isPrinted;
  String? isSplitInvoice;
  String? isCollectiveInvoice;
  String? isPartialInvoice;
  String? isPrepaidInvoice;
  String? isFinalInvoice;
  String? isTotalRebateAmount;
  String? isTransferedToAccountancy;
  String? isTransferedToFinancialAccounting;
  String? transferedToFinancialAccountingDatime;
  String? totalGrossAmount;
  String? totalNetAmount;
  String? totalRebateAmount;
  String? totalRebateGrossAmount;
  String? totalRebatePositionAmount;
  String? totalRebateRel;
  String? totalVatAmount;
  String? positionNetAmount;
  String? paymentTypeName;
  String? paymentStateName;
  String? paymentStateId;
  String? transportCostVatRate;
  String? transportCosts;
  String? transportCostsGrossAmount;
  String? cashTax;
  String? touristicTax;
  String? user;
  String? locationId;
  String? locationName;
  String? projectDescription;
  String? vatRate;
  String? vatBookingGroupId;
  String? vatIdentNo;

  CustomerInvoice(
      {this.id,
      this.orderTypeId,
      this.orderTypeName,
      this.customerNo,
      this.customerId,
      this.companyId,
      this.address1,
      this.address2,
      this.address3,
      this.countryName,
      this.zipCode,
      this.city,
      this.street,
      this.contactPerson,
      this.invoiceNo,
      this.orderNo,
      this.orderDate,
      this.deliveryNo,
      this.bookingNo,
      this.customerContractNo,
      this.entityId,
      this.invoiceDate,
      this.deliveryDate,
      this.holdbackOfGuaranteeRel,
      this.holdbackOfGuaranteeAmount,
      this.holdbackOfGuaranteeDateValuta,
      this.openAmount,
      this.isClosed,
      this.isCanceled,
      this.isApproved,
      this.isPrinted,
      this.isSplitInvoice,
      this.isCollectiveInvoice,
      this.isPartialInvoice,
      this.isPrepaidInvoice,
      this.isFinalInvoice,
      this.isTotalRebateAmount,
      this.isTransferedToAccountancy,
      this.isTransferedToFinancialAccounting,
      this.transferedToFinancialAccountingDatime,
      this.totalGrossAmount,
      this.totalNetAmount,
      this.totalRebateAmount,
      this.totalRebateGrossAmount,
      this.totalRebatePositionAmount,
      this.totalRebateRel,
      this.totalVatAmount,
      this.positionNetAmount,
      this.paymentTypeName,
      this.paymentStateName,
      this.paymentStateId,
      this.transportCostVatRate,
      this.transportCosts,
      this.transportCostsGrossAmount,
      this.cashTax,
      this.touristicTax,
      this.user,
      this.locationId,
      this.locationName,
      this.projectDescription,
      this.vatRate,
      this.vatBookingGroupId,
      this.vatIdentNo});

  CustomerInvoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderTypeId = json['order_type_id'];
    orderTypeName = json['order_type_name'];
    customerNo = json['customer_no'];
    customerId = json['customer_id'];
    companyId = json['company_id'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    countryName = json['country_name'];
    zipCode = json['zip_code'];
    city = json['city'];
    street = json['street'];
    contactPerson = json['contact_person'];
    invoiceNo = json['invoice_no'];
    orderNo = json['order_no'];
    orderDate = json['order_date'];
    deliveryNo = json['delivery_no'];
    bookingNo = json['booking_no'];
    customerContractNo = json['customer_contract_no'];
    entityId = json['entity_id'];
    invoiceDate = json['invoice_date'];
    deliveryDate = json['delivery_date'];
    holdbackOfGuaranteeRel = json['holdback_of_guarantee_rel'];
    holdbackOfGuaranteeAmount = json['holdback_of_guarantee_amount'];
    holdbackOfGuaranteeDateValuta = json['holdback_of_guarantee_date_valuta'];
    openAmount = json['open_amount'];
    isClosed = json['is_closed'];
    isCanceled = json['is_canceled'];
    isApproved = json['is_approved'];
    isPrinted = json['is_printed'];
    isSplitInvoice = json['is_split_invoice'];
    isCollectiveInvoice = json['is_collective_invoice'];
    isPartialInvoice = json['is_partial_invoice'];
    isPrepaidInvoice = json['is_prepaid_invoice'];
    isFinalInvoice = json['is_final_invoice'];
    isTotalRebateAmount = json['is_total_rebate_amount'];
    isTransferedToAccountancy = json['is_transfered_to_accountancy'];
    isTransferedToFinancialAccounting =
        json['is_transfered_to_financial_accounting'];
    transferedToFinancialAccountingDatime =
        json['transfered_to_financial_accounting_datime'];
    totalGrossAmount = json['total_gross_amount'];
    totalNetAmount = json['total_net_amount'];
    totalRebateAmount = json['total_rebate_amount'];
    totalRebateGrossAmount = json['total_rebate_gross_amount'];
    totalRebatePositionAmount = json['total_rebate_position_amount'];
    totalRebateRel = json['total_rebate_rel'];
    totalVatAmount = json['total_vat_amount'];
    positionNetAmount = json['position_net_amount'];
    paymentTypeName = json['payment_type_name'];
    paymentStateName = json['payment_state_name'];
    paymentStateId = json['payment_state_id'];
    transportCostVatRate = json['transport_cost_vat_rate'];
    transportCosts = json['transport_costs'];
    transportCostsGrossAmount = json['transport_costs_gross_amount'];
    cashTax = json['cash_tax'];
    touristicTax = json['touristic_tax'];
    user = json['user'];
    locationId = json['location_id'];
    locationName = json['location_name'];
    projectDescription = json['project_description'];
    vatRate = json['vat_rate'];
    vatBookingGroupId = json['vat_booking_group_id'];
    vatIdentNo = json['vat_ident_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_type_id'] = this.orderTypeId;
    data['order_type_name'] = this.orderTypeName;
    data['customer_no'] = this.customerNo;
    data['customer_id'] = this.customerId;
    data['company_id'] = this.companyId;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['address3'] = this.address3;
    data['country_name'] = this.countryName;
    data['zip_code'] = this.zipCode;
    data['city'] = this.city;
    data['street'] = this.street;
    data['contact_person'] = this.contactPerson;
    data['invoice_no'] = this.invoiceNo;
    data['order_no'] = this.orderNo;
    data['order_date'] = this.orderDate;
    data['delivery_no'] = this.deliveryNo;
    data['booking_no'] = this.bookingNo;
    data['customer_contract_no'] = this.customerContractNo;
    data['entity_id'] = this.entityId;
    data['invoice_date'] = this.invoiceDate;
    data['delivery_date'] = this.deliveryDate;
    data['holdback_of_guarantee_rel'] = this.holdbackOfGuaranteeRel;
    data['holdback_of_guarantee_amount'] = this.holdbackOfGuaranteeAmount;
    data['holdback_of_guarantee_date_valuta'] =
        this.holdbackOfGuaranteeDateValuta;
    data['open_amount'] = this.openAmount;
    data['is_closed'] = this.isClosed;
    data['is_canceled'] = this.isCanceled;
    data['is_approved'] = this.isApproved;
    data['is_printed'] = this.isPrinted;
    data['is_split_invoice'] = this.isSplitInvoice;
    data['is_collective_invoice'] = this.isCollectiveInvoice;
    data['is_partial_invoice'] = this.isPartialInvoice;
    data['is_prepaid_invoice'] = this.isPrepaidInvoice;
    data['is_final_invoice'] = this.isFinalInvoice;
    data['is_total_rebate_amount'] = this.isTotalRebateAmount;
    data['is_transfered_to_accountancy'] = this.isTransferedToAccountancy;
    data['is_transfered_to_financial_accounting'] =
        this.isTransferedToFinancialAccounting;
    data['transfered_to_financial_accounting_datime'] =
        this.transferedToFinancialAccountingDatime;
    data['total_gross_amount'] = this.totalGrossAmount;
    data['total_net_amount'] = this.totalNetAmount;
    data['total_rebate_amount'] = this.totalRebateAmount;
    data['total_rebate_gross_amount'] = this.totalRebateGrossAmount;
    data['total_rebate_position_amount'] = this.totalRebatePositionAmount;
    data['total_rebate_rel'] = this.totalRebateRel;
    data['total_vat_amount'] = this.totalVatAmount;
    data['position_net_amount'] = this.positionNetAmount;
    data['payment_type_name'] = this.paymentTypeName;
    data['payment_state_name'] = this.paymentStateName;
    data['payment_state_id'] = this.paymentStateId;
    data['transport_cost_vat_rate'] = this.transportCostVatRate;
    data['transport_costs'] = this.transportCosts;
    data['transport_costs_gross_amount'] = this.transportCostsGrossAmount;
    data['cash_tax'] = this.cashTax;
    data['touristic_tax'] = this.touristicTax;
    data['user'] = this.user;
    data['location_id'] = this.locationId;
    data['location_name'] = this.locationName;
    data['project_description'] = this.projectDescription;
    data['vat_rate'] = this.vatRate;
    data['vat_booking_group_id'] = this.vatBookingGroupId;
    data['vat_ident_no'] = this.vatIdentNo;
    return data;
  }
}