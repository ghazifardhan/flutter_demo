import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import '../models/NewsListModel.dart';
import '../models/NewsDetailModel.dart';

class IdaApiProvider {

  Client client = Client();
  final _baseUrl = 'http://infodarianda.com';

  Future<NewsListModel> fetchMovieList() async {

    Response response;

    try {

      response = await client.get("$_baseUrl/api/beritas");

      if (response.statusCode == 200) {

        print("News Fetched");

        return NewsListModel.fromJson(json.decode(response.body));
      }


    } on Exception catch(e) {
      throw e.toString();
    }

  }

}