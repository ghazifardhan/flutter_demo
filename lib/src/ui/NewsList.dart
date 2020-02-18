import 'package:flutter/material.dart';
import '../models/NewsListModel.dart';
import '../blocs/NewsBloc.dart';

class NewsList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return NewsListState();
  }

}

class NewsListState extends State<NewsList> {

  final newsBloc = NewsBloc();

  @override
  void initState() {
    super.initState();

    newsBloc.fetchAllNews();
  }

  @override
  void dispose() {
    newsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("News List"),
      ),
      body: new Container(
        child: StreamBuilder(
          stream: newsBloc.allNews,
          builder: (context, AsyncSnapshot<NewsListModel> snapshot) {
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
        )
      ),
    );
  }

  Widget buildList(AsyncSnapshot<NewsListModel> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10),
            height: 150,
            decoration: new BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network(
                      snapshot.data.data[index].beritaMedia[0].thumbnail,
                      fit: BoxFit.cover,
                      height: 20,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    snapshot.data.data[index].beritaMedia[0].thumbnail,
                    fit: BoxFit.cover,
                    height: 100,
                  )
                )
              ],
            )
//            child: ClipRRect(
//              borderRadius: BorderRadius.circular(10.0),
//              child: Image.network(
//                snapshot.data.data[index].beritaMedia[0].thumbnail,
//                fit: BoxFit.cover,
//                width: 100,
//                height: 100,
//              )
//            )
          );
        },
    );
  }

}