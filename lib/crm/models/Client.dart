class Client {
  String id, no, name, country, type, group, street, city, phone;
  String? etat, vat;
  String? type_id, grp_id, state_id, vat_id;

  Client(
    {required this.id,
    required this.no,
    required this.name,
    required this.country,
    required this.type,
    required this.group,
    required this.street,
    required this.city,
    required this.phone}
  );

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
        id: json["id"].toString(),
        no: json["customer_no"],
        name: json["customer_name1"],
        country: json["country_name"],
        type: json["customer_type"],
        group: json["customer_group"],
        street: json["street"] == null ? '' : json["street"],
        city: json["city"],
        phone: json["contact_phone"]);
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_no": no,
        "customer_name1": name,
        "customer_type_id": type_id,
        "customer_group_id": grp_id,
        "customer_state_id": state_id,
        "vat_booking_group_id": vat_id,
        "country_name": country,
        "customer_type": type,
        "customer_group": group,
        "street": street,
        "city": city,
        "contact_phone": phone,
        "currency_id":  2.toString(),
        "customer_model_id":  3.toString(),
        "delivery_type_id":  1.toString(),
        "salutation_id":  3.toString(),
        "address_pool_id":  15707.toString(),
    };

  
 get getNo => this.no;

 set setNo(no) => this.no = no;

 get getId => this.id;

 set setId(id) => this.id = id;

 get getName => this.name;

 set setName( name) => this.name = name;

 get getCountry => this.country;

 set setCountry( country) => this.country = country;

 get getType => this.type;

 set setType( type) => this.type = type;

 get getGroup => this.group;

 set setGroup( group) => this.group = group;

 get getStreet => this.street;

 set setStreet( street) => this.street = street;

 get getCity => this.city;

 set setCity( city) => this.city = city;

  get getPhone => this.phone;

 set setPhone( phone) => this.phone = phone;

}