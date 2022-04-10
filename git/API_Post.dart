import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/name.dart';

class Api_Name {  
  static Future<Name?> postData(String parameters) async {
    try {
      modelName = Name(title: parameters);
      
      var url = Uri.parse('http://networkservice.net/api/');
      http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }
        body: jsonEncode(modelName.toJson()),
      );
      
      if (response.statusCode == 201) {
        return Name.fromJson(json.decode(response.body));
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}