
class Product{
  final int id;
  final String name;
  final String price;
  final int quantity;
  final String components;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.components
  });

  //convert arrey into list

  factory Product.fromJson(Map<String, dynamic> json) {

// {"success":1,"message":"Search Successful!","data":[{"id":"1178","product_no":"0001","product_name1":"VIANDE A BROCHETTE

    //var name=json['data']['product_name1']; 
     print("test fromJson");
    String name="bochra"; 
    return Product(
      id: 1,
      name: name,
      price: name,
      quantity: 33,
      components: name,
    );
  }

  Map toJson() {
    return {'id': id, 'name': name, 'price': price, 'quantity': quantity, 'components': components};
  }
  String tostring(){
    String result = "$id  $name  $price $quantity $components";
    return result.toString();
  }
}

