// To parse this JSON data, do
//
//     final pagesModel = pagesModelFromJson(jsonString);

import 'dart:convert';

PagesModel pagesModelFromJson(String str) => PagesModel.fromJson(json.decode(str));

String pagesModelToJson(PagesModel data) => json.encode(data.toJson());

class PagesModel {
  String status;
  dynamic message;
  List<Datum> data;
  int elapsed;

  PagesModel({
    this.status,
    this.message,
    this.data,
    this.elapsed,
  });

  factory PagesModel.fromJson(Map<String, dynamic> json) => PagesModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    elapsed: json["elapsed"] == null ? null : json["elapsed"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "elapsed": elapsed == null ? null : elapsed,
  };
}

class Datum {
  String id;
  List<Block> blocks;
  int number;
  String lessonId;

  Datum({
    this.id,
    this.blocks,
    this.number,
    this.lessonId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] == null ? null : json["id"],
    blocks: json["blocks"] == null ? null : List<Block>.from(json["blocks"].map((x) => Block.fromJson(x))),
    number: json["number"] == null ? null : json["number"],
    lessonId: json["lesson_id"] == null ? null : json["lesson_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "blocks": blocks == null ? null : List<dynamic>.from(blocks.map((x) => x.toJson())),
    "number": number == null ? null : number,
    "lesson_id": lessonId == null ? null : lessonId,
  };
}

class Block {
  String type;
  List<Answer> answer;
  Content content;

  Block({
    this.type,
    this.answer,
    this.content,
  });

  factory Block.fromJson(Map<String, dynamic> json) => Block(
    type: json["type"] == null ? null : json["type"],
    answer: json["answer"] == null ? null : List<Answer>.from(json["answer"].map((x) => Answer.fromJson(x))),
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "answer": answer == null ? null : List<dynamic>.from(answer.map((x) => x.toJson())),
    "content": content == null ? null : content.toJson(),
  };
}

class Answer {
  int the0;
  int the1;
  int the2;
  String answer;
  bool isChoosed;
  int containerColor;
  int optionColor;
  int optionsTextColor;
  int seperatedColor;
  int answerTextColor;

  Answer({
    this.the0,
    this.the1,
    this.the2,
    this.answer,
    this.isChoosed,
    this.containerColor,
    this.optionColor,
    this.optionsTextColor,
    this.seperatedColor,
    this.answerTextColor,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    the0: json["0"] == null ? null : json["0"],
    the1: json["1"] == null ? null : json["1"],
    the2: json["2"] == null ? null : json["2"],
    answer: json["answer"] == null ? null : json["answer"],
    isChoosed: json['isChoosed'] == null ? false : json['isChoosed'],
    containerColor: json['containerColor'] == null ? 0xffffffff : json['containerColor'],
    optionColor: json['optionColor'] == null ? 0xffE5E5E5 : json['optionColor'],
    optionsTextColor: json['optionsTextColor'] == null ? 0xffffffff : json['optionsTextColor'],
    seperatedColor: json['seperatedColor'] == null ? 0xffE5E5E5 : json['seperatedColor'],
    answerTextColor: json['answerTextColor'] == null ? 0xff8B8B8B : json['answerTextColor'],
  );

  Map<String, dynamic> toJson() => {
    "0": the0 == null ? null : the0,
    "1": the1 == null ? null : the1,
    "2": the2 == null ? null : the2,
    "answer": answer == null ? null : answer,
    "isChoosed": isChoosed == null ? null : isChoosed,
  };
}

class Content {
  List<Answer> choices;
  bool isShuffle;
  String correctFeedback;
  int allCorrectScore;
  String incorrectFeedback;

  Content({
    this.choices,
    this.isShuffle,
    this.correctFeedback,
    this.allCorrectScore,
    this.incorrectFeedback,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    choices: json["choices"] == null ? null : List<Answer>.from(json["choices"].map((x) => Answer.fromJson(x))),
    isShuffle: json["is_shuffle"] == null ? null : json["is_shuffle"],
    correctFeedback: json["correct_feedback"] == null ? null : json["correct_feedback"],
    allCorrectScore: json["all_correct_score"] == null ? null : json["all_correct_score"],
    incorrectFeedback: json["incorrect_feedback"] == null ? null : json["incorrect_feedback"],
  );

  Map<String, dynamic> toJson() => {
    "choices": choices == null ? null : List<dynamic>.from(choices.map((x) => x.toJson())),
    "is_shuffle": isShuffle == null ? null : isShuffle,
    "correct_feedback": correctFeedback == null ? null : correctFeedback,
    "all_correct_score": allCorrectScore == null ? null : allCorrectScore,
    "incorrect_feedback": incorrectFeedback == null ? null : incorrectFeedback,
  };
}
