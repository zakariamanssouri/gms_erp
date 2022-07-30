
import 'package:gms_erp/config/global_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseService  
{
    static Future<String> GET_DOMAIN() async
    {
        final prefs = await SharedPreferences.getInstance();
        final value = prefs.getString(GlobalParams.key_domain) ?? "";
        GlobalParams.baseUrl = value;

        return GlobalParams.baseUrl;
    }

    static Future<String> SET_DOMAIN(String value) async
    {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(GlobalParams.key_domain, value);
        GlobalParams.baseUrl = value;

        return GlobalParams.baseUrl;
    }


    static dynamic READTOKEN() async 
    {
        final prefs = await SharedPreferences.getInstance(); 
        return prefs.getString(GlobalParams.key_token);
    }
   
     static dynamic HEADERS() async 
    {
        String token = await READTOKEN();
        return  {
            'Content-Type': 'application/json; charset=UTF-8', 
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          };
    }

    static dynamic HEADERS_WITHOUT_TOKEN() async 
    {
        return  
        {
            'Content-Type': 'application/json; charset=UTF-8', 
            'Accept': 'application/json', 
        };
    } 
}

 
 