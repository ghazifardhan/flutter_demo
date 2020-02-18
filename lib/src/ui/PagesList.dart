import 'package:flutter/material.dart';
import 'package:flutter_demo/src/App.dart';
import '../models/PagesModel.dart';
import '../blocs/PagesBloc.dart';

class PagesList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return PagesListState();
  }
}

class PagesListState extends State<PagesList> with SingleTickerProviderStateMixin {
  
  final pagesBloc = PagesBloc();

  var isSubmit = false;
  AnimationController _controller;
  Animation _animation;
  CurvedAnimation _curve;

  @override
  void initState() {
    
    pagesBloc.fetchPagesById("359a6d0e-2794-4a91-bf59-3ae8bfa7430e");

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    ///Providing our animation with a curve (Parent here is the controller
    ///above)
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    ///Creating a Tween animation with start and end values for the
    ///opacity and providing it with our animation controller
    _animation = Tween(
      begin: 0.0,
      end: 2.0,
    ).animate(_curve);

    ///Set a status listener to our animation to control the behaviour
    ///of our animation
//    _animation.addStatusListener((status) {
//      if (status == AnimationStatus.completed)
//        _controller.reverse();
//      else if (status == AnimationStatus.dismissed) _controller.forward();
//    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    pagesBloc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Pages"),
      ),
      body: new Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: StreamBuilder(
                stream: pagesBloc.pagesById,
                builder: (context, AsyncSnapshot<PagesModel> snapshot) {
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
            ),
            isSubmit ?
                pagesBloc.correctAnswer.value ?
                  containerOnTrueAnswer()
                :
                  containerOnFalseAnswer()
            : SizedBox(
              height: 0,
              width: 0,
            )
          ],
        )
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(0.0),
        child: Container(
          height: 45,
          decoration: new BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(
                color: Colors.grey,
                blurRadius: 0.25
            )]
          ),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: InkWell(
            onTap: () {
              pagesBloc.checkAnswer();
              setState(() {
                isSubmit = true;
              });
              _controller.forward();

              print("Jawaban ${pagesBloc.correctAnswer.value}");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  this.isSubmit ? "Next" : "Submit",
                  style: TextStyle(
                      color: Color(0xff109CD8),
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Color(0xff109CD8),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<PagesModel> snapshot) {

    int optionText = "A".codeUnitAt(0);

    return ListView.builder(
      itemCount: snapshot.data.data[0].blocks[0].content.choices.length,
      itemBuilder: (BuildContext context, int index) {

        int incOptionText = optionText++;

        return Container(
          margin: EdgeInsets.all(10),
          height: 55,
          padding: EdgeInsets.all(12),
          decoration: new BoxDecoration(
            color: Color(snapshot.data.data[0].blocks[0].content.choices[index].containerColor),
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: [BoxShadow(
              color: Colors.grey,
              blurRadius: 0.25
            )]
          ),
          child: InkWell(
            onTap: () {
              this.onClickOption(snapshot, index);
//              if (!this.isSubmit) {
//                this.onClickOption(snapshot, index);
//              }
            },
            child: Row(
              children: <Widget>[
                Container(
                  width: 20,
                  height: 20,
                  decoration: new BoxDecoration(
                      color: Color(snapshot.data.data[0].blocks[0].content.choices[index].optionColor),
                      shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Text(
                      String.fromCharCode(incOptionText),
                      style: TextStyle(
                          color: Color(snapshot.data.data[0].blocks[0].content.choices[index].optionsTextColor),
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 12, right: 15),
                  width: 2,
                  decoration: new BoxDecoration(
                      color: Color(snapshot.data.data[0].blocks[0].content.choices[index].seperatedColor),
                      shape: BoxShape.rectangle
                  ),
                ),
                Text(
                    snapshot.data.data[0].blocks[0].content.choices[index].answer,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(snapshot.data.data[0].blocks[0].content.choices[index].answerTextColor),
                      fontSize: 14,
                    )
                ),
              ],
            ),
          )
        );
      }
    );
  }

  onClickOption(AsyncSnapshot<PagesModel> snapshot, int index) {
    pagesBloc.updatePagesContent(index);
  }

  Widget containerOnTrueAnswer() {
    return Flexible(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(12),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: Color(0xff82D96C),
                width: 1,
                style: BorderStyle.solid
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 25,
                height: 25,
                child: Icon(
                  Icons.check_circle,
                  color: Color(0xff82D96C),
                  size: 25,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Text(
                    pagesBloc.feedback.value,
                    style: TextStyle(
                      color: Color(0xff82D96C),
                      fontSize: 12,
                    )
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget containerOnFalseAnswer() {

    return Flexible(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(12),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: Color(0xffF26253),
                  width: 1,
                  style: BorderStyle.solid
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 25,
                  height: 25,
                  decoration: new BoxDecoration(
                      color: Color(0xffF26253),
                      shape: BoxShape.circle
                  ),
                  child: Icon(
                    Icons.close,
                    color: Color(0xffffffff),
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                      pagesBloc.feedback.value,
                      style: TextStyle(
                        color: Color(0xffF26253),
                        fontSize: 12,
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

}