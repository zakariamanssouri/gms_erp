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
    required this.s_price_min}
  );

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        no: json["product_no"],
        name: json["product_name1"],
        s_price: json["sales_price"],
        stock_min: json["stock_min_qty"],
        code: json["ean_code"],
        s_price_min: json["sales_price_min"]);
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "product_no": no,
        "product_name1": name,
        "sales_price": s_price,
        "stock_min_qty": stock_min,
        "ean_code": code,
        "sales_price_min": s_price_min,
    };

  
 get getNo => this.no;

 set setNo(no) => this.no = no;

 get getId => this.id;

 set setId(id) => this.id = id;

 get getName => this.name;

 set setName( name) => this.name = name;

 get getS_price => this.s_price;

 set setS_price( s_price) => this.s_price = s_price;

 
 get getS_price_min => this.s_price_min;

 set setS_price_min( s_price_min) => this.s_price_min = s_price_min;

 get getStock_min => this.stock_min;

 set setStock_min( stock_min) => this.stock_min = stock_min;

 get getCode => this.code;

 set setCode( code) => this.code = code;
}