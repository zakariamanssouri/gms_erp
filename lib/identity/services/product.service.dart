
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/product.dart';


const baseUrl=  "http://127.0.0.1:8000/api";
//const baseUrl=  "http://144.91.76.98:84/AndroidDB";
const headers=<String, String>{
  'Content-Type': 'application/json; charset=UTF-8',
};

class ProductService  {
 

    Future<List<Product>> getAll() async {

    final url= Uri.parse("$baseUrl/produits");
    //var url= Uri.parse("$baseUrl/search.php?barcode=all");
    Response res = await get(url);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Product> cases = body.map((dynamic item) => Product.fromJson(item)).toList();
      return cases;
    } else {
      throw "Failed to load cases list";
    }
  }

 
  Future<Product> create(Product obj) async {
    var url= Uri.parse("$baseUrl/produits");

    Map data={
      'name': obj.name,
      'price': obj.price,
      'quantity': obj.quantity,
      'components': obj.components,
    };

    final Response response = await http.post(  url,
      headers: headers,
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }
  // ghalat fa type hana ta3 price
  Future update(Product obj) async {
    try{
      var url= Uri.parse("$baseUrl/produits/"+obj.id.toString());
      Map data={
        'id': obj.id,
        'name': obj.name,
        'price': obj.price,
        'quantity': obj.quantity,
        'components': obj.components,
      };

      final response = await http.put(url,   headers: headers,  body: jsonEncode(data));

      if(response.statusCode==200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return e.toString();
    }

  }
  ///////////////////////////////////DELETE PRODUCT BY ID
  Future delete(String id) async {

    try{
      var url = baseUrl + "/produits";
      final response = await http.put(Uri.parse('$url/$id'));
      if(response.statusCode==200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return e.toString();
    }

  }

}