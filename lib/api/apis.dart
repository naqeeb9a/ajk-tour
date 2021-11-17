import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class ApiData {
  getDistrictList() async {
    var url = Uri.https('ajktour.cmcmtech.com', 'api/districts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      return jsonResponse["data"];
    } else {
      return false;
    }
  }
}
