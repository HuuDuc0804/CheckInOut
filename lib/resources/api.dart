import 'dart:convert';

import '../models/model.dart';
import 'package:http/http.dart' show Client;

class CheckInOutAPI {
  Client client = Client();
  final _baseURL = 'http://103.17.88.114:8169/api';
  // final _baseURL = 'http://10.0.9.182:8168/api';

  Future<List<CheckInOutModel>> getList() async {
    final response = await client.get(Uri.parse('$_baseURL/CheckInOut'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<CheckInOutModel>((json) => CheckInOutModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load Spin Wheel');
    }
  }

  Future<String> update() async {
    Map data = {"UserEnrollNumber": 959};
    final body = json.encode(data);
    final response = await client.post(
      Uri.parse('$_baseURL/CheckInOut'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    return response.body;
  }
}
