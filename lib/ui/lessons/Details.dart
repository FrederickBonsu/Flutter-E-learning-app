import 'package:adessua/models/lesson_model.dart';
import 'package:adessua/services/db.dart';
import 'package:adessua/controllers/video.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Details extends StatefulWidget {
  final String id;

  Details(
    this.id,
  );

  @override
  _DetailsState createState() => _DetailsState();
}

Stream courseStream;

class _DetailsState extends State<Details> {
  DatabaseService _databaseService = new DatabaseService();
  QuerySnapshot querySnapshot;

  bool _isLoading = true;

  LessonModel getLessonModelFromSnapshot(DocumentSnapshot lessonSnapshot) {
    LessonModel lessonModel = new LessonModel();
    lessonModel.topicName = lessonSnapshot["topicName"];
    lessonModel.section = lessonSnapshot["section"];
    lessonModel.hours = lessonSnapshot["hours"];
    lessonModel.videoFile = lessonSnapshot["videoFile"];

    return lessonModel;
  }

  @override
  void initState() {
    _databaseService.getLessonData(widget.id).then((value) {
      querySnapshot = value;

      _isLoading = false;
      setState(() {});
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    courseStream = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Color.fromRGBO(17, 36, 56, 1.0),
                            ),
                            child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/img2.png'),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    querySnapshot.docs == null
                        ? Container(
                            child: Center(
                              child: Text("No Lesson Available",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red)),
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: querySnapshot.docs.length,
                            itemBuilder: (context, index) {
                              return LessonTile(
                                lessonModel: getLessonModelFromSnapshot(
                                    querySnapshot.docs[index]),
                              );
                            })
                  ],
                ),
              ),
            ),
    );
  }
}

class LessonTile extends StatefulWidget {
  final LessonModel lessonModel;
  LessonTile({this.lessonModel});

  @override
  _LessonTileState createState() => _LessonTileState();
}

class _LessonTileState extends State<LessonTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return VideoDisplay(
              videoUrl: widget.lessonModel.videoFile,
            );
            // return  VideoDisplay(videoUrl: '',);
          }));
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color.fromRGBO(17, 36, 56, 1.0),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.lessonModel.topicName,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.lessonModel.section,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.lessonModel.hours,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.indigo, shape: BoxShape.circle),
                    child: CircularPercentIndicator(
                      backgroundColor: Colors.blueGrey,
                      radius: 43.0,
                      lineWidth: 2.0,
                      animation: true,
                      center: Icon(Icons.play_arrow, color: Colors.blue),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.blue,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
