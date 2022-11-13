import 'dart:convert';

import 'package:http/http.dart' as http;

fetchdata() async {
  http.Response response = await http.get(Uri.parse('http://10.0.2.2:5000/'));
  return response.body;

}

