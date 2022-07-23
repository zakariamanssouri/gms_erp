import 'dart:async';
import 'dart:convert';
import 'package:gms_erp/identity/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
 


const baseUrl=  "http://127.0.0.1:8000/api";
const headers=<String, String>
{
  'Content-Type': 'application/json; charset=UTF-8',
};

class UserService  
{
  Future<List<User>> getAll() async 
  {
    final url= Uri.parse("$baseUrl/register");
    Response res = await get(url);
    if (res.statusCode == 200) 
    {
      List<dynamic> body = jsonDecode(res.body);
      List<User> data = body.map((dynamic item) => User.fromJson(item)).toList();
      return data;
    } 
    else
    {
      throw "Failed to load data list";
    }
  }

  Future<User> create(User obj) async 
  {

    var url= Uri.parse("$baseUrl/register");
    Map data={
      'name': obj.name,
      'email': obj.email,
      'password':obj.password,
    };

    final Response response = await http.post(  url,
      headers: headers,
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) 
    {
      return User.fromJson(json.decode(response.body));
    }
    else
    {
      throw Exception('Failed to post data');
    }
  }
  // ghalat fa type hana ta3 price
  Future update(User obj) async 
  {
    try
    {
      var url= Uri.parse("$baseUrl/register/"+obj.id.toString());
      Map data={
        'id': obj.id,
        'name': obj.name,
        'email': obj.email,
      };

      final response = await http.put(url,   headers: headers,  body: jsonEncode(data));

      if(response.statusCode==200)
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    catch(e)
    {
      return e.toString();
    }

  }
  //DELETE PRODUCT BY ID
  Future delete(String id) async 
  {
    try
    {
      var url = baseUrl + "/register";
      final response = await http.put(Uri.parse('$url/$id'));
      if(response.statusCode==200)
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    catch(e)
    {
      return e.toString();
    }

  }

}