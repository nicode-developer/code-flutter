import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/name.dart';

class NameService {
  // GET
  static Future<Name?> getData({String? id = ''}) async {
    try {
      var url = Uri.parse('http://networkservice.net/api/names/$id');
      http.Response response = await http.get(
        url,
        /*headers: {
          HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
        },*/
      );
      
      if (response.statusCode == 200) {
        return Name.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load name.');
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
  
  // POST
  static Future<Name?> postData({String title}) async {
    try {
      modelName = Name(title: title);
      
      var url = Uri.parse('http://networkservice.net/api/names');
      http.Response response = await http.post(
        url,
        /*headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },*/
        body: jsonEncode(modelName.toJson()),
      );
      
      if (response.statusCode == 201) {
        return Name.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create name.');
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
  
  // PUT
  static Future<Name?> putData({required String id, String newTitle}) async {
    try {
      modelName = Name(title: newTitle);
      
      var url = Uri.parse('http://networkservice.net/names/$id');
      http.Response response = await http.put(
        url,
        /*headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },*/
        body: jsonEncode(modelName.toJson()),
      );
      
      if (response.statusCode == 200) {
        return Name.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to update name.');
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
  
  // DELETE
  static Future<Name?> deleteData({required String id}) async {
    try {      
      var url = Uri.parse('http://networkservice.net/names/$id');
      http.Response response = await http.delete(
        url,
        /*headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },*/
      );
      
      if (response.statusCode == 200) {
        return Name.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to delete name.');
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}

------------------------------------------------------------------------------------

class Name {
  String? title;

  Name({this.title});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}