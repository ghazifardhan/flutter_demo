import '../resources/Repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/PagesModel.dart';

class PagesBloc {

  final repository = Repository();
  final pagesFetcher = BehaviorSubject<PagesModel>();
  final correctAnswer = BehaviorSubject<bool>();
  final feedback = BehaviorSubject<String>();

  Observable<PagesModel> get pagesById => pagesFetcher.stream;
  Observable<bool> get isCorrectAnswer => correctAnswer.stream;
  Observable<String> get getFeedback => feedback.stream;

  fetchPagesById(String pagesId) async {
    PagesModel items = await repository.fetchPagesById(pagesId);
    pagesFetcher.sink.add(items);
  }

  void updatePagesContent(int index) {
    final data = pagesFetcher.value;
    if (data == null) return;

    data.data[0].blocks[0].content.choices[index].isChoosed = !data.data[0].blocks[0].content.choices[index].isChoosed;

    for (var i = 0; i < data.data[0].blocks[0].content.choices.length; i++) {
      if (i == index) {
        if (data.data[0].blocks[0].content.choices[i].isChoosed) {
          data.data[0].blocks[0].content.choices[i].containerColor = 0xff109CD8;
          data.data[0].blocks[0].content.choices[i].optionColor = 0xffffffff;
          data.data[0].blocks[0].content.choices[i].optionsTextColor = 0xff109CD8;
          data.data[0].blocks[0].content.choices[i].seperatedColor = 0xffffffff;
          data.data[0].blocks[0].content.choices[i].answerTextColor = 0xffffffff;
        } else {
          data.data[0].blocks[0].content.choices[i].containerColor = 0xffffffff;
          data.data[0].blocks[0].content.choices[i].optionColor = 0xffE5E5E5;
          data.data[0].blocks[0].content.choices[i].optionsTextColor = 0xffffffff;
          data.data[0].blocks[0].content.choices[i].seperatedColor = 0xffE5E5E5;
          data.data[0].blocks[0].content.choices[i].answerTextColor = 0xff8B8B8B;
        }
      } else {
        data.data[0].blocks[0].content.choices[i].isChoosed = false;
        data.data[0].blocks[0].content.choices[i].containerColor = 0xffffffff;
        data.data[0].blocks[0].content.choices[i].optionColor = 0xffE5E5E5;
        data.data[0].blocks[0].content.choices[i].optionsTextColor = 0xffffffff;
        data.data[0].blocks[0].content.choices[i].seperatedColor = 0xffE5E5E5;
        data.data[0].blocks[0].content.choices[i].answerTextColor = 0xff8B8B8B;
      }
    }

    pagesFetcher.sink.add(data);
  }

  void result() {
    var isAnswerTrue = this.checkAnswer();

    if (isAnswerTrue) {
      print("Wow jawaban anda benar");
    } else {
      print("Aduh jawaban anda salah");
    }
  }

  checkAnswer() {
    final data = pagesFetcher.value;

    int value = 0;
    int selectedAnswer = 0;

    for (var i = 0; i < data.data[0].blocks[0].content.choices.length; i++) {
      if (data.data[0].blocks[0].content.choices[i].isChoosed) {
        if (data.data[0].blocks[0].content.choices[i].the0 != null) {
          value = data.data[0].blocks[0].content.choices[i].the0;
        } else if (data.data[0].blocks[0].content.choices[i].the1 != null) {
          value = data.data[0].blocks[0].content.choices[i].the1;
        } else if (data.data[0].blocks[0].content.choices[i].the2 != null) {
          value = data.data[0].blocks[0].content.choices[i].the2;
        }
        selectedAnswer = i;
      }
    }

    if (value > 0) {
      data.data[0].blocks[0].content.choices[selectedAnswer].containerColor = 0xff82D96C;
      data.data[0].blocks[0].content.choices[selectedAnswer].optionColor = 0xffffffff;
      data.data[0].blocks[0].content.choices[selectedAnswer].optionsTextColor = 0xff82D96C;
      data.data[0].blocks[0].content.choices[selectedAnswer].seperatedColor = 0xffffffff;
      data.data[0].blocks[0].content.choices[selectedAnswer].answerTextColor = 0xffffffff;

      correctAnswer.sink.add(true);
      feedback.sink.add(data.data[0].blocks[0].content.correctFeedback);
    } else {
      data.data[0].blocks[0].content.choices[selectedAnswer].containerColor = 0xffF26253;
      data.data[0].blocks[0].content.choices[selectedAnswer].optionColor = 0xffffffff;
      data.data[0].blocks[0].content.choices[selectedAnswer].optionsTextColor = 0xffF26253;
      data.data[0].blocks[0].content.choices[selectedAnswer].seperatedColor = 0xffffffff;
      data.data[0].blocks[0].content.choices[selectedAnswer].answerTextColor = 0xffffffff;

      correctAnswer.sink.add(false);
      feedback.sink.add(data.data[0].blocks[0].content.incorrectFeedback);
    }


    pagesFetcher.sink.add(data);
  }

  dispose() {
    pagesFetcher.close();
    correctAnswer.close();
    feedback.close();
  }

}