import 'dart:async';
import 'MovieApiProvider.dart';
import 'IdaApiProvider.dart';
import 'KriyaApiProvider.dart';
import '../models/ItemModel.dart';
import '../models/TrailerModel.dart';
import '../models/NewsListModel.dart';
import '../models/PagesModel.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  final idaApiProvider = IdaApiProvider();
  final kriyaApiProvider = KriyaApiProvider();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);

  Future<NewsListModel> fetchAllNews() => idaApiProvider.fetchMovieList();

  Future<PagesModel> fetchPagesById(String pagesId) => kriyaApiProvider.fetchPagesById(pagesId);
}