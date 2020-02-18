import 'package:flutter/material.dart';
import '../models/ItemModel.dart';
import '../models/TrailerModel.dart';
import '../blocs/MovieDetailBlocProvider.dart';
import '../blocs/MoviesBloc.dart';
import '../blocs/NewsBloc.dart';
import 'MovieDetail.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

class MovieListState extends State<MovieList> {

  final newsBloc = NewsBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();

    newsBloc.fetchAllNews();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: new Container(
        child: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            print('Has error: ${snapshot.hasError}');
            print('Has data: ${snapshot.hasData}');
            print('Snapshot Data ${snapshot.data}');

            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      )
//      body: StreamBuilder(
//        stream: bloc.allMovies,
//        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
//          if (snapshot.hasData) {
//            return buildList(snapshot);
//          } else if (snapshot.hasError) {
//            return Text(snapshot.error.toString());
//          }
//          return Center(child: CircularProgressIndicator());
//        },
//      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: InkResponse(
            enableFeedback: true,
            child: Image.network(
              'https://image.tmdb.org/t/p/w185${snapshot.data
                    .results[index].poster_path}',
              fit: BoxFit.cover
            ),
            onTap: () => openDetailPage(snapshot.data, index),
          ),
        );
      },
    );
  }

  openDetailPage(ItemModel data, int index) {
    final page = MovieDetailBlocProvider(
      child: MovieDetail(
        title: data.results[index].title,
        posterUrl: data.results[index].backdrop_path,
        description: data.results[index].overview,
        releaseDate: data.results[index].release_date,
        voteAverage: data.results[index].vote_average.toString(),
        movieId: data.results[index].id,
      )
    );

    // Create Toast
    Fluttertoast.showToast(
        msg: data.results[index].title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) {
        return page;
      })
    );
  }
}