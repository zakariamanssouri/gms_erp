class CustomerDelivery {
  String? id;
  String? address1;
  String? address2;
  String? address3;
  String? cashTaxAmount;
  String? city;
  String? customerContractId;
  String? customerNo;
  String? customerId;
  String? customerHeadOfficeId;
  String? countryName;
  String? contactPerson;
  String? customerDeliveryPaymentHeaderId;
  String? deliveryNo;
  String? deliveryDate;
  String? filterDate;
  String? invoiceNo;
  String? invoiceDate;
  String? iceNo;
  String? info;
  String? isDeliveryOrder;
  String? isOrder;
  String? isInvoice;
  String? isOvernight;
  String? isPos;
  String? isApproved;
  String? isClosed;
  String? isPartialPaid;
  String? isCanceled;
  String? invoiceId;
  String? insDatime;
  String? insUser;
  String? locationId;
  String? locationName;
  String? orderTypeId;
  String? orderTypeName;
  String? orderAddress;
  String? orderNo;
  String? openAmount;
  String? paymentStateName;
  String? paymentStateId;
  String? paymentConditionDays;
  String? projectId;
  String? paymentDate;
  String? paidAmount;
  String? street;
  String? totalGrossAmount;
  String? totalNetAmount;
  String? totalRebateAmount;
  String? totalVatAmount;
  String? user;
  String? updDatime;
  String? updUser;
  String? zipCode;

  CustomerDelivery(
      {this.id,
      this.address1,
      this.address2,
      this.address3,
      this.cashTaxAmount,
      this.city,
      this.customerContractId,
      this.customerNo,
      this.customerId,
      this.customerHeadOfficeId,
      this.countryName,
      this.contactPerson,
      this.customerDeliveryPaymentHeaderId,
      this.deliveryNo,
      this.deliveryDate,
      this.filterDate,
      this.invoiceNo,
      this.invoiceDate,
      this.iceNo,
      this.info,
      this.isDeliveryOrder,
      this.isOrder,
      this.isInvoice,
      this.isOvernight,
      this.isPos,
      this.isApproved,
      this.isClosed,
      this.isPartialPaid,
      this.isCanceled,
      this.invoiceId,
      this.insDatime,
      this.insUser,
      this.locationId,
      this.locationName,
      this.orderTypeId,
      this.orderTypeName,
      this.orderAddress,
      this.orderNo,
      this.openAmount,
      this.paymentStateName,
      this.paymentStateId,
      this.paymentConditionDays,
      this.projectId,
      this.paymentDate,
      this.paidAmount,
      this.street,
      this.totalGrossAmount,
      this.totalNetAmount,
      this.totalRebateAmount,
      this.totalVatAmount,
      this.user,
      this.updDatime,
      this.updUser,
      this.zipCode});

  CustomerDelivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    cashTaxAmount = json['cash_tax_amount'];
    city = json['city'];
    customerContractId = json['customer_contract_id'];
    customerNo = json['customer_no'];
    customerId = json['customer_id'];
    customerHeadOfficeId = json['customer_head_office_id'];
    countryName = json['country_name'];
    contactPerson = json['contact_person'];
    customerDeliveryPaymentHeaderId =
        json['customer_delivery_payment_header_id'];
    deliveryNo = json['delivery_no'];
    deliveryDate = json['delivery_date'];
    filterDate = json['filter_date'];
    invoiceNo = json['invoice_no'];
    invoiceDate = json['invoice_date'];
    iceNo = json['ice_no'];
    info = json['info'];
    isDeliveryOrder = json['is_delivery_order'];
    isOrder = json['is_order'];
    isInvoice = json['is_invoice'];
    isOvernight = json['is_overnight'];
    isPos = json['is_pos'];
    isApproved = json['is_approved'];
    isClosed = json['is_closed'];
    isPartialPaid = json['is_partial_paid'];
    isCanceled = json['is_canceled'];
    invoiceId = json['invoice_id'];
    insDatime = json['ins_datime'];
    insUser = json['ins_user'];
    locationId = json['location_id'];
    locationName = json['location_name'];
    orderTypeId = json['order_type_id'];
    orderTypeName = json['order_type_name'];
    orderAddress = json['order_address'];
    orderNo = json['order_no'];
    openAmount = json['open_amount'];
    paymentStateName = json['payment_state_name'];
    paymentStateId = json['payment_state_id'];
    paymentConditionDays = json['payment_condition_days'];
    projectId = json['project_id'];
    paymentDate = json['payment_date'];
    paidAmount = json['paid_amount'];
    street = json['street'];
    totalGrossAmount = json['total_gross_amount'];
    totalNetAmount = json['total_net_amount'];
    totalRebateAmount = json['total_rebate_amount'];
    totalVatAmount = json['total_vat_amount'];
    user = json['user'];
    updDatime = json['upd_datime'];
    updUser = json['upd_user'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['address3'] = this.address3;
    data['cash_tax_amount'] = this.cashTaxAmount;
    data['city'] = this.city;
    data['customer_contract_id'] = this.customerContractId;
    data['customer_no'] = this.customerNo;
    data['customer_id'] = this.customerId;
    data['customer_head_office_id'] = this.customerHeadOfficeId;
    data['country_name'] = this.countryName;
    data['contact_person'] = this.contactPerson;
    data['customer_delivery_payment_header_id'] =
        this.customerDeliveryPaymentHeaderId;
    data['delivery_no'] = this.deliveryNo;
    data['delivery_date'] = this.deliveryDate;
    data['filter_date'] = this.filterDate;
    data['invoice_no'] = this.invoiceNo;
    data['invoice_date'] = this.invoiceDate;
    data['ice_no'] = this.iceNo;
    data['info'] = this.info;
    data['is_delivery_order'] = this.isDeliveryOrder;
    data['is_order'] = this.isOrder;
    data['is_invoice'] = this.isInvoice;
    data['is_overnight'] = this.isOvernight;
    data['is_pos'] = this.isPos;
    data['is_approved'] = this.isApproved;
    data['is_closed'] = this.isClosed;
    data['is_partial_paid'] = this.isPartialPaid;
    data['is_canceled'] = this.isCanceled;
    data['invoice_id'] = this.invoiceId;
    data['ins_datime'] = this.insDatime;
    data['ins_user'] = this.insUser;
    data['location_id'] = this.locationId;
    data['location_name'] = this.locationName;
    data['order_type_id'] = this.orderTypeId;
    data['order_type_name'] = this.orderTypeName;
    data['order_address'] = this.orderAddress;
    data['order_no'] = this.orderNo;
    data['open_amount'] = this.openAmount;
    data['payment_state_name'] = this.paymentStateName;
    data['payment_state_id'] = this.paymentStateId;
    data['payment_condition_days'] = this.paymentConditionDays;
    data['project_id'] = this.projectId;
    data['payment_date'] = this.paymentDate;
    data['paid_amount'] = this.paidAmount;
    data['street'] = this.street;
    data['total_gross_amount'] = this.totalGrossAmount;
    data['total_net_amount'] = this.totalNetAmount;
    data['total_rebate_amount'] = this.totalRebateAmount;
    data['total_vat_amount'] = this.totalVatAmount;
    data['user'] = this.user;
    data['upd_datime'] = this.updDatime;
    data['upd_user'] = this.updUser;
    data['zip_code'] = this.zipCode;
    return data;
  }
}