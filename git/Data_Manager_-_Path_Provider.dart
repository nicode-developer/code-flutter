import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DataManager {
  static Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  static Future<File> saveData(List<Map<String, dynamic>> datas) async {
    String data = json.encode(datas);

    final file = await getFile();
    return file.writeAsString(data);
  }

  static Future<List?> readData() async {
    try {
      final file = await getFile();
      final data = await file.readAsString();
      return json.decode(data);
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
