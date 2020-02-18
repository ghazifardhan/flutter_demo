import 'package:flutter/material.dart';
import 'ui/MovieList.dart';
import 'ui/NewsList.dart';
import 'ui/PagesList.dart';

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: PagesList(),
      ),
    );
  }

}