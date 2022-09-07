import 'package:adessua/services/db.dart';
import 'package:adessua/ui/auth/auth.dart';
import 'package:adessua/ui/components/light_color.dart';
import 'package:adessua/ui/quiz/quiz_play.dart';
import 'package:flutter/material.dart';

class QuizTab extends StatefulWidget {
  @override
  _QuizTabState createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  Widget quizList() {
    return Container(
      child: Column(
        children: [
          StreamBuilder(
            stream: quizStream,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return QuizCard(
                          noOfQuestions: snapshot.data.docs.length,
                          noOfQuestion: snapshot.data.docs[index]
                              ['noOfQuestion'],
                          quizTitle: snapshot.data.docs[index]['quizTitle'],
                          quizDesc: snapshot.data.docs[index]['quizDesc'],
                          quizId: snapshot.data.docs[index]["quizId"],
                        );
                      });
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    databaseService.getQuizData().then((value) {
      quizStream = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: quizList(),
    );
  }
}

class QuizCard extends StatelessWidget {
  final String quizTitle, quizId, quizDesc, noOfQuestion;
  final int noOfQuestions;

  QuizCard(
      {@required this.quizTitle,
      @required this.noOfQuestion,
      @required this.quizDesc,
      @required this.quizId,
      @required this.noOfQuestions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PlayQuiz(quizId);
          }));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              child: Container(
                color: LightColor.navyBlue1,
                child: Stack(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 30, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  quizTitle,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: LightColor.yellow2),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  quizDesc,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: 120,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    border: Border.all(
                                        color: Colors.white, width: 1)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text(noOfQuestion,
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ))
                          ],
                        )),
                    Positioned(
                      left: -190,
                      top: -190,
                      child: CircleAvatar(
                        radius: 130,
                        backgroundColor: LightColor.lightBlue2,
                      ),
                    ),
                    Positioned(
                      left: -200,
                      top: -200,
                      child: CircleAvatar(
                        radius: 130,
                        backgroundColor: LightColor.lightBlue1,
                      ),
                    ),
                    Positioned(
                      right: -190,
                      bottom: -190,
                      child: CircleAvatar(
                        radius: 130,
                        backgroundColor: LightColor.yellow2,
                      ),
                    ),
                    Positioned(
                      right: -200,
                      bottom: -200,
                      child: CircleAvatar(
                        radius: 130,
                        backgroundColor: LightColor.yellow,
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
