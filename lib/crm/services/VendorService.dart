import 'dart:convert';
import 'package:gms_erp/crm/models/Vendor.dart';
import 'package:http/http.dart' as http;
import 'package:gms_erp/config/global_params.dart';

class VendorService {
  
  static Future<List<Vendor>> getVendors() async {
    List<Vendor>? list;
    final url= Uri.parse(GlobalParams.baseUrl + 'vendor');
    var res = await http.get(Uri.parse(GlobalParams.baseUrl + 'vendor'));
    var json_data = json.decode(res.body);

    if (res.statusCode == 200) {
      var data = json_data as List;
      list = data.map<Vendor>((json) => Vendor.fromJson(json)).toList();
    }
    else{
      list = null;
  }
  return list!;
}
}