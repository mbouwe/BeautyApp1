import 'package:http/http.dart' as http;

class Savedata {
  Future<bool> addImage(Map<String, String> body, String filepath,String userid,String challengeid) async {
    String addimageUrl = 'http://api.standard-beauty.afrixcel.co.za/api/save_challenges_progress/${userid}/${challengeid}';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    var response = await request.send();
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}