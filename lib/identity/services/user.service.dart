// ignore_for_file: non_constant_identifier_names
import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:gms_erp/identity/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/global_params.dart';
import '../../service.base.dart';
 


const baseUrl=  "http://127.0.0.1:8000/api";
 

class UserService   
{
  
  

  Future<List<User>> getAll() async 
  {
    final url= Uri.parse("$baseUrl/register");

    final headers=await BaseService.HEADERS() ;
    Response res = await get(url,headers:headers);
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
    final headers=await BaseService.HEADERS_WITHOUT_TOKEN() ;
    final Response response = await http.post(url,headers: headers,body: jsonEncode(data),);
    if (response.statusCode == 200) 
    {
      return User.fromJson(json.decode(response.body));
    }
    else
    {
      throw Exception('Failed to post data');
    }
  }
  Future<String> Login(User obj) async
  {
    final url=Uri.parse("$baseUrl/login");
    Map data={
       'email': obj.email,
       'password':obj.password,
    };
    final Response response = await http.post(url,body:data,);
    if(response.statusCode==200)
    {
      final parsed = json.decode(response.body);
      print(parsed['token']) ;
      return parsed['token'];
    }
    else
    {
     // print('${response.statusCode}');
         return 'error';
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
      final headers=await BaseService.HEADERS_WITHOUT_TOKEN() ;
      final response = await http.put(url,headers: headers,  body: jsonEncode(data));

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
       final headers=await BaseService.HEADERS_WITHOUT_TOKEN() ;
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