
// ignore_for_file: unrelated_type_equality_checks

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
    
    static Future<List<String>> GET_DOMAINS() async
    { 
        final prefs = await SharedPreferences.getInstance();
        List<String> data = prefs.getStringList(GlobalParams.key_domains) ??[];
        return data;
       
    }
    static Future<Object> ADD_DOMAIN(String value) async
    {  
      
        final prefs = await SharedPreferences.getInstance();
        await GET_DOMAINS().then((domains) => {
            if(!domains.contains(value))
            { 
                domains.add(value),                
                prefs.setString(GlobalParams.key_domain, value),
               SET_DOMAIN(domains),
            }
        });
        
      
        return  GET_DOMAINS() ;
    }

    static Future<List<String>> SET_DOMAIN(List<String> values) async
    {
        final prefs = await SharedPreferences.getInstance();
        prefs.setStringList(GlobalParams.key_domains, values);

        return values;
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

 
 