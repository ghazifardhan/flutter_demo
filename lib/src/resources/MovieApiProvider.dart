import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import '../models/ItemModel.dart';
import '../models/TrailerModel.dart';

class MovieApiProvider {

  Client client = Client();
  final _apiKey = 'e0f3eed510af703897833efec0c03757';
  final _baseUrl = 'https://api.themoviedb.org/3/movie';

  Future<ItemModel> fetchMovieList() async {
    Response response;
    if (_apiKey == 'e0f3eed510af703897833efec0c03757') {
      response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    } else {
      throw Exception('Please add your API Key');
    }

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response =
        await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}