import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import '../models/PagesModel.dart';

class KriyaApiProvider {

  Client client = Client();
  final baseUrl = "http://api-labdev.kriyapeople.com/api/v1";

  Future<PagesModel> fetchPagesById(String pagesId) async {
    final response = await client.get("$baseUrl/pages/$pagesId");

    if (response.statusCode == 200) {
      return PagesModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load pages');
    }
  }

}