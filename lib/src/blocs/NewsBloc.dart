import '../resources/Repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/NewsListModel.dart';

class NewsBloc {

  final _repository = Repository();
  final _newsFetcher = PublishSubject<NewsListModel>();

  Observable<NewsListModel> get allNews => _newsFetcher.stream;

  fetchAllNews() async {
    NewsListModel items = await _repository.fetchAllNews();
    _newsFetcher.sink.add(items);
  }

  dispose() {
    _newsFetcher.close();
  }

}