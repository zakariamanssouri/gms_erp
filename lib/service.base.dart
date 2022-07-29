
import 'package:gms_erp/config/global_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseService  
{
    

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
   
    // ignore: non_constant_identifier_names
    static dynamic HEADERS_WITHOUT_TOKEN() async 
    {
        // ignore: unused_local_variable
       // String token = await READTOKEN();
        return  
        {
            'Content-Type': 'application/json; charset=UTF-8', 
            'Accept': 'application/json', 
        };
    } 
}

 
 