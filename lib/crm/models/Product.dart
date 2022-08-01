class Product {
  String id, no, name, s_price, stock_min, code, s_price_min;
  String? p_price, measure, packtype, type, group, state, vat;
  String? measure_id, type_id, packtype_id, grp_id, state_id, vat_id;
  Product(
      {required this.id,
      required this.no,
      required this.name,
      required this.s_price,
      required this.stock_min,
      required this.code,
      required this.s_price_min,
      this.measure_id,
      this.type_id,
      this.grp_id,
      this.packtype_id,
      this.state_id,
      this.vat_id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"].toString(),
        no: json["product_no"],
        name: json["product_name1"],
        s_price: json["sales_price"],
        stock_min: json["stock_min_qty"],
        code: json["ean_code"],
        s_price_min: json["sales_price_min"],
        measure_id: json["measure_id"].toString(),
        type_id: json["product_type_id"].toString(),
        grp_id: json["product_group_id"].toString(),
        packtype_id: json["packtype_id"].toString(),
        state_id: json["product_state_id"].toString(),
        vat_id: json["vat_booking_group_id"].toString(),
        );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "product_no": no,
        "product_name1": name,
        "sales_price": s_price,
        "stock_min_qty": stock_min,
        "ean_code": code,
        "sales_price_min": s_price_min,
        "measure_id": measure_id,
        "product_type_id": type_id,
        "product_group_id": grp_id,
        "product_state_id": state_id,
        "packtype_id": packtype_id,
        "vat_booking_group_id": vat_id,
      };

  get getNo => this.no;

  set setNo(no) => this.no = no;

  get getId => this.id;

  set setId(id) => this.id = id;

  get getName => this.name;

  set setName(name) => this.name = name;

  get getS_price => this.s_price;

  set setS_price(s_price) => this.s_price = s_price;

  get getS_price_min => this.s_price_min;

  set setS_price_min(s_price_min) => this.s_price_min = s_price_min;

  get getStock_min => this.stock_min;

  set setStock_min(stock_min) => this.stock_min = stock_min;

  get getCode => this.code;

  set setCode(code) => this.code = code;

  get getP_price => this.p_price;

  set setP_price(p_price) => this.p_price = p_price;
}
