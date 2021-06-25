//------------------------- IMPORTED MODULES -------------------------//
import 'dart:convert';

import 'package:http/http.dart' as http;

//------------------------ CLASS DECLARATION -------------------------//
class Network {
  final String url;

  Network(this.url);

  /*--------------------- GET REQUESTS ---------------------*/
  Future fetchData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
       print('Status Code: ${response.statusCode}');
    }
  }

}

//------------------------------- EOF -------------------------------//