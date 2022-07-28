class Client {
  String id, no, name, country, type, group, street, city, phone;
  String? etat, vat;
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
        id: json["id"],
        no: json["customer_no"],
        name: json["customer_name1"],
        country: json["country_name"],
        type: json["customer_type"],
        group: json["customer_group"],
        street: json["street"]==null ? '' : json["street"],
        city: json["city"],
        phone: json["contact_phone"]);
  }

  
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