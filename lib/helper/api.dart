import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url,String? token}) async {
    Map<String,String> headers={};
    if(token != null){
      headers.addAll({'authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'this is the problem is statusCode ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> post({required String url, dynamic body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'this is the problem is statusCode ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
  
  Future<Map<String,dynamic>> put({required String url, dynamic body, String? token})async{
    Map<String, String> headers={};
    headers.addAll({'Content-Type':'application/x-www-form-urlencoded'});
    if(token != null){
      headers.addAll({'authorization': 'Bearer $token'});
    }
    print('url:$url, body:$body, token=$token');
    http.Response response = await http.put(Uri.parse(url),body: body,headers:headers );
    if(response.statusCode==200){
     Map<String, dynamic> data= jsonDecode(response.body);
     print(data);
     return data;
    }
    else{
      throw Exception('this is error in statusCode ${response.statusCode} with body${jsonDecode(response.body)}');
    }


  }

}
