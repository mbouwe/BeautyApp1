import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi{
  final String _url ='http://api.standard-beauty.afrixcel.co.za/';


  postData(data,apiUrl) async{
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.post(
       Uri.parse(fullUrl) ,
        body: jsonDecode(data),
      headers: _setHeaders()
    );
  }
  getData(apiUrl) async{
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.get(
        Uri.parse(fullUrl) ,
        headers: _setHeaders()
    );
  }

  _setHeaders()=>{
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };
  _getToken() async{
    SharedPreferences localsStorage = await SharedPreferences.getInstance();
    var token = localsStorage.getString('token');
    return '?token=$token';
  }

}