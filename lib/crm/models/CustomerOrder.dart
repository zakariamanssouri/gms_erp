class CustomerOrder {
  String? id;
  String? address1;
  String? address2;
  String? address3;
  String? customerId;
  String? customerNo;
  String? countryName;
  String? city;
  String? currencyName;
  String? customerOrderNo;
  String? contactPerson;
  String? invoiceCount;
  String? canEdit;
  String? canDelete;
  String? canCancel;
  String? canConvertToCreditNote;
  String? canCreateInvoicePreCheck;
  String? deliveryDate;
  String? canProformaInvoice;
  String? isPartialInvoice;
  String? isPrepaidInvoice;
  String? itemsOnStock;
  String? qtyOpen;
  String? isNotAllQtyOnStock;
  String? locationId;
  String? location;
  String? orderStateName;
  String? orderStateId;
  String? positionCount;
  String? paymentTypeId;
  String? paymentTypeName;
  String? projectDescription;
  String? qtyInvoiceOpen;
  String? receiptNo;
  String? receiptDate;
  String? receiptType;
  String? street;
  String? totalGrossAmount;
  String? totalNetAmount;
  String? totalRebateAmount;
  String? totalVatAmount;
  String? user;
  String? zipCode;

  CustomerOrder(
      {this.id,
      this.address1,
      this.address2,
      this.address3,
      this.customerId,
      this.customerNo,
      this.countryName,
      this.city,
      this.currencyName,
      this.customerOrderNo,
      this.contactPerson,
      this.invoiceCount,
      this.canEdit,
      this.canDelete,
      this.canCancel,
      this.canConvertToCreditNote,
      this.canCreateInvoicePreCheck,
      this.deliveryDate,
      this.canProformaInvoice,
      this.isPartialInvoice,
      this.isPrepaidInvoice,
      this.itemsOnStock,
      this.qtyOpen,
      this.isNotAllQtyOnStock,
      this.locationId,
      this.location,
      this.orderStateName,
      this.orderStateId,
      this.positionCount,
      this.paymentTypeId,
      this.paymentTypeName,
      this.projectDescription,
      this.qtyInvoiceOpen,
      this.receiptNo,
      this.receiptDate,
      this.receiptType,
      this.street,
      this.totalGrossAmount,
      this.totalNetAmount,
      this.totalRebateAmount,
      this.totalVatAmount,
      this.user,
      this.zipCode});

  CustomerOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    customerId = json['customer_id'];
    customerNo = json['customer_no'];
    countryName = json['country_name'];
    city = json['city'];
    currencyName = json['currency_name'];
    customerOrderNo = json['customer_order_no'];
    contactPerson = json['contact_person'];
    invoiceCount = json['invoice_count'];
    canEdit = json['can_edit'];
    canDelete = json['can_delete'];
    canCancel = json['can_cancel'];
    canConvertToCreditNote = json['can_convert_to_credit_note'];
    canCreateInvoicePreCheck = json['can_create_invoice_pre_check'];
    deliveryDate = json['delivery_date'];
    canProformaInvoice = json['can_proforma_invoice'];
    isPartialInvoice = json['is_partial_invoice'];
    isPrepaidInvoice = json['is_prepaid_invoice'];
    itemsOnStock = json['items_on_stock'];
    qtyOpen = json['qty_open'];
    isNotAllQtyOnStock = json['is_not_all_qty_on_stock'];
    locationId = json['location_id'];
    location = json['location'];
    orderStateName = json['order_state_name'];
    orderStateId = json['order_state_id'];
    positionCount = json['position_count'];
    paymentTypeId = json['payment_type_id'];
    paymentTypeName = json['payment_type_name'];
    projectDescription = json['project_description'];
    qtyInvoiceOpen = json['qty_invoice_open'];
    receiptNo = json['receipt_no'];
    receiptDate = json['receipt_date'];
    receiptType = json['receipt_type'];
    street = json['street'];
    totalGrossAmount = json['total_gross_amount'];
    totalNetAmount = json['total_net_amount'];
    totalRebateAmount = json['total_rebate_amount'];
    totalVatAmount = json['total_vat_amount'];
    user = json['user'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['address3'] = this.address3;
    data['customer_id'] = this.customerId;
    data['customer_no'] = this.customerNo;
    data['country_name'] = this.countryName;
    data['city'] = this.city;
    data['currency_name'] = this.currencyName;
    data['customer_order_no'] = this.customerOrderNo;
    data['contact_person'] = this.contactPerson;
    data['invoice_count'] = this.invoiceCount;
    data['can_edit'] = this.canEdit;
    data['can_delete'] = this.canDelete;
    data['can_cancel'] = this.canCancel;
    data['can_convert_to_credit_note'] = this.canConvertToCreditNote;
    data['can_create_invoice_pre_check'] = this.canCreateInvoicePreCheck;
    data['delivery_date'] = this.deliveryDate;
    data['can_proforma_invoice'] = this.canProformaInvoice;
    data['is_partial_invoice'] = this.isPartialInvoice;
    data['is_prepaid_invoice'] = this.isPrepaidInvoice;
    data['items_on_stock'] = this.itemsOnStock;
    data['qty_open'] = this.qtyOpen;
    data['is_not_all_qty_on_stock'] = this.isNotAllQtyOnStock;
    data['location_id'] = this.locationId;
    data['location'] = this.location;
    data['order_state_name'] = this.orderStateName;
    data['order_state_id'] = this.orderStateId;
    data['position_count'] = this.positionCount;
    data['payment_type_id'] = this.paymentTypeId;
    data['payment_type_name'] = this.paymentTypeName;
    data['project_description'] = this.projectDescription;
    data['qty_invoice_open'] = this.qtyInvoiceOpen;
    data['receipt_no'] = this.receiptNo;
    data['receipt_date'] = this.receiptDate;
    data['receipt_type'] = this.receiptType;
    data['street'] = this.street;
    data['total_gross_amount'] = this.totalGrossAmount;
    data['total_net_amount'] = this.totalNetAmount;
    data['total_rebate_amount'] = this.totalRebateAmount;
    data['total_vat_amount'] = this.totalVatAmount;
    data['user'] = this.user;
    data['zip_code'] = this.zipCode;
    return data;
  }
}