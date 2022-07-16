import 'dart:developer';
import 'constants.dart' as constants;
import 'package:http/http.dart' as http;

class ApiService {
  Future getUsers() async {
    try {
      var url = Uri.parse(constants.url + "hai");
      log(url.toString());
      var response = await http.get(url);

      log("Hello = " + response.body.toString());
      return response.body;
    } catch (e) {
      log(e.toString());
    }
  }
}
