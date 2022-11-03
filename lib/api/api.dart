import 'dart:convert';

import 'package:http/http.dart' as http;


class CallApi{
  final String _url = 'http://api.standard-beauty.afrixcel.co.za/api/';

  postData(data,apiUrl) async{
    var fullUrl = _url + apiUrl;
    return await http.post(
        Uri.parse(fullUrl),
      body: json.encode(data),
        headers: _setHeaders()

    );
  }

  getData(apiUrl) async{
    var fullUrl = _url + apiUrl;
    return await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders()
    );
  }

  update(apiUrl,String firstname,String surname,String address,String phone,filepath) async{
    var fullUrl = _url + apiUrl;
    var request = http.MultipartRequest('PATCH',Uri.parse(fullUrl) );
    request.fields['firstname'] = firstname;
    request.fields['surname'] = surname;
    request.fields['address'] = address;
    request.fields['cell_number'] = phone;
    if(filepath!=''){
      request.files.add(await http.MultipartFile('foto',filepath,200));
    }
    headers: _setHeaders();
    request.headers.addAll(
      {
        'Content-type' : 'application/json',
        'Accept' : 'application/json',
      }
    );
  }

  delete(apiUrl) async{
    var fullUrl = _url + apiUrl;
   return await http.delete(
     Uri.parse(fullUrl),
     headers: _setHeaders()
   );

  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };

}