import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class MockService {
  Future<dynamic> loadMock(String path) async {
    final data = await rootBundle.loadString(path);
    return json.decode(data);
  }
}
