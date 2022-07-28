
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
   
    static dynamic HEADERS_WITHOUT_TOKEN() async 
    {
        String token = await READTOKEN();
        return  {
            'Content-Type': 'application/json; charset=UTF-8', 
            'Accept': 'application/json', 
          };
    }

  
}

 
 