import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/name.dart';

class Api_Name {
  static Future<Name?> getData(String parameters) async {
    try {
      var url = Uri.parse('http://networkservice.net/api/$parameters');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        return Name.fromJson(json.decode(response.body));
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
