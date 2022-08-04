import 'dart:convert';

Vendor vendorFromJson(String str) => Vendor.fromJson(json.decode(str));

String vendorToJson(Vendor data) => json.encode(data.toJson());

class Vendor {
    Vendor({
        required this.id,
        required this.vendorNo,
        required this.accountingNo,
        required this.addressId,
        required this.countryId,
        required this.countryName,
        required this.displayName,
        required this.vendorName1,
        required this.vendorName2,
        required this.vendorName3,
        required this.invoiceEmailAddress,
        required this.isActive,
        required this.vendorGroupId,
        required this.vendorGroup,
        required this.vendorTypeId,
        required this.vendorType,
        required this.street,
        required this.zipCode,
        required this.city,
        required this.addressText,
        required this.contactDisplayName,
        required this.contactPhone,
        required this.contactFax,
        required this.contactMobileNumber,
        required this.isAccountingDiverse,
        required this.insUser,
        required this.insDatime,
        required this.updUser,
        required this.updDatime,
        required this.currencyId,
        required this.taxIdentNo,
        required this.iceNo,
    });

    String ? id;
    String ? vendorNo;
    String ? accountingNo;
    String ? addressId;
    String ? countryId;
    String ? countryName;
    String ? displayName;
    String ? vendorName1;
    dynamic?  vendorName2;
    dynamic?  vendorName3;
    dynamic?  invoiceEmailAddress;
    String ? isActive;
    String ? vendorGroupId;
    String ? vendorGroup;
    String ? vendorTypeId;
    String ? vendorType;
    String ? street;
    String ? zipCode;
    String ? city;
    dynamic?  addressText;
    String ? contactDisplayName;
    String ? contactPhone;
    String ? contactFax;
    dynamic?  contactMobileNumber;
    String ? isAccountingDiverse;
    String ? insUser;
    DateTime ?insDatime;
    String? updUser;
    DateTime? updDatime;
    String? currencyId;
    String? taxIdentNo;
    String? iceNo;

    factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        vendorNo: json["vendor_no"],
        accountingNo: json["accounting_no"],
        addressId: json["address_id"],
        countryId: json["country_id"],
        countryName: json["country_name"],
        displayName: json["display_name"],
        vendorName1: json["vendor_name1"],
        vendorName2: json["vendor_name2"],
        vendorName3: json["vendor_name3"],
        invoiceEmailAddress: json["invoice_email_address"],
        isActive: json["is_active"],
        vendorGroupId: json["vendor_group_id"],
        vendorGroup: json["vendor_group"],
        vendorTypeId: json["vendor_type_id"],
        vendorType: json["vendor_type"],
        street: json["street"],
        zipCode: json["zip_code"],
        city: json["city"],
        addressText: json["address_text"],
        contactDisplayName: json["contact_display_name"],
        contactPhone: json["contact_phone"],
        contactFax: json["contact_fax"],
        contactMobileNumber: json["contact_mobile_number"],
        isAccountingDiverse: json["is_accounting_diverse"],
        insUser: json["ins_user"],
        insDatime: DateTime.parse(json["ins_datime"]),
        updUser: json["upd_user"],
        updDatime: DateTime.parse(json["upd_datime"]),
        currencyId: json["currency_id"],
        taxIdentNo: json["tax_ident_no"],
        iceNo: json["ice_no"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_no": vendorNo,
        "accounting_no": accountingNo,
        "address_id": addressId,
        "country_id": countryId,
        "country_name": countryName,
        "display_name": displayName,
        "vendor_name1": vendorName1,
        "vendor_name2": vendorName2,
        "vendor_name3": vendorName3,
        "invoice_email_address": invoiceEmailAddress,
        "is_active": isActive,
        "vendor_group_id": vendorGroupId,
        "vendor_group": vendorGroup,
        "vendor_type_id": vendorTypeId,
        "vendor_type": vendorType,
        "street": street,
        "zip_code": zipCode,
        "city": city,
        "address_text": addressText,
        "contact_display_name": contactDisplayName,
        "contact_phone": contactPhone,
        "contact_fax": contactFax,
        "contact_mobile_number": contactMobileNumber,
        "is_accounting_diverse": isAccountingDiverse,
        "ins_user": insUser,
        "ins_datime": insDatime?.toIso8601String(),
        "upd_user": updUser,
        "upd_datime": updDatime?.toIso8601String(),
        "currency_id": currencyId,
        "tax_ident_no": taxIdentNo,
        "ice_no": iceNo,
    };
}
